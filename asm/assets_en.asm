
insert menu_pal_bg1,"../gfx/temp/bg1_en.pal"
insert menu_chr_bg1,"../gfx/temp/bg1_en.chr"
insert menu_map_bg1,"../gfx/temp/bg1_en.map"

insert menu_pal_obj_logo,"../gfx/temp/obj_logo_en.pal"
insert menu_chr_obj_logo,"../gfx/temp/obj_logo_en.chr"

//change Controls Select Graphics
enqueue pc
seekAddr($81CEE9)
	//change pointers to vram upload blocks
	dl vram_bin_programstart, vram_bin_selecttype, vram_bin_typeA, vram_bin_typeB
dequeue pc

vram_bin_programstart:
//BSマリオUSAは、まもなくスタート! 
//そのままお待ち下さい。
db $02,$24,$00,$2F
insert "../gfx/temp/controls_text.map",0x30*0,0x30
db $02,$44,$00,$2F
insert "../gfx/temp/controls_text.map",0x30*1,0x30
db $02,$64,$00,$2F
insert "../gfx/temp/controls_text.map",0x30*2,0x30
db $02,$84,$00,$2F
insert "../gfx/temp/controls_text.map",0x30*3,0x30
db $FF

vram_bin_selecttype:
//セレクトボタンでタイプを選んで
//スタートボタンを押して下さい。
db $02,$24,$00,$2F
insert "../gfx/temp/controls_text.map",0x30*4,0x30
db $02,$44,$00,$2F
insert "../gfx/temp/controls_text.map",0x30*5,0x30
db $02,$64,$00,$2F
insert "../gfx/temp/controls_text.map",0x30*6,0x30
db $02,$84,$00,$2F
insert "../gfx/temp/controls_text.map",0x30*7,0x30
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


// Change Pause Menu
enqueue pc
seekAddr($84D463+1); dw oam_tbl_pause
seekAddr($84D468+1); dw oam_tbl_pause>>16
seekAddr($84D46D+1); dw oam_tbl_pause_size
dequeue pc

oam_tbl_pause:	//$84C407
insert "../roms/bs_supermariousa_ep1.bs",0x24407,0x13B
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
insert "../roms/bs_supermariousa_ep1.bs",0x24579,0xAF
oam_tbl_pause_end:
constant oam_tbl_pause_size = oam_tbl_pause_end-oam_tbl_pause

//Include all graphics
enqueue pc
seekAddr($89A800); insert "../gfx/en/controls.map"
seekAddr($99A800); insert "../gfx/en/controls.chr"
seekAddr($99B400); insert "../gfx/temp/controls_text.chr",0x000,0xC00
seekAddr($99C800); insert "../gfx/temp/controls_text.chr",0xC00

//Change Size for last controls_text.chr part
seekAddr($83E8E8); dw 0x0C00

seekAddr($93C000); insert "../gfx/en/pause_menu.chr"

seekAddr($93A000); insert "../gfx/en/stage_select.chr"
//Rearrange Tilemap for Results & Stage Select
seekAddr($81D41C); db $FF,$00 //db $0E,$1D
seekAddr($81D430); db $FF,$00 //db $1E,$1D
seekAddr($81D750); db $FF,$00 //db $0E,$1D
seekAddr($81D772); db $FF,$00 //db $1E,$1D

seekAddr($81D7B8); db $0E,$1D //db $FF,$00
seekAddr($81D7DA); db $1E,$1D //db $FF,$00


seekAddr($B08000)
insert ep1_pal_title,"../roms/bs_supermariousa_ep1.bs",0x4FC00,0x20; insert "../gfx/temp/ep1_en.pal"
insert ep2_pal_title,"../roms/bs_supermariousa_ep2.bs",0x4FC00,0x20; insert "../gfx/temp/ep2_en.pal"
insert ep3_pal_title,"../roms/bs_supermariousa_ep3.bs",0x4FC00,0x20; insert "../gfx/temp/ep3_en.pal"
insert ep4_pal_title,"../roms/bs_supermariousa_ep4.bs",0x4FC00,0x20; insert "../gfx/temp/ep4_en.pal"
insert ep4_pal_end,"../gfx/temp/the_end_en.pal"

seekAddr($B18000)
insert ep1_map_title,"../gfx/temp/ep1_en.map"
insert ep2_map_title,"../gfx/temp/ep2_en.map"
insert ep3_map_title,"../gfx/temp/ep3_en.map"
insert ep4_map_title,"../gfx/temp/ep4_en.map"
insert ep4_map_end,"../gfx/temp/the_end_en.map"

seekAddr($B28000); insert ep1_chr_title,"../gfx/temp/ep1_en.chr"
seekAddr($B38000); insert ep2_chr_title,"../gfx/temp/ep2_en.chr"
seekAddr($B48000); insert ep3_chr_title,"../gfx/temp/ep3_en.chr"
seekAddr($B58000); insert ep4_chr_title,"../gfx/temp/ep4_en.chr"
seekAddr($B68000); insert ep4_chr_end,"../gfx/temp/the_end_en.chr"
dequeue pc
