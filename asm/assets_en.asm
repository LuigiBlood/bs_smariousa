
insert menu_pal_bg1,"../gfx/temp/bg1_en.pal"
insert menu_chr_bg1,"../gfx/temp/bg1_en.chr"
insert menu_map_bg1,"../gfx/temp/bg1_en.map"

insert menu_pal_obj_logo,"../gfx/temp/obj_logo_en.pal"
insert menu_chr_obj_logo,"../gfx/temp/obj_logo_en.chr"

//Include all graphics
enqueue pc
seekAddr($81E706)	//Type A (JUMP)
db $01,$76,$00,$07
db $BD,$08,$BD,$08,$BD,$08,$BD,$08
db $01,$96,$00,$07
db $09,$09,$0A,$09,$0B,$09,$BD,$08
db $01,$B6,$00,$09
db $BD,$08,$BD,$08,$BD,$08,$BD,$08,$BD,$08
db $01,$F1,$00,$03
db $44,$09,$45,$09
db $FF

seekAddr($81E735)	//Type B (DASH, PICK UP)
db $01,$76,$00,$07
db $BD,$08,$BD,$08,$BD,$08,$BD,$08
db $01,$96,$00,$07
db $55,$09,$56,$09,$57,$09,$58,$09
db $01,$B6,$00,$09
db $06,$09,$07,$09,$08,$09,$BD,$08,$BD,$08
db $01,$F1,$00,$03
db $46,$09,$47,$09
db $FF

seekAddr($89A800); insert "../gfx/en/controls.map"
seekAddr($99A800); insert "../gfx/en/controls.chr"


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
