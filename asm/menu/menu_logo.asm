logo_state00:
	jsr empty_oam_buffer
	uploadToWRAM($80A01E, pal_buffer+$120, $40)
	uploadToVRAM($9B8000, $6600, 0x1400)
	uploadToWRAM($80A0B4, oam_buffer, $98)
	uploadToWRAM(logo_oam_tbl2, oam_buffer+$200, logo_oam_tbl2_end-logo_oam_tbl2)
	rep #$20
	lda.w #0; sta.l pal_buffer

	rep #$20
	inc.w menu_state
	inc.w upload_pal_flag

	lda.w #60*2; sta.w wait_counter

	sep #$20
	lda.b #$10; sta.w mirror_TM			//Display BG1&2 and OBJ (Main)
	lda.b #$10; sta.w mirror_TS			//Display BG1 and OBJ (Sub)
	lda.b #$03; sta.w mirror_OBSEL		//OBJ: CHR 0xC000

	stz.w mirror_INIDISP
	rts

logo_state01:
	rep #$20
	dec.w wait_counter
	bpl +
	inc.w menu_state
+;	rts

logo_oam_tbl2:
	db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$0A
logo_oam_tbl2_end: