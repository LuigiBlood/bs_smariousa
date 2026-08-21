//DMA
inline setupDMA(variable channel, variable abus, variable bbus, variable counter, variable mode) {
	sep #$20
	lda.b #mode
	sta.w DMAP0 + (channel * $10)
	lda.b #bbus
	sta.w BBAD0 + (channel * $10)
	lda.b #(abus >> 16)
	sta.w A1B0 + (channel * $10)
	rep #$20
	lda.w #abus
	sta.w A1T0L + (channel * $10)
	lda.w #counter
	sta.w DAS0L + (channel * $10)
}

inline startDMA(variable channel) {
	sep #$20
	lda.b #channel
	sta.w MDMAEN
}

inline uploadToCGRAM(variable src, variable dst, variable size) {
	//DMA
	sep #$20
	lda.b #dst
	sta.w CGADD
	setupDMA(0, src, CGDATA, size, $02)
	startDMA(1)
}

inline uploadToVRAM(variable src, variable dst, variable size) {
	//DMA
	sep #$20
	lda.b #$80
	sta.w VMAIN
	rep #$20
	lda.w #dst
	sta.w VMADDL
	setupDMA(1, src, VMDATAL, size, $01)
	startDMA(2)
}
