//Hijack MSU1 Play
enqueue pc
seekAddr($80A2AD)
//Sub Game Mode $10
	jsl hack_msu_play
	nop; nop
	//rep #$20
	//lda.w $1972
	//asl
dequeue pc
hack_msu_play:
	//original code
	rep #$20
	lda.w $1972
	asl

	bne +
	sep #$20
	lda.l $706000
	inc
	jsl msu_play
	
	rep #$20
	lda.w #0
+;	rtl

msu_play:
	php
	sep #$20
	pha
	lda.w MSU_STATUS
	bit.b #%00010000
	bne +

	lda.b #0
	xba
	pla
	pha
	rep #$20
	sta.w MSU_TRK
	sep #$20
-;	bit.w MSU_STATUS
	bvs -
	lda.b #$FF
	sta.w MSU_VOL
	lda.b #$01
	sta.w MSU_PLAY
+;	pla
	plp
	rtl

msu_init:
	php
	rep #$20
	lda.w #0
	sta.w MSU_TRK
	sta.w MSU_VOL
	plp
	rtl
