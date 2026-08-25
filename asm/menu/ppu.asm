constant map_buffer = $7F0000

allocateWRAM(oam_buffer, $220)
allocateWRAM(pal_buffer, $200)

allocateWRAM(upload_oam_flag, 2)
allocateWRAM(upload_pal_flag, 2)
allocateWRAM(upload_map_flag, 2)

allocateWRAM(mirror_BGMODE, 1)
allocateWRAM(mirror_BG1SC, 1)
allocateWRAM(mirror_BG2SC, 1)
allocateWRAM(mirror_BG3SC, 1)
allocateWRAM(mirror_BG4SC, 1)
allocateWRAM(mirror_BG12NBA, 1)
allocateWRAM(mirror_BG34NBA, 1)
allocateWRAM(mirror_TM, 1)
allocateWRAM(mirror_TS, 1)
allocateWRAM(mirror_INIDISP, 1)
allocateWRAM(mirror_BG3HOFS, 2)
allocateWRAM(mirror_BG3VOFS, 2)
allocateWRAM(mirror_OBSEL, 1)

empty_oam_buffer:
	php
	rep #$30
	lda.w #$F000
	ldx.w #$0200-2
-;	stz.w oam_buffer,x
	dex; dex
	sta.w oam_buffer,x
	dex; dex
	bpl -

	ldx.w #$0020-2
-;	stz.w oam_buffer+$200,x
	dex; dex
	bpl -
	plp
	rts

upload_oam_buffer:
	rep #$20
	stz.w OAMADDL
	lda.l upload_oam_flag
	beq +
	setupDMA(7, oam_buffer, OAMDATA, $220, $02)
	startDMA($80)
	rep #$20
	lda.w #0
	sta.l upload_pal_flag
+;	rts

upload_pal_buffer:
	rep #$20
	lda.l upload_pal_flag
	beq +
	uploadToCGRAM(pal_buffer, $00, $200)
	rep #$20
	lda.w #0
	sta.l upload_pal_flag
+;	rts

upload_map_buffer:
	rep #$20
	lda.l upload_map_flag
	beq +
	uploadToVRAM(map_buffer, $2000, $800)
	rep #$20
	lda.w #0
	sta.l upload_map_flag
+;	rts

init_ppu:
	php
	jsr empty_oam_buffer
	sep #$20
	stz.w mirror_BGMODE
	stz.w mirror_BG1SC
	stz.w mirror_BG2SC
	stz.w mirror_BG3SC
	stz.w mirror_BG4SC
	stz.w mirror_BG12NBA
	stz.w mirror_BG34NBA
	stz.w mirror_TM
	stz.w mirror_TS
	stz.w mirror_OBSEL
	lda.b #$80;	sta.w mirror_INIDISP

	rep #$30
	stz.w mirror_BG3HOFS
	stz.w mirror_BG3VOFS

	lda.w #$0001
	sta.l upload_oam_flag
	sta.l upload_pal_flag
	plp
	rts

update_ppu:
	php
	sep #$20
	lda.b #$80; sta.w INIDISP

	jsr upload_pal_buffer
	jsr upload_oam_buffer
	jsr upload_map_buffer

	sep #$20
	lda.w mirror_BGMODE; sta.w BGMODE
	lda.w mirror_BG1SC; sta.w BG1SC
	lda.w mirror_BG2SC; sta.w BG2SC
	lda.w mirror_BG3SC; sta.w BG3SC
	lda.w mirror_BG4SC; sta.w BG4SC
	lda.w mirror_BG12NBA; sta.w BG12NBA
	lda.w mirror_BG34NBA; sta.w BG34NBA
	lda.w mirror_TM; sta.w TM
	lda.w mirror_TS; sta.w TS
	lda.w mirror_OBSEL; sta.w OBSEL

	rep #$20; lda.w mirror_BG3HOFS
	sep #$20; sta.w BG3HOFS
	xba; sta.w BG3HOFS

	rep #$20; lda.w mirror_BG3VOFS
	sep #$20; sta.w BG3VOFS
	xba; sta.w BG3VOFS

	lda.w mirror_INIDISP; sta.w INIDISP

	plp
	rts
