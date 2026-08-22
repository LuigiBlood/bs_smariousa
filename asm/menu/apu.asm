allocateWRAM(mirror_APUIO0, 1)
allocateWRAM(mirror_APUIO1, 1)
allocateWRAM(mirror_APUIO2, 1)
allocateWRAM(mirror_APUIO3, 1)

init_apu:
	php
	sep #$20
	stz.w mirror_APUIO0
	stz.w mirror_APUIO1
	stz.w mirror_APUIO2
	stz.w mirror_APUIO3

	stz.w APUIO0
	stz.w APUIO1
	stz.w APUIO2
	stz.w APUIO3
	plp
	rts

update_apu:
	php
	sep #$20
	lda.w mirror_APUIO0
	stz.w mirror_APUIO0
	sta.w APUIO0

	lda.w mirror_APUIO1
	stz.w mirror_APUIO1
	sta.w APUIO1

	lda.w mirror_APUIO2
	stz.w mirror_APUIO2
	sta.w APUIO2

	lda.w mirror_APUIO3
	stz.w mirror_APUIO3
	sta.w APUIO3
	plp
	rts

reset_apu:
	php
	sep #$20
	stz.w APUIO0
	stz.w APUIO1
	stz.w APUIO2
	stz.w APUIO3
	lda.b #$FF
	sta.w APUIO1
	plp
	rts
