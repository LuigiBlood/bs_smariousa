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

empty_oam_buffer:
	php
	rep #$30
	lda.w #$E0E0
	ldx.w #$021E
-;	sta.w oam_buffer,x
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
	uploadToVRAM(map_buffer, $0C00, $800)
	rep #$20
	lda.w #0
	sta.l upload_map_flag
+;	rts

init_ppu:
	php
	jsr empty_oam_buffer
	sep #$20
	lda.b #$01; sta.w mirror_BGMODE		//Mode 1, 8x8
	lda.b #$0C; sta.w mirror_BG1SC		//BG1: MAP 0x0C00, 32x32
	lda.b #$10; sta.w mirror_BG2SC		//BG1: MAP 0x1000, 32x32
	lda.b #$14; sta.w mirror_BG3SC		//BG1: MAP 0x1400, 32x32
	lda.b #$18; sta.w mirror_BG4SC		//BG1: MAP 0x1800, 32x32
	lda.b #$00; sta.w mirror_BG12NBA	//BG1: CHR 0x0000
										//BG2: CHR 0x0000
	lda.b #$00; sta.w mirror_BG34NBA	//BG3: CHR 0x0000
										//BG4: CHR 0x0000
	lda.b #$11; sta.w mirror_TM			//Display BG0 and OBJ (Main)
	lda.b #$11; sta.w mirror_TS			//Display BG0 and OBJ (Sub)
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

	rep #$20; lda.w mirror_BG3HOFS
	sep #$20; sta.w BG3HOFS
	xba; sta.w BG3HOFS

	rep #$20; lda.w mirror_BG3VOFS
	sep #$20; sta.w BG3VOFS
	xba; sta.w BG3VOFS

	lda.w mirror_INIDISP; sta.w INIDISP

	plp
	rts
