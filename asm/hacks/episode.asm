//$86800C - Episode Number

//Change all reads of the Episode Number $86800C to SRAM $706000 (used as work RAM for menu management)
enqueue pc
seekFile(0x0020a); dl $706000
seekFile(0x00251); dl $706000
seekFile(0x003dd); dl $706000
seekFile(0x00aa5); dl $706000
seekFile(0x01b8e); dl $706000
seekFile(0x01c8d); dl $706000
seekFile(0x01f46); dl $706000
seekFile(0x02481); dl $706000
seekFile(0x0264c); dl $706000
seekFile(0x0289d); dl $706000
seekFile(0x0308b); dl $706000
seekFile(0x03301); dl $706000
seekFile(0x0388a); dl $706000
seekFile(0x038e0); dl $706000
seekFile(0x113f6); dl $706000
seekFile(0x16343); dl $706000
seekFile(0x1c90f); dl $706000
seekFile(0x1c92d); dl $706000
seekFile(0x1d2a6); dl $706000
seekFile(0x1d2c7); dl $706000
seekFile(0x1d410); dl $706000
seekFile(0x1d434); dl $706000
seekFile(0x3102c); dl $706000
seekFile(0x33ad4); dl $706000
seekFile(0x33adb); dl $706000
seekFile(0x33dad); dl $706000
seekFile(0x33eec); dl $706000
dequeue pc

//Hijack Episode Intro 3rd image Address Upload
//Game Mode $02-$0A
inline macro_g02s0A(tbl_ptr) {
	cpx.b #3*2
	bne +
	phx
	clc
	lda.l $706000
	asl
	adc.l $706000
	tax
	lda.l {tbl_ptr},x
	sta.w A1T0L
	lda.l {tbl_ptr}+2,x
	tay
	sty.w A1B0
	plx
	rtl
+;	
}

enqueue pc
seekAddr($80A2BF)	//Tilemap
	jsl hack_g02s0A_map
	    nop;nop;
	nop;nop;
	nop;nop;nop
	//lda.w $A295,x	3
	//sta.w A1T0L	3
	//ldy.b #$89	2
	//sty.w A1B0	3
dequeue pc
hack_g02s0A_map:
	macro_g02s0A(tbl_g02s0A_map)
	//Original Addr $899800
	lda.w $A295,x
	sta.w A1T0L
	ldy.b #$89
	sty.w A1B0
	rtl

tbl_g02s0A_map:
	dl ep1_map_title, ep2_map_title, ep3_map_title, ep4_map_title


enqueue pc
seekAddr($80A2DB)	//Graphics
	jsl hack_g02s0A_chr
	    nop;nop;
	nop;nop;nop
	nop;nop;nop
	//lda.w #$8000
	//sta.w A1T0L
	//ldy.w $A29D,x
	//sty.w A1B0
dequeue pc
hack_g02s0A_chr:
	macro_g02s0A(tbl_g02s0A_chr)
	//Original Addr $8E8000
	lda.w #$8000
	sta.w A1T0L
	lda.w $A29D,x
	tay
	sty.w A1B0
	rtl

tbl_g02s0A_chr:
	dl ep1_chr_title, ep2_chr_title, ep3_chr_title, ep4_chr_title


enqueue pc
seekAddr($80A2FF)	//Palette
	jsl hack_g02s0A_pal
	    nop;nop;
	nop;nop;
	nop;nop;nop
	//lda.w $A2A5,x
	//sta.w A1T0L
	//ldy.b #$89
	//sty.w A1B0
dequeue pc
hack_g02s0A_pal:
	macro_g02s0A(tbl_g02s0A_pal)
	//Original Addr $89FC00
	lda.w $A2A5,x
	sta.w A1T0L
	ldy.b #$89
	sty.w A1B0
	rtl

tbl_g02s0A_pal:
	dl ep1_pal_title, ep2_pal_title, ep3_pal_title, ep4_pal_title


//Hijack Episode End Image Address Upload
//Game Mode $25-$00
inline macro_g25s00(tbl_ptr) {
	lda.l {tbl_ptr},x
	sta.w A1T0L
	lda.l {tbl_ptr}+2,x
	tay
	sty.w A1B0
	rtl
}

enqueue pc
seekAddr($80A480)
	jsl hack_g25s00
	nop;nop
	nop;nop
	nop;nop
	//lda.l $706000	4
	//cmp.b #$03	2
	//bne +			2
	//ldx #$03; +	2
dequeue pc
hack_g25s00:
	clc
	lda.l $706000
	asl
	adc.l $706000
	tax
	rtl

enqueue pc
seekAddr($80A497)
	jsl hack_g25s00_map
	    nop;nop
	nop;nop;nop
	nop;nop;nop
dequeue pc
hack_g25s00_map:
	macro_g25s00(tbl_g25s00_map)

tbl_g25s00_map:
	dl ep1_map_title, ep2_map_title, ep3_map_title, $89B800

enqueue pc
seekAddr($80A4B4)
	jsl hack_g25s00_chr
	    nop;nop
	nop;nop;nop
	nop;nop;nop
dequeue pc
hack_g25s00_chr:
	macro_g25s00(tbl_g25s00_chr)

tbl_g25s00_chr:
	dl ep1_chr_title, ep2_chr_title, ep3_chr_title, $878000

enqueue pc
seekAddr($80A4F3)
	jsl hack_g25s00_pal
	    nop;nop
	nop;nop;nop
	nop;nop;nop
dequeue pc
hack_g25s00_pal:
	macro_g25s00(tbl_g25s00_pal)

tbl_g25s00_pal:
	dl ep1_pal_title, ep2_pal_title, ep3_pal_title, $89EE00


//Hijack Next Episode Preview Image Address Upload
//Game Mode $25-$09
enqueue pc
seekAddr($80A8F2)
	jsl hack_g25s09_map
	    nop;nop
	nop;nop
	nop;nop;nop
	//lda.w #$A000	3
	//sta.w A1T0L	3
	//ldy.b #$89	2
	//sty.w A1B0	3
dequeue pc
hack_g25s09_map:
	clc
	lda.l $706000
	asl
	adc.l $706000
	tax
	macro_g25s00(tbl_g25s09_map)

tbl_g25s09_map:
	dl ep2_map_title, ep3_map_title, ep4_map_title, ep4_map_end


enqueue pc
seekAddr($80A90E)
	jsl hack_g25s09_chr
	    nop;nop
	nop;nop
	nop;nop;nop
	//lda.w #$8000	3
	//sta.w A1T0L	3
	//ldy.b #$8F	2
	//sty.w A1B0	3
dequeue pc
hack_g25s09_chr:
	macro_g25s00(tbl_g25s09_chr)

tbl_g25s09_chr:
	dl ep2_chr_title, ep3_chr_title, ep4_chr_title, ep4_chr_end


enqueue pc
seekAddr($80A931)
	jsl hack_g25s09_pal
	    nop;nop
	nop;nop
	nop;nop;nop
	//lda.w #$FE00	3
	//sta.w A1T0L	3
	//ldy.b #$89	2
	//sty.w A1B0	3
dequeue pc
hack_g25s09_pal:
	macro_g25s00(tbl_g25s09_pal)

tbl_g25s09_pal:
	dl ep2_pal_title, ep3_pal_title, ep4_pal_title, ep4_pal_end

