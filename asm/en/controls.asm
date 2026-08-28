//change Controls Select Graphics
enqueue pc
seekAddr($81CEE9)
	//change pointers to vram upload blocks
	dl vram_bin_programstart, vram_bin_selecttype, vram_bin_typeA, vram_bin_typeB

seekAddr($89A800); insert "../../gfx/en/controls.map"
seekAddr($99A800); insert "../../gfx/en/controls.chr"
seekAddr($99B400); insert "../../gfx/temp/controls_text.chr",0x000,0xC00
seekAddr($99C800); insert "../../gfx/temp/controls_text.chr",0xC00

//Change Size for last controls_text.chr part
seekAddr($83E8E8); dw 0x0C00
dequeue pc

vram_bin_programstart:
//BSマリオUSAは、まもなくスタート! 
//そのままお待ち下さい。
db $02,$24,$00,$2F
insert "../../gfx/temp/controls_text.map",0x30*0,0x30
db $02,$44,$00,$2F
insert "../../gfx/temp/controls_text.map",0x30*1,0x30
db $02,$64,$00,$2F
insert "../../gfx/temp/controls_text.map",0x30*2,0x30
db $02,$84,$00,$2F
insert "../../gfx/temp/controls_text.map",0x30*3,0x30
db $FF

vram_bin_selecttype:
//セレクトボタンでタイプを選んで
//スタートボタンを押して下さい。
db $02,$24,$00,$2F
insert "../../gfx/temp/controls_text.map",0x30*4,0x30
db $02,$44,$00,$2F
insert "../../gfx/temp/controls_text.map",0x30*5,0x30
db $02,$64,$00,$2F
insert "../../gfx/temp/controls_text.map",0x30*6,0x30
db $02,$84,$00,$2F
insert "../../gfx/temp/controls_text.map",0x30*7,0x30
db $FF

vram_bin_typeA:
//Type A (JUMP)
db $01,$76,$00,$07
db $BD,$08,$BD,$08,$BD,$08,$BD,$08
db $01,$96,$00,$07
db $09,$09,$0A,$09,$0B,$09,$BD,$08
db $01,$B6,$00,$09
db $BD,$08,$BD,$08,$BD,$08,$BD,$08,$BD,$08
db $01,$F1,$00,$03
db $44,$09,$45,$09
db $FF

vram_bin_typeB:
//Type B (DASH, PICK UP)
db $01,$76,$00,$07
db $BD,$08,$BD,$08,$BD,$08,$BD,$08
db $01,$96,$00,$07
db $55,$09,$56,$09,$57,$09,$58,$09
db $01,$B6,$00,$09
db $06,$09,$07,$09,$08,$09,$BD,$08,$BD,$08
db $01,$F1,$00,$03
db $46,$09,$47,$09
db $FF
