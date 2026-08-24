test_sram:
	rts

empty_sram:
	php
	rep #$30
	lda.w #0
	ldx.w #$6000-2
-;	sta.l $700000,x
	dex; dex
	bpl -
	plp
	rts
