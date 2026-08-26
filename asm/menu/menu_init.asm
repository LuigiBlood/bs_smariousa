allocateWRAM(frame_counter, 2)
allocateWRAM(wait_counter, 2)

allocateWRAM(menu_state, 2)
allocateWRAM(menu_select, 2)

enqueue pc
seekAddr($00FFA5)
	//jml $808000
	jml boot_start
dequeue pc

boot_start:
	clc
	xce
	sep #$10
	rep #$20
	lda.w #$0000
	tcd
	lda.w #$1FFF
	tcs
	ldx.b #boot_start>>16
	phx
	plb

	jsr initsnes
	jsl joypad_init
	jsr init_ppu
	jsr init_apu
	jsl msu_init
	sep #$20
	jsl $809CEF		//upload audio data 1
	jsr wait_vblank
	jsr wait_vblank
	jsr reset_apu
	jsl $809CFF		//upload audio data 2
	jsr wait_vblank
	jsr wait_vblank
	jsr init_apu
	jsr wait_vblank
	jsr menu_init
	jml menu_loop

menu_init:
	rep #$30
	stz.w frame_counter
	stz.w menu_state
	stz.w menu_select
	lda.w #0
	sta.l $706000
	sta.l $7FFFF0
	sta.l $7FFFF2
	sta.l $7FFFF4
	sta.l $7FFFF6
	sta.l $7FFFF8
	sta.l $7FFFFA
	sta.l $7FFFFC
	sta.l $7FFFFE
	rts

menu_loop:
	jsr wait_vblank
	inc.w frame_counter
	//Do VBlank sensitive stuff here
	jsr update_ppu
	//Now do other stuff here
	jsr update_apu
	jsl joypad_controller_update
	
	rep #$20
	lda.w menu_state
	asl
	tax
	jsr (tbl_menu_state_code,x)
	jmp menu_loop

tbl_menu_state_code:
	dw state_logo_init, state_fadein, state_wait, state_logo_sfx, state_wait, state_fadeout
	dw state_msu1_init, state_fadein, state_wait, state_fadeout
	dw state_mainmenu_init, state_fadein, state_mainmenu_loop, state_mainmenu_process, state_fadeout, state_launch_game
