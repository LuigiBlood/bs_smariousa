
//$89F200 - Credits 2 Palette (256 colors)
//$908000 - Credits 2 CHR BG1 (Photos)
//$9EC000 - Credits 1 & 2 CHR BG3 (Photos)
//$888000 - Credits 2 MAP BG1 (Photos)
//$88A000 - Credits 2 MAP BG3 (Text)

enqueue pc
seekAddr($80A7E7)
	jsl hijack_credits2
	rts
dequeue pc

hijack_credits2:
	phx
	php
	rep #$20
	lda $706000
	asl
	tax
	jmp (hijack_credits2_jmptbl,x)

hijack_credits2_jmptbl:
	dw hijack_credits2_ep1, hijack_credits2_ep2, hijack_credits2_ep3, hijack_credits2_ep4

hijack_credits2_ep1:
	uploadToCGRAM(ep1_pal_credits, 0, 0x200)
	uploadToVRAM(ep1_map_credits2_bg1, $0000, 0x2000)
	uploadToVRAM(ep1_map_credits2_bg3, $1000, 0x2000)
	uploadToVRAM(ep1_chr_credits_bg1, $2000, ep1_chr_credits_bg1.size)
	uploadToVRAM(ep1_chr_credits_bg3, $6000, ep1_chr_credits_bg3.size)
	jmp hijack_credits2_end

hijack_credits2_ep2:
	uploadToCGRAM(ep2_pal_credits, 0, 0x200)
	uploadToVRAM(ep2_map_credits2_bg1, $0000, 0x2000)
	uploadToVRAM(ep2_map_credits2_bg3, $1000, 0x2000)
	uploadToVRAM(ep2_chr_credits_bg1, $2000, ep2_chr_credits_bg1.size)
	uploadToVRAM(ep2_chr_credits_bg3, $6000, ep2_chr_credits_bg3.size)
	jmp hijack_credits2_end

hijack_credits2_ep3:
	uploadToCGRAM(ep3_pal_credits, 0, 0x200)
	uploadToVRAM(ep3_map_credits2_bg1, $0000, 0x2000)
	uploadToVRAM(ep3_map_credits2_bg3, $1000, 0x2000)
	uploadToVRAM(ep3_chr_credits_bg1, $2000, ep3_chr_credits_bg1.size)
	uploadToVRAM(ep3_chr_credits_bg3, $6000, ep3_chr_credits_bg3.size)
	jmp hijack_credits2_end

hijack_credits2_ep4:
	uploadToCGRAM(ep4_pal_credits, 0, 0x200)
	uploadToVRAM(ep4_map_credits2_bg1, $0000, 0x2000)
	uploadToVRAM(ep4_map_credits2_bg3, $1000, 0x2000)
	uploadToVRAM(ep4_chr_credits_bg1, $2000, ep4_chr_credits_bg1.size)
	uploadToVRAM(ep4_chr_credits_bg3, $6000, ep4_chr_credits_bg3.size)
	jmp hijack_credits2_end

hijack_credits2_end:
	//original code
	plp
	plx
	rep #$20
	sep #$10
	stz.w $0200
	stz.w $0206
	stz.w $0204
	stx.w $020A
	sep #$20
	lda.b #$59
	sta.w $0775
	sta.w $2105
	inc.w $0602
	rtl
