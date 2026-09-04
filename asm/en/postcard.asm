//$88C000 - GFX (16x16) 2BPP
//$88F000 - GFX (16x16) - Password Code Map
//$89B000 - MAP (16x16)
//$89F000 - PAL (256 colors, only 128)

//All modifications to the tilemap:
//$80B17F - "No longer accepting submissions"
//$80B1BE - Accepting Submissions (Episode 4)
//$80B1E5 - "No longer accepting submissions" (Episode 4)

enqueue pc
seekAddr($88C000); insert "../../gfx/temp/postcard.chr"
seekAddr($89B000); insert "../../gfx/temp/postcard.map",0x180
seekAddr($89F000); insert "../../gfx/temp/postcard.pal"
seekAddr($80B3C1); insert "../../gfx/temp/postcard.map",0,0x80	//Password Code Map

seekAddr($80B17F); db $FF

seekAddr($80B1BE)
	db $11,$A3,$00,$22-1
	insert "../../gfx/temp/postcard.map",32*2*5,$22
	db $FF

seekAddr($80B1E5)
	db $11,$A3,$00,$22-1
	insert "../../gfx/temp/postcard.map",32*2*5,$22
	db $FF

seekAddr($80B381)	//Lucky Player
	insert "../../gfx/temp/postcard.map",0x9E+(8*0),8
	insert "../../gfx/temp/postcard.map",0xDE+(8*0),8
	insert "../../gfx/temp/postcard.map",0x9E+(8*1),8
	insert "../../gfx/temp/postcard.map",0xDE+(8*1),8
	insert "../../gfx/temp/postcard.map",0x9E+(8*2),8
	insert "../../gfx/temp/postcard.map",0xDE+(8*2),8
	insert "../../gfx/temp/postcard.map",0x9E+(8*3),8
	insert "../../gfx/temp/postcard.map",0xDE+(8*3),8

seekAddr($80B33F)	//Digits for Mario Statues 0123456789, space
	insert "../../gfx/temp/postcard.map",0,10*2
	insert "../../gfx/temp/postcard.map",32*2*4,2
seekAddr($80B609); lda.w #$10DA+1
seekAddr($80B868); lda.w #$12FA+1

seekAddr($80B355)	//Score Digits: 0123456789, space (Top, Bottom)
	insert "../../gfx/temp/postcard.map",32*2*2,11*2
	insert "../../gfx/temp/postcard.map",32*2*3,11*2

seekAddr($80B7D9)
	jsl hijack_championshipscore1
	nop;nop;nop;nop;nop;
	nop;nop;nop;nop;nop;

seekAddr($80B7F9)
	jsl hijack_championshipscore2
	nop;nop;nop;nop;nop;
	nop;nop;nop;nop;nop;

seekAddr($80B485+1); insert "../../gfx/temp/postcard.map",0xBE,0x2	//-
seekAddr($80B6EF+1); insert "../../gfx/temp/postcard.map",0xBE,0x2	//-

dequeue pc
hijack_championshipscore1:
	sec
	sbc.w #$0400
	sta.w $1802,y
	lda.w $B36B,x
	sec
	sbc.w #$0400
	sta.w $1810,y
	rtl

hijack_championshipscore2:
	sec
	sbc.w #$0400
	sta.w $1802,y
	lda.w $B36B
	sec
	sbc.w #$0400
	sta.w $1810,y
	rtl
