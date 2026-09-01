//$9F8000 - GFX
//$81EC7C - MAP (RLE) (PTR: $81CF16)
//$83D34C - PAL
enqueue pc
seekAddr($9F8000); insert "../../gfx/temp/resultsrecord.chr"
seekAddr($83D34C); insert "../../gfx/temp/resultsrecord.pal"
seekAddr($81DA0B); insert "../../gfx/temp/resultsrecord.map",0,2	//Empty Map

seekAddr($81EC7C)
db $48,$81,$00,$1E-1; insert record_map1,"../../gfx/temp/resultsrecord.map",0x82+(0x20*0),0x1E
db $48,$A1,$00,$1E-1; insert record_map2,"../../gfx/temp/resultsrecord.map",0x82+(0x20*1),0x1E
db $48,$C1,$00,$1E-1; insert record_map3,"../../gfx/temp/resultsrecord.map",0x82+(0x20*2),0x1E
db $48,$E1,$00,$1E-1; insert record_map4,"../../gfx/temp/resultsrecord.map",0x82+(0x20*3),0x1E
db $49,$01,$00,$1E-1; insert record_map5,"../../gfx/temp/resultsrecord.map",0x82+(0x20*4),0x1E
db $FF

seekAddr(record_map1); addPriorityBit(record_map1.size)
seekAddr(record_map2); addPriorityBit(record_map2.size)
seekAddr(record_map3); addPriorityBit(record_map3.size)
seekAddr(record_map4); addPriorityBit(record_map4.size)
seekAddr(record_map5); addPriorityBit(record_map5.size)

seekAddr($80B0F0)	//Highlight Yes (change everything)
db $48,$E4,$00,$0C-1; insert record_yes1,"../../gfx/temp/resultsrecord.map",0x88+(0x20*3),0x0C
seekAddr(record_yes1); insert "../../gfx/temp/resultsrecord.map",0x86+(0x20*3),2	//empty
seekAddr(record_yes1); addPriorityBit(record_yes1.size)

seekAddr($80B151+1); insert "../../gfx/temp/resultsrecord.map",0x88+(0x20*3),2	//cursor
seekAddr($80B151+1); addPriorityBit(2)
dequeue pc
