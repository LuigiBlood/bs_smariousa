msu_play:
	//A:	Track Number (16-bit)
	//C:	Unset = don't repeat
	//		Set = repeat
	pha

	//if MSU1 is already playing a song, don't do anything
	sep #$20
	lda.w MSU_STATUS
	bit.b #%00010000
	bne ++

	rep #$20
	pla
	pha
	sta.w MSU_TRK		//Set Audio Track

	sep #$20
-;	bit.w MSU_STATUS	//Wait until audio is ready
	bvs -
	lda.b #$FF; sta.w MSU_VOL	//Full Volume
	lda.b #$03
	bcs +
	lda.b #$01
+;	sta.w MSU_PLAY	//Play Song
+;	
	rep #$20
	pla
	rtl

msu_stop:
	php
	sep #$20
	lda.b #$00
	sta.w MSU_PLAY
	plp
	rtl

msu_init:
	php
	rep #$20
	lda.w #$0000
	sta.w MSU_VOL
	sta.w MSU_TRK
	plp
	rtl
