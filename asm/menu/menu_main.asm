state_mainmenu_init:	//upload
	//Test SRAM and erase if checksum is wrong
	jsr sram_test
	bcc +
	jsr sram_erase
+;

	jsr empty_oam_buffer
	//upload base menu graphics
	uploadToWRAM(menu_pal_bg1, pal_buffer+$E0, menu_pal_bg1.size)
	uploadToVRAM(menu_chr_bg1, $0000, menu_chr_bg1.size)
	uploadToWRAM(menu_map_bg1, map_buffer, menu_map_bg1.size)
	uploadToWRAM(menu_map_empty, map_buffer, menu_map_empty_end-menu_map_empty)

	uploadToWRAM(menu_pal_bg2, pal_buffer, menu_pal_bg2.size)
	uploadToVRAM(menu_chr_bg2, $1000, menu_chr_bg2.size)
	uploadToVRAM(menu_map_bg2, $3000, menu_map_bg2.size)

	uploadToWRAM($85C991, pal_buffer+$100, $20)
	uploadToVRAM($99F5C0, $6000, $20)

	uploadToWRAM(menu_pal_icons, pal_buffer+$120, menu_pal_icons.size)
	uploadToWRAM(menu_pal_icons, pal_buffer+$140, menu_pal_icons.size)
	uploadToVRAM(menu_chr_icons, $6100, menu_chr_icons.size)
	uploadToWRAM(menu_oam_icons, oam_buffer+$4, menu_oam_icons_end-menu_oam_icons)

	uploadToWRAM(menu_pal_obj_logo_jp, pal_buffer+$1E0, menu_pal_obj_logo_jp.size)
	uploadToVRAM(menu_chr_obj_logo_jp, $6300, menu_chr_obj_logo_jp.size)
	uploadToWRAM(menu_oam_obj_logo_jp, oam_buffer+$4+menu_oam_icons_end-menu_oam_icons, menu_oam_obj_logo_jp_end-menu_oam_obj_logo_jp)
	uploadToWRAM(menu_oam_obj_logo_jp_2, oam_buffer+$200, menu_oam_obj_logo_jp_2_end-menu_oam_obj_logo_jp_2)
	//Update scores and stuff
	jsl update_menu_records
	
	rep #$20
	inc.w menu_state
	inc.w upload_pal_flag
	inc.w upload_map_flag

	//Play & Repeat Track 0
	lda.w #0
	sec
	jsl msu_play

	//Prep Video
	sep #$20
	lda.b #$01; sta.w mirror_BGMODE		//Mode 1, 8x8
	lda.b #$20; sta.w mirror_BG1SC		//BG1: MAP 0x2000, 32x32
	lda.b #$30; sta.w mirror_BG2SC		//BG2: MAP 0x3000, 32x32
	lda.b #$10; sta.w mirror_BG12NBA	//BG1: CHR 0x0000
										//BG2: CHR 0x1000
	lda.b #$13; sta.w mirror_TM			//Display BG1&2 and OBJ (Main)
	lda.b #$00; sta.w mirror_TS			//Display BG1 and OBJ (Sub)
	lda.b #$03; sta.w mirror_OBSEL		//OBJ: CHR 0x6000

	stz.w mirror_INIDISP
	rts

state_mainmenu_loop:	//Control
	//Button Check
	rep #$20
	lda.w joypad1_push
	bit.w #$8010	//Start or A
	beq +
	inc.w menu_state
+;	bit.w #$0008	//Up
	beq ++
	sep #$20
	lda.w menu_select
	beq +
	dec.w menu_select
	lda.b #$06;	sta.w mirror_APUIO3
+;	jmp state_mainmenu_loop_after
+;	bit.w #$0004	//Down
	beq ++
	sep #$20
	lda.w menu_select
	cmp.b #4
	bcs +
	inc.w menu_select
	lda.b #$06;	sta.w mirror_APUIO3
+;	jmp state_mainmenu_loop_after
+;
state_mainmenu_loop_after:
	sep #$30
	lda.b #$28;	sta.w oam_buffer+0
	ldx.w menu_select
	lda.w tbl_y_state_mainmenu_loop,x
	sta.w oam_buffer+1
	lda.b #$00;	sta.w oam_buffer+2
	lda.b #$30;	sta.w oam_buffer+3
	rts

tbl_y_state_mainmenu_loop:
	db $50-1+3,$68-1+3,$80-1+3,$98-1+3,$B0-1

state_mainmenu_process:
	rep #$20
	lda.w menu_select
	cmp.w #4
	bne +
	//Erase Data is selected, erase data and go back to selection
	sep #$20; lda.b #$16; sta.w mirror_APUIO3
	jsr sram_erase
	jsl update_menu_records
	dec.w menu_state
	rts
	//Episodes are selected, start episode
+;	sep #$20
	sta.l $706000
	lda.b #$01;	sta.w mirror_APUIO3
	inc.w menu_state
	rts

state_launch_game:
	//Mess with save timestamp to restart the save while keeping the episode records data
	sep #$20
	lda.l $701401
	inc
	sta.l $7FFFF1
	//Reinit MSU and APU
	jsl msu_init
	jsr wait_vblank
	jsr reset_apu
	jsr wait_vblank
	//Jump to main game
	sep #$30
	jml $808000

inline macro_draw_numbers(addr, v_addr, digits) {
	ldy.w #{digits}
	ldx.w #{v_addr}
	lda.l {addr}
	jsl draw_numbers
}

update_menu_records:
	php
	rep #$30
	macro_draw_numbers($701464, $014A*2+20, 2)
	macro_draw_numbers($701474, $01AA*2+20, 2)
	macro_draw_numbers($701484, $020A*2+20, 2)
	macro_draw_numbers($701494, $026A*2+20, 2)
	macro_draw_numbers($70146C, $016A*2+26, 5)
	macro_draw_numbers($70147C, $01CA*2+26, 5)
	macro_draw_numbers($70148C, $022A*2+26, 5)
	macro_draw_numbers($70149C, $028A*2+26, 5)

	inc.w upload_map_flag
	plp
	rtl

draw_numbers:
	//Assume XYA = 16-bit
	//X = Map Addr (right most digit)
	//Y = How many digits
	//A = Number
-;	sta.w WRDIVL
	lda.w #10
	sta.w WRDIVB
	nop;nop;nop;nop;nop;nop
	lda.w RDMPYL
	inc
	ora.w #$1C00
	sta.l map_buffer,x
	lda.w RDDIVL
	dex; dex
	dey
	bne -
	rtl
