//Include various graphics
enqueue pc

//Macros
inline insert_credits2(file) {
	//0x0000
	define x = 0
	while {x} < 32 {
		insert {file},16*2*({x}+0),16*2
		insert {file},16*2*({x}+(16*3)),16*2
		evaluate x = ({x} + 1)
	}

	//0x0800
	define x = 0
	while {x} < 32 {
		insert {file},16*2*({x}+96),16*2
		insert {file},16*2*({x}+(16*3)+96),16*2
		evaluate x = ({x} + 1)
	}

	//0x1000
	define x = 0
	while {x} < 32 {
		insert {file},16*2*({x}+32),16*2
		insert {file},16*2*({x}+(16*3)+32),16*2
		evaluate x = ({x} + 1)
	}

	//0x1800
	define x = 0
	while {x} < 32 {
		insert {file},16*2*({x}+96+32),16*2
		insert {file},16*2*({x}+(16*3)+96+32),16*2
		evaluate x = ({x} + 1)
	}
}

//Episode Title Cards and The End
seekAddr($B08000)
insert ep1_pal_title,"../../roms/bs_supermariousa_ep1.bs",0x4FC00,0x20; insert "../../gfx/temp/ep1_en.pal"
insert ep2_pal_title,"../../roms/bs_supermariousa_ep2.bs",0x4FC00,0x20; insert "../../gfx/temp/ep2_en.pal"
insert ep3_pal_title,"../../roms/bs_supermariousa_ep3.bs",0x4FC00,0x20; insert "../../gfx/temp/ep3_en.pal"
insert ep4_pal_title,"../../roms/bs_supermariousa_ep4.bs",0x4FC00,0x20; insert "../../gfx/temp/ep4_en.pal"
insert ep4_pal_end,"../../gfx/temp/the_end_en.pal"
ep1_pal_credits:
	fill $200,0

enqueue pc
seekAddr(ep1_pal_credits+0x00)
	insert "../../gfx/temp/credits2_ep1_2.pal"
seekAddr(ep1_pal_credits+0x20)
	insert "../../gfx/temp/credits2_ep1_1.pal"
seekAddr(ep1_pal_title); insert "../../gfx/temp/credits1.pal"
seekAddr(ep2_pal_title); insert "../../gfx/temp/credits1.pal"
seekAddr(ep3_pal_title); insert "../../gfx/temp/credits1.pal"
seekAddr(ep4_pal_title); insert "../../gfx/temp/credits1.pal"
dequeue pc


seekAddr($B18000)
insert ep1_map_title,"../../gfx/temp/ep1_en.map"	//0x800 bytes
insert ep2_map_title,"../../gfx/temp/ep2_en.map"	//0x800 bytes
insert ep3_map_title,"../../gfx/temp/ep3_en.map"	//0x800 bytes
insert ep4_map_title,"../../gfx/temp/ep4_en.map"	//0x800 bytes
insert ep4_map_end,"../../gfx/temp/the_end_en.map"	//0x800 bytes
ep1_map_credits2_bg1:
	insert_credits2("../../gfx/temp/credits2_ep1_1.map")	//0x2000 bytes
ep1_map_credits2_bg3:
	insert_credits2("../../gfx/temp/credits2_ep1_2.map")	//0x2000 bytes

seekAddr($B28000); insert ep1_chr_title,"../../gfx/temp/ep1_en.chr"
seekAddr($B38000); insert ep2_chr_title,"../../gfx/temp/ep2_en.chr"
seekAddr($B48000); insert ep3_chr_title,"../../gfx/temp/ep3_en.chr"
seekAddr($B58000); insert ep4_chr_title,"../../gfx/temp/ep4_en.chr"
seekAddr($B68000); insert ep4_chr_end,"../../gfx/temp/the_end_en.chr"
seekAddr($B78000); insert ep1_chr_credits_bg1,"../../gfx/temp/credits2_ep1_1.chr"
seekAddr($B88000); insert ep1_chr_credits_bg3,"../../gfx/temp/credits2_ep1_2.chr"

dequeue pc
