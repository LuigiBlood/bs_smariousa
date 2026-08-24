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
	rep #$20
	and.w #$00FF
	jsl msu_play
	
	rep #$20
	lda.w #0
+;	rtl
