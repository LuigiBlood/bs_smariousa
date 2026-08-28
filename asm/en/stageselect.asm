//Stage Select & Results menu

//Today's Results and Stage Select
enqueue pc
seekAddr($93A000); insert "../../gfx/en/stage_select.chr"
//Rearrange Tilemap for Results & Stage Select
seekAddr($81D41C); db $FF,$00 //db $0E,$1D
seekAddr($81D430); db $FF,$00 //db $1E,$1D
seekAddr($81D750); db $FF,$00 //db $0E,$1D
seekAddr($81D772); db $FF,$00 //db $1E,$1D

seekAddr($81D7B8); db $0E,$1D //db $FF,$00
seekAddr($81D7DA); db $1E,$1D //db $FF,$00
dequeue pc

//Logo in Stage Select
enqueue pc
seekAddr($80828A)
	jsl hijack_logo_upload
dequeue pc
hijack_logo_upload:
	php
	jsl $8098CA
	sep #$20
	lda.b #vram_bin_logo>>0
	sta.b $F0
	lda.b #vram_bin_logo>>8
	sta.b $F1
	lda.b #vram_bin_logo>>16
	sta.b $F2
	jsl $8098E3	//Upload
	uploadToVRAM(logo_chr, $3800, logo_chr.size)
	plp
	rtl

vram_bin_logo:
db $02,$D4,$00,$16-1; insert "../../gfx/temp/logo.map",0x16*0,0x16
db $02,$F4,$00,$16-1; insert "../../gfx/temp/logo.map",0x16*1,0x16
db $03,$14,$00,$16-1; insert "../../gfx/temp/logo.map",0x16*2,0x16
db $03,$34,$00,$16-1; insert "../../gfx/temp/logo.map",0x16*3,0x16
db $03,$54,$00,$16-1; insert "../../gfx/temp/logo.map",0x16*4,0x16

db $06,$D4,$00,$16-1; insert "../../gfx/temp/logo.map",0x16*0,0x16
db $06,$F4,$00,$16-1; insert "../../gfx/temp/logo.map",0x16*1,0x16
db $07,$14,$00,$16-1; insert "../../gfx/temp/logo.map",0x16*2,0x16
db $07,$34,$00,$16-1; insert "../../gfx/temp/logo.map",0x16*3,0x16
db $07,$54,$00,$16-1; insert "../../gfx/temp/logo.map",0x16*4,0x16
db $FF

insert logo_chr,"../../gfx/temp/logo.chr"
