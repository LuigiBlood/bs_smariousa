// Change Pause Menu
enqueue pc
seekAddr($84D463+1); dw oam_tbl_pause
seekAddr($84D468+1); dw oam_tbl_pause>>16
seekAddr($84D46D+1); dw oam_tbl_pause_size

seekAddr($93C000); insert "../../gfx/en/pause_menu.chr"
dequeue pc

oam_tbl_pause:	//$84C407
insert "../../roms/bs_supermariousa_ep1.bs",0x24407,0x13B
db $58,$70,$27,$35,$00	//E
db $60,$70,$28,$35,$00	//X
db $68,$70,$29,$35,$00	//I
db $70,$70,$2A,$35,$00	//T

db $58,$78,$23,$35,$02	//ST
db $68,$80,$35,$35,$00	//A
db $70,$80,$36,$35,$00	//G
db $78,$80,$37,$35,$00	//E
db $80,$80,$38,$35,$00	//
db $88,$80,$39,$35,$00	//S
db $90,$80,$3A,$35,$00	//E
db $98,$80,$3B,$35,$00	//L
db $A0,$80,$3C,$35,$00	//E
db $A8,$78,$2D,$35,$02	//CT
insert "../../roms/bs_supermariousa_ep1.bs",0x24579,0xAF
oam_tbl_pause_end:
constant oam_tbl_pause_size = oam_tbl_pause_end-oam_tbl_pause
