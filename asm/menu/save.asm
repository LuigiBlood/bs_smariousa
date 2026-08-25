sram_test:
	//A = CRC
	//C = Set (Error)
	php
	rep #$20
	lda.w #0
	rep #$10
	sep #$20
	ldx.w #$3000-1
-;	adc.l $700000,x
	xba
	adc.b #0
	xba
	dex
	bpl -
	sec
	sbc.l $700002
	sbc.l $700003
	sbc.l $700004
	sbc.l $700005
	adc.b #$FF
	adc.b #$FF
	rep #$20
	eor.w #-1
	cmp.l $700002
	bne _sram_test_ng
	eor.w #-1
	cmp.l $700004
	bne _sram_test_ng
_sram_test_ok:
	plp
	clc
	rts
_sram_test_ng:
	plp
	sec
	rts

sram_crcupdate:
	php
	rep #$20
	jsr sram_test
	sta.l $700004
	eor.w #-1
	sta.l $700002
	plp
	rts

sram_erase:
	php
	rep #$30
	lda.w #0
	ldx.w #$6000-2
-;	sta.l $700000,x
	dex; dex
	bpl -
	lda.w #-1
	sta.l $700002
	plp
	rts
