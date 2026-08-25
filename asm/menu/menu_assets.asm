//insert menu_pal,"../../gfx/work/test.pal"
//insert menu_chr,"../../gfx/work/test.chr"
//insert menu_map,"../../gfx/work/test.map"
insert menu_pal_bg1,"../../gfx/temp/bg1_jp.pal"
insert menu_chr_bg1,"../../gfx/temp/bg1_jp.chr"
insert menu_map_bg1,"../../gfx/temp/bg1_jp.map"

insert menu_pal_bg2,"../../gfx/temp/bg2.pal"
insert menu_chr_bg2,"../../gfx/temp/bg2.chr"
insert menu_map_bg2,"../../gfx/temp/bg2.map"

insert menu_pal_icons,"../../gfx/temp/icons.pal"
insert menu_chr_icons,"../../gfx/temp/icons.chr"

insert menu_pal_obj_logo_jp,"../../gfx/temp/obj_logo_jp.pal"
insert menu_chr_obj_logo_jp,"../../gfx/temp/obj_logo_jp.chr"

menu_oam_icons:
db $86,$4E+(8*0)-8,$10,$32, $86,$4E+(8*0)+1,$12,$32
db $86,$4E+(8*3)-8,$10,$32, $86,$4E+(8*3)+1,$12,$32
db $86,$4E+(8*6)-8,$10,$32, $86,$4E+(8*6)+1,$12,$32
db $86,$4E+(8*9)-8,$10,$32, $86,$4E+(8*9)+1,$12,$32
menu_oam_icons_end:
constant menu_oam_icons_size = menu_oam_icons_end-menu_oam_icons

menu_oam_obj_logo:
db $3F+(16*0),$2D-16,$30+(2*0),$3E
db $3F+(16*1),$2D-16,$30+(2*1),$3E
db $3F+(16*2),$2D-16,$30+(2*2),$3E
db $3F+(16*3),$2D-16,$30+(2*3),$3E
db $3F+(16*4),$2D-16,$30+(2*4),$3E
db $3F+(16*5),$2D-16,$30+(2*5),$3E
db $3F+(16*6),$2D-16,$30+(2*6),$3E
db $3F+(16*7),$2D-16,$30+(2*7),$3E
db $3F+(16*8),$2D-16,$30+(16+2*8),$3E

db $3F+(16*0),$2D,$30+(16+2*9),$3E
db $3F+(16*1),$2D,$30+(16+2*10),$3E
db $3F+(16*2),$2D,$30+(16+2*11),$3E
db $3F+(16*3),$2D,$30+(16+2*12),$3E
db $3F+(16*4),$2D,$30+(16+2*13),$3E
db $3F+(16*5),$2D,$30+(16+2*14),$3E
db $3F+(16*6),$2D,$30+(16+2*15),$3E
db $3F+(16*7),$2D,$30+(32+2*16),$3E
db $3F+(16*8),$2D,$30+(32+2*17),$3E
menu_oam_obj_logo_end:
constant menu_oam_obj_logo_size = menu_oam_obj_logo_end-menu_oam_obj_logo

menu_oam_obj_menu:
db %10101000,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010
menu_oam_obj_menu_end:
constant menu_oam_obj_menu_size = menu_oam_obj_menu_end-menu_oam_obj_menu

menu_map_empty:
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
menu_map_empty_end:
constant menu_map_empty_size = menu_map_empty_end-menu_map_empty
