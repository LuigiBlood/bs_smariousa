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
	lda.b #0
	sta.l $7FFFF4	//Ensure there's no desync
	lda.l $706000
	inc
	rep #$20
	and.w #$00FF
	clc; jsl msu_play
	sep #$20
	lda.b #$01
	sta.l $7FFFF4
	
	rep #$20
	lda.w #0
+;	rtl

//Hijack MSU1 fade
enqueue pc
seekAddr($80A275)
//Sub Game Mode $08
	jsl hack_msu_fade
	//lda.l $7FFFFF
dequeue pc
hack_msu_fade:
	lda.l $7FFFFF
	cmp.b #3
	bne hack_msu_fade_end
	rep #$20
	lda.l $7FFFFA
	sec; sbc.w #(60*3)-$10
	bmi +
	sep #$20
	asl;asl;asl;asl
	sta.w MSU_VOL
	bra hack_msu_fade_end
+;	cmp.w #$FFFF
	bne +
	jsl msu_stop
+;	bra hack_msu_fade_end

hack_msu_fade_end:
	sep #$20
	lda.l $7FFFFF
	rtl
