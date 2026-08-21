enqueue pc
seekAddr($80A2AF)
//Hijack Game Mode $10
	jsl hack_msu_play
	//lda.w $1972
	//asl
dequeue pc

hack_msu_play:
	lda.w #0
	sta.w MSU_TRK
	sep #$20
	lda.w MSU_ID5
	cmp.b #$01
-;	bne -
-;	bit.w MSU_STATUS
	bvs -
	lda.b #$FF
	sta.w MSU_VOL
	lda.b #$01
	sta.w MSU_PLAY

	rep #$20
	lda.w $1972
	asl
	rtl