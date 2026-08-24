menu_state00:	//upload
	jsr empty_oam_buffer
	//upload base menu
	uploadToWRAM(menu_pal, pal_buffer, menu_pal.size)
	uploadToWRAM(menu_pal, pal_buffer+$100, menu_pal.size)
	uploadToVRAM(menu_chr, $0000, menu_chr.size)
	uploadToWRAM(menu_map, map_buffer, menu_map.size)
	//update scores and stuff
	jsl update_menu_records
	rep #$20
	inc.w menu_state
	inc.w upload_pal_flag
	inc.w upload_map_flag

	//Play & Repeat Track 0
	lda.w #0
	sec
	jsl msu_play
	
	sep #$20
	stz.w mirror_INIDISP
	rts

menu_state01:	//Show screen
	sep #$20
	lda.w mirror_INIDISP
	cmp.b #$0F
	beq +
	inc
	sta.w mirror_INIDISP
	rts
+;	inc.w menu_state
	sep #$20
	lda.b #$01;	sta.w mirror_APUIO3
	rts

menu_state02:	//Control
	//Button Check
	rep #$20
	lda.w joypad1_push
	bit.w #$0010	//Start
	beq +
	inc.w menu_state
+;	bit.w #$0008	//Up
	beq ++
	sep #$20
	lda.w menu_select
	beq +
	dec.w menu_select
	lda.b #$06;	sta.w mirror_APUIO3
+;	jmp menu_state02_after
+;	bit.w #$0004	//Down
	beq ++
	sep #$20
	lda.w menu_select
	cmp.b #4
	bcs +
	inc.w menu_select
	lda.b #$06;	sta.w mirror_APUIO3
+;	jmp menu_state02_after
+;
menu_state02_after:
	sep #$30
	lda.b #$28;	sta.w oam_buffer+0
	ldx.w menu_select
	lda.l tbl_y_menu_state02,x
	sta.w oam_buffer+1
	lda.b #$01;	sta.w oam_buffer+2
	stz.w oam_buffer+3
	rts

tbl_y_menu_state02:
	db $50-1,$68-1,$80-1,$98-1,$B0-1

menu_state03:
	rep #$20
	lda.w menu_select
	cmp.w #4
	bne +
	sep #$20; lda.b #$16; sta.w mirror_APUIO3
	jsr empty_sram
	jsl update_menu_records
	dec.w menu_state
	rts
+;	sta.l $706000
	inc.w menu_state
	lda.b #$01;	sta.w mirror_APUIO3
	rts

menu_state04:	//Fade to black
	sep #$20
	lda.w mirror_INIDISP
	cmp.b #$00
	beq +
	dec
	sta.w mirror_INIDISP
	asl; asl; asl; asl
	sta.w MSU_VOL
	rts
+;	inc.w menu_state
	sep #$20
	lda.b #$80;	sta.w mirror_INIDISP
	rts

launch_game:
	sep #$20
	lda.l $701401
	inc
	sta.l $7FFFF1
	jsl msu_init
	jsr wait_vblank
	jsr reset_apu
	jsr wait_vblank
	sep #$30
	jml $808000

wait_vblank:
	php
	sep #$20
-;	lda.l HVBJOY
	bmi -
-;	lda.l HVBJOY
	bpl -
	plp
	rts

inline macro_draw_numbers(addr, v_addr, digits) {
	ldy.w #{digits}
	ldx.w #{v_addr}
	lda.l {addr}
	jsl draw_numbers
}

update_menu_records:
	php
	rep #$30
	macro_draw_numbers($701464, $016A*2, 2)
	macro_draw_numbers($701474, $01CA*2, 2)
	macro_draw_numbers($701484, $022A*2, 2)
	macro_draw_numbers($701494, $028A*2, 2)
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
	sta.l map_buffer,x
	lda.w RDDIVL
	dex; dex
	dey
	bne -
	rtl
