
include "ram.asm"
include "init.asm"
include "joypad.asm"
include "ppu.asm"
include "apu.asm"

enqueue pc
seekAddr($00FFA5)
	//jml $808000
	jml boot_start
dequeue pc

boot_start:
	clc
	xce
	rep #$20
	lda.w #$0000
	tcd
	lda.w #$1FFF
	tcs

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
	sep #$20
	lda.b #$01;	sta.w mirror_APUIO3
	lda.b #$02;	sta.w mirror_APUIO2
	jml menu_loop

menu_init:
	rep #$30
	lda.w #0
	sta.w menu_state
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

	//Button Check
	rep #$20
	lda.w joypad1_push
	bit.w #$0010	//Start
	beq +
	jmp launch_game
+;	bit.w #$0008	//Up
	beq +
	sep #$20
	lda.b #$06;	sta.w mirror_APUIO3
	lda.l $706000
	inc
	and.b #$03
	sta.l $706000
	jmp menu_loop_after_button
+;	bit.w #$0004	//Down
	beq +
	sep #$20
	lda.b #$06;	sta.w mirror_APUIO3
	lda.l $706000
	dec
	and.b #$03
	sta.l $706000
	jmp menu_loop_after_button
+;
menu_loop_after_button:
	jmp menu_loop

launch_game:
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
