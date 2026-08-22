allocateWRAM(joypad_scratch, 1)
allocateWRAM(joypad1_id, 2)
allocateWRAM(joypad2_id, 2)
allocateWRAM(joypad1_hold, 2)
allocateWRAM(joypad1_push, 2)
allocateWRAM(joypad1_last, 2)

//init variables
joypad_init:
	php
	rep #$30
	stz.w joypad_scratch
	stz.w joypad1_id
	stz.w joypad2_id
	stz.w joypad1_hold
	stz.w joypad1_push
	stz.w joypad1_last
	jsl joypad_read_ids
	plp
	rtl

//reset controller ports
joypad_reset:
	php
	sep #$30
	lda.b #$01
	sta.w JOYWR
	stz.w JOYWR
	plp
	rtl

//read 8 bits
joypad_read8_0:
	//X = port
	php
	sep #$20
	lda.b #$01
	sta.w joypad_scratch

-;	lda.w JOYA,x
	lsr
	rol.w joypad_scratch
	bcc -

	lda.w joypad_scratch

	plp
	rtl

//read y bits
joypad_read_n_0:
	//X = port
	//Y = amount (1 to 8)
	php
	sep #$20
	stz.w joypad_scratch

-;	lda.w JOYA,x
	lsr
	rol.w joypad_scratch
	dey
	bne -

	lda.w joypad_scratch

	plp
	rtl

//skip n bits
joypad_skip_n:
	//X = port
	//Y = amount
	php
	sep #$20

-;	lda.w JOYA,x
	dey
	bne -

	plp
	rtl

//skip n bits for both ports at once
joypad_skip_n_both:
	//X = port
	//Y = amount
	php
	rep #$20

-;	lda.w JOYA
	dey
	bne -

	plp
	rtl

//Read controller IDs
joypad_read_ids:
	php
	//reset
	jsl joypad_reset
	//skip 12 bits
	sep #$30
	ldy.b #12
	jsl joypad_skip_n_both
	//get 4+8 bits (port 0)
	ldx.b #0
	ldy.b #4
	jsl joypad_read_n_0
	sta.w joypad1_id
	ldx.b #0
	jsl joypad_read8_0
	sta.w joypad1_id+1
	//get 4+8 bits (port 1)
	ldx.b #1
	ldy.b #4
	jsl joypad_read_n_0
	sta.w joypad2_id
	ldx.b #1
	jsl joypad_read8_0
	sta.w joypad2_id+1

	plp
	rtl

//Update Joypad 1 controls (call once per frame)
joypad_controller_update:
	php
	rep #$30
	lda.w joypad1_hold
	sta.w joypad1_last

	sep #$30
	jsl joypad_reset
	ldx.b #$00
	jsl joypad_read8_0
	sta.w joypad1_hold
	ldx.b #$00
	jsl joypad_read8_0
	sta.w joypad1_hold+1

	rep #$30
	lda.w joypad1_hold
	eor.w joypad1_last
	and.w joypad1_hold
	sta.w joypad1_push

	plp
	rtl
