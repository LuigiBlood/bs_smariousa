//Reset instead of sending back to BS-X (which won't work anyway)
enqueue pc
seekAddr($80F999)
	sep #$20
	lda.b #$F0
	sta.l APUIO1
	rep #$20
	lda.w #$BBAA
-;	cmp.l APUIO0
	bne -
	//write "SKIP" to RAM
	lda.w #$4B53; sta.l $7FF000
	lda.w #$5049; sta.l $7FF002

	jml $00FFA5
dequeue pc

//Skip Nintendo & St.GIGA presents screen (g02s01)
enqueue pc
//g02s01
seekAddr($80A17E)
	lda.b #$01
	sta.w $1974
	inc.w $0602
	inc.w $0602
	rts
dequeue pc
