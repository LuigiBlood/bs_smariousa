state_fadein:	//Fade In
	sep #$20
	lda.w mirror_INIDISP
	cmp.b #$0F
	beq +
	inc
	sta.w mirror_INIDISP
	rts
+;	inc.w menu_state
	rts

state_fadeout:	//Fade Out
	sep #$20
	lda.w mirror_INIDISP
	cmp.b #$00
	beq +
	dec
	sta.w mirror_INIDISP
	asl; asl; asl; asl
	sta.w MSU_VOL
	rts
+;	inc.w menu_state
	sep #$20
	lda.b #$80;	sta.w mirror_INIDISP
	rts

state_wait:
	rep #$20
	dec.w wait_counter
	bpl +
	inc.w menu_state
+;	rts
