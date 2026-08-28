//Menu Graphics
insert menu_pal_bg1,"../gfx/temp/bg1_jp.pal"
insert menu_chr_bg1,"../gfx/temp/bg1_jp.chr"
insert menu_map_bg1,"../gfx/temp/bg1_jp.map"

insert menu_pal_obj_logo,"../gfx/temp/obj_logo_jp.pal"
insert menu_chr_obj_logo,"../gfx/temp/obj_logo_jp.chr"

//Episode Specific
//Differing Data between episodes:
//File		SNES	  Size
//0x49800 - $899800 - 0x800		= Tilemap (Current Episode)
//0x4A000 - $89A000	- 0x800		= Tilemap (Next Episode?)
//0x4F400 - $89F400 - 0x200		= Palette (Ad?) (Unused)
//0x4FC00 - $89FC00 - 0x200		= Palette (Current Episode)
//0x4FE00 - $89FE00 - 0x200		= Palette (Next Episode)
//0x50000 - $8A8000 - 0x7800	= Graphics (Ad?) (Unused)
//0x57800 - $8AF800 - 0x800		= Tilemap (Ad?) (Unused)
//0x70000 - $8E8000 - 0x8000	= Graphics (Current Episode)
//0x78000 - $8F8000 - 0x8000	= Graphics (Next Episode)

//Episode Title Cards and The End
enqueue pc
seekAddr($B08000)
insert ep1_pal_title,"../roms/bs_supermariousa_ep1.bs",0x4FC00,0x200
insert ep2_pal_title,"../roms/bs_supermariousa_ep2.bs",0x4FC00,0x200
insert ep3_pal_title,"../roms/bs_supermariousa_ep3.bs",0x4FC00,0x200
insert ep4_pal_title,"../roms/bs_supermariousa_ep4.bs",0x4FC00,0x200
insert ep4_pal_end,"../roms/bs_supermariousa_ep4.bs",0x4FE00,0x200

seekAddr($B18000)
insert ep1_map_title,"../roms/bs_supermariousa_ep1.bs",0x49800,0x800
insert ep2_map_title,"../roms/bs_supermariousa_ep2.bs",0x49800,0x800
insert ep3_map_title,"../roms/bs_supermariousa_ep3.bs",0x49800,0x800
insert ep4_map_title,"../roms/bs_supermariousa_ep4.bs",0x49800,0x800
insert ep4_map_end,"../roms/bs_supermariousa_ep4.bs",0x4A000,0x800

seekAddr($B28000); insert ep1_chr_title,"../roms/bs_supermariousa_ep1.bs",0x70000,0x8000
seekAddr($B38000); insert ep2_chr_title,"../roms/bs_supermariousa_ep2.bs",0x70000,0x8000
seekAddr($B48000); insert ep3_chr_title,"../roms/bs_supermariousa_ep3.bs",0x70000,0x8000
seekAddr($B58000); insert ep4_chr_title,"../roms/bs_supermariousa_ep4.bs",0x70000,0x8000
seekAddr($B68000); insert ep4_chr_end,"../roms/bs_supermariousa_ep4.bs",0x78000,0x8000
dequeue pc
