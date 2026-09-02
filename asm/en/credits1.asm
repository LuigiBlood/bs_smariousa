//End Screen
//$80A3C4	- Part 1/8
//db $10,$00,$5F,$FE
//db $EE,$03
//db $11,$60,$00,$7F
//db $EE,$03,$26,$20,$28,$20,$02,$20,$EE,$03,$00,$20,$24,$20,$EE,$03
//db $EE,$03,$26,$20,$28,$20,$06,$20,$EE,$03,$00,$20,$24,$20,$EE,$03
//db $EE,$03,$EE,$03,$EE,$03,$EE,$03,$EE,$03,$EE,$03,$EE,$03,$EE,$03
//db $40,$20,$42,$20,$44,$20,$46,$20,$48,$20,$4A,$20,$4C,$20,$EE,$03

//db $EE,$03,$26,$20,$28,$20,$04,$20,$EE,$03,$00,$20,$24,$20,$EE,$03
//db $EE,$03,$2A,$20,$2C,$20,$EE,$03,$EE,$03,$00,$20,$24,$20,$EE,$03
//db $EE,$03,$EE,$03,$EE,$03,$EE,$03,$EE,$03,$EE,$03,$EE,$03,$EE,$03
//db $EE,$03,$EE,$03,$EE,$03,$4E,$20,$60,$20,$62,$20,$64,$20,$EE,$03
//db $00,$20,$02,$20

//$81E8D9 (ID 0x25)	- Part 2/8
//$81E95E (ID 0x26)	- Part 3/8
//$81E9E3 (ID 0x27)	- Part 4/8
//$81EA68 (ID 0x28)	- Part 5/8
//$81EAED (ID 0x29)	- Part 6/8
//$81EB72 (ID 0x2A)	- Part 7/8
//$81EBF7 (ID 0x2B)	- Part 8/8

enqueue pc
seekAddr($9EC000); insert "../../gfx/temp/credits1.chr"

seekAddr($80A3CE+0); insert "../../gfx/temp/credits1.map",0x200+(0x40*0),0x40; insert "../../gfx/temp/credits1.map",0x400+(0x40*0),0x40
setMapPriorityBit(0x80)
seekAddr($81E8D9+4); insert "../../gfx/temp/credits1.map",0x200+(0x40*1),0x40; insert "../../gfx/temp/credits1.map",0x400+(0x40*1),0x40
setMapPriorityBit(0x80)
seekAddr($81E95E+4); insert "../../gfx/temp/credits1.map",0x200+(0x40*2),0x40; insert "../../gfx/temp/credits1.map",0x400+(0x40*2),0x40
setMapPriorityBit(0x80)
seekAddr($81E9E3+4); insert "../../gfx/temp/credits1.map",0x200+(0x40*3),0x40; insert "../../gfx/temp/credits1.map",0x400+(0x40*3),0x40
setMapPriorityBit(0x80)
seekAddr($81EA68+4); insert "../../gfx/temp/credits1.map",0x200+(0x40*4),0x40; insert "../../gfx/temp/credits1.map",0x400+(0x40*4),0x40
setMapPriorityBit(0x80)
seekAddr($81EAED+4); insert "../../gfx/temp/credits1.map",0x200+(0x40*5),0x40; insert "../../gfx/temp/credits1.map",0x400+(0x40*5),0x40
setMapPriorityBit(0x80)
seekAddr($81EB72+4); insert "../../gfx/temp/credits1.map",0x200+(0x40*6),0x40; insert "../../gfx/temp/credits1.map",0x400+(0x40*6),0x40
setMapPriorityBit(0x80)
seekAddr($81EBF7+4); insert "../../gfx/temp/credits1.map",0x200+(0x40*7),0x40; insert "../../gfx/temp/credits1.map",0x400+(0x40*7),0x40
setMapPriorityBit(0x80)
dequeue pc
