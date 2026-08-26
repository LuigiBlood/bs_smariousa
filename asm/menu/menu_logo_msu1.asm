insert logo_msu1_pal,"../../gfx/temp/msu1.pal"
insert logo_msu1_chr,"../../gfx/temp/msu1.chr"
insert logo_msu1_map,"../../gfx/temp/msu1.map"

state_msu1_init:
	uploadToWRAM(logo_msu1_pal, pal_buffer, logo_msu1_pal.size)
	uploadToVRAM(logo_msu1_chr, $0000, logo_msu1_chr.size)
	uploadToVRAM(logo_msu1_map, $1000, logo_msu1_map.size)
	rep #$20
	lda.w #0; sta.l pal_buffer

	rep #$20
	inc.w menu_state
	inc.w upload_pal_flag

	lda.w #60*2; sta.w wait_counter		//wait 2 seconds

	sep #$20
	lda.b #$01; sta.w mirror_BGMODE		//Mode 1, 8x8
	lda.b #$10; sta.w mirror_BG1SC		//BG1: MAP 0x1000, 32x32
	lda.b #$00; sta.w mirror_BG12NBA	//BG1: CHR 0x0000
										//BG2: CHR 0x0000
	lda.b #$01; sta.w mirror_TM			//Display BG1 (Main)
	lda.b #$01; sta.w mirror_TS			//Display BG1 (Sub)

	stz.w mirror_INIDISP
	rts
