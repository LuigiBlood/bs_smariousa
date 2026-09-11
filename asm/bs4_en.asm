seekAddr($86CA00)
include "./en/controls.asm"
include "./en/pause.asm"
include "./en/stageselect.asm"
include "./en/credits1.asm"
include "./en/credits2_bs.asm"
include "./en/createdby.asm"
include "./en/confirmrecord_bs.asm"
include "./en/postcard_bs.asm"

print hex:pc(), "\n"
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

seekAddr($89F200)
pal_credits:
	fill $200,0
enqueue pc
	seekAddr(pal_credits+0x00); insert "../gfx/temp/credits2_ep4_2.pal"
	seekAddr(pal_credits+0x20);	insert "../gfx/temp/credits2_ep4_1.pal"
dequeue pc

seekAddr($888000)
	insert_credits2("../gfx/temp/credits2_ep4_1.map")
seekAddr($88A000)
	insert_credits2("../gfx/temp/credits2_ep4_2.map")

seekAddr($908000); insert chr_credits_bg1,"../gfx/temp/credits2_ep4_1.chr"
seekAddr($8A8000); insert chr_credits_bg3,"../gfx/temp/credits2_ep4_2.chr"

//Episode Title Card and The End
seekAddr($89FC00); insert ep_curr_pal_title,"../roms/bs_supermariousa_ep4.bs",0x4FC00,0x20; insert "../gfx/temp/ep4_en.pal"
seekAddr($89FE00); insert ep_next_pal_title,"../gfx/temp/the_end_en.pal"

enqueue pc
seekAddr(ep_curr_pal_title); insert "../gfx/temp/credits1.pal"
seekAddr(ep_next_pal_title); insert "../gfx/temp/credits1.pal"
dequeue pc

seekAddr($899800); insert ep_curr_map_title,"../gfx/temp/ep4_en.map"	//0x800 bytes
seekAddr($89A000); insert ep_next_map_title,"../gfx/temp/the_end_en.map"	//0x800 bytes

seekAddr($8E8000); insert ep_curr_chr_title,"../gfx/temp/ep4_en.chr"
seekAddr($8F8000); insert ep_next_chr_title,"../gfx/temp/the_end_en.chr"
dequeue pc
