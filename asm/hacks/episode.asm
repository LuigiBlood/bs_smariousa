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

//Differing Data between episodes:
//File		SNES	  Size
//0x49800 - $899800 - 0x800		= Tilemap
//0x4A000 - $89A000	- 0x800		= Tilemap
//0x4F400 - $89F400 - 0x200		= Palette
//0x4FC00 - $89FC00 - 0x200		= Palette
//0x4FE00 - $89FE00 - 0x200		= Palette
//0x50000 - $8A8000 - 0x7800	= Graphics (Ad?)
//0x57800 - $8AF800 - 0x800		= Tilemap (Ad?)
//0x70000 - $8E8000 - 0x8000	= Graphics (Current Episode)
//0x78000 - $8F8000 - 0x8000	= Graphics (Next Episode)

//Include 
enqueue pc
seekAddr($899800); //insert ep1_map1,"../../roms/bs_supermariousa_ep1.bs",0x49800,0x800
seekAddr($89A000); //insert ep1_map2,"../../roms/bs_supermariousa_ep1.bs",0x4A000,0x800
seekAddr($89F400); //insert ep1_pal1,"../../roms/bs_supermariousa_ep1.bs",0x4F400,0x200
seekAddr($89FC00); //insert ep1_pal2,"../../roms/bs_supermariousa_ep1.bs",0x4FC00,0x200
seekAddr($89FE00); //insert ep1_pal3,"../../roms/bs_supermariousa_ep1.bs",0x4FE00,0x200
seekAddr($8A8000); //insert ep1_chr1,"../../roms/bs_supermariousa_ep1.bs",0x50000,0x8000
seekAddr($8AF800); //insert ep1_map3,"../../roms/bs_supermariousa_ep1.bs",0x57800,0x800
seekAddr($8E8000); //insert ep1_chr2,"../../roms/bs_supermariousa_ep1.bs",0x70000,0x8000
seekAddr($8F8000); //insert ep1_chr3,"../../roms/bs_supermariousa_ep1.bs",0x78000,0x8000

seekAddr($B08000)
insert ep1_pal1,"../../roms/bs_supermariousa_ep1.bs",0x4F400,0x200
insert ep1_pal2,"../../roms/bs_supermariousa_ep1.bs",0x4FC00,0x200
insert ep1_pal3,"../../roms/bs_supermariousa_ep1.bs",0x4FE00,0x200
insert ep2_pal1,"../../roms/bs_supermariousa_ep2.bs",0x4F400,0x200
insert ep2_pal2,"../../roms/bs_supermariousa_ep2.bs",0x4FC00,0x200
insert ep2_pal3,"../../roms/bs_supermariousa_ep2.bs",0x4FE00,0x200
insert ep3_pal1,"../../roms/bs_supermariousa_ep3.bs",0x4F400,0x200
insert ep3_pal2,"../../roms/bs_supermariousa_ep3.bs",0x4FC00,0x200
insert ep3_pal3,"../../roms/bs_supermariousa_ep3.bs",0x4FE00,0x200
insert ep4_pal1,"../../roms/bs_supermariousa_ep4.bs",0x4F400,0x200
insert ep4_pal2,"../../roms/bs_supermariousa_ep4.bs",0x4FC00,0x200
insert ep4_pal3,"../../roms/bs_supermariousa_ep4.bs",0x4FE00,0x200

seekAddr($B18000)
insert ep1_map1,"../../roms/bs_supermariousa_ep1.bs",0x49800,0x800
insert ep1_map2,"../../roms/bs_supermariousa_ep1.bs",0x4A000,0x800
insert ep2_map1,"../../roms/bs_supermariousa_ep2.bs",0x49800,0x800
insert ep2_map2,"../../roms/bs_supermariousa_ep2.bs",0x4A000,0x800
insert ep3_map1,"../../roms/bs_supermariousa_ep3.bs",0x49800,0x800
insert ep3_map2,"../../roms/bs_supermariousa_ep3.bs",0x4A000,0x800
insert ep4_map1,"../../roms/bs_supermariousa_ep4.bs",0x49800,0x800
insert ep4_map2,"../../roms/bs_supermariousa_ep4.bs",0x4A000,0x800

seekAddr($B28000)
insert ep1_chr2,"../../roms/bs_supermariousa_ep1.bs",0x70000,0x8000
insert ep1_chr3,"../../roms/bs_supermariousa_ep1.bs",0x78000,0x8000
insert ep2_chr2,"../../roms/bs_supermariousa_ep2.bs",0x70000,0x8000
insert ep2_chr3,"../../roms/bs_supermariousa_ep2.bs",0x78000,0x8000
insert ep3_chr2,"../../roms/bs_supermariousa_ep3.bs",0x70000,0x8000
insert ep3_chr3,"../../roms/bs_supermariousa_ep3.bs",0x78000,0x8000
insert ep4_chr2,"../../roms/bs_supermariousa_ep4.bs",0x70000,0x8000
insert ep4_chr3,"../../roms/bs_supermariousa_ep4.bs",0x78000,0x8000
dequeue pc
