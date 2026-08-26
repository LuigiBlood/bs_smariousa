state_logo_init:
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

	lda.w #30; sta.w wait_counter		//wait 0.5 second

	sep #$20
	lda.b #$10; sta.w mirror_TM			//Display only OBJ (Main)
	lda.b #$10; sta.w mirror_TS			//Display only OBJ (Sub)
	lda.b #$03; sta.w mirror_OBSEL		//OBJ: CHR 0xC000

	stz.w mirror_INIDISP
	rts

state_logo_sfx:
	rep #$20
	lda.w #60+30; sta.w wait_counter		//wait 1.5 second
	inc.w menu_state
	sep #$20
	lda.b #$01;	sta.w mirror_APUIO3
	rts

logo_oam_tbl2:
	db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$0A
logo_oam_tbl2_end:
