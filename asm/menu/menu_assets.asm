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
db $87,$4E+(8*0)-8,$10,$32, $87,$4E+(8*0)+1,$12,$32
db $87,$4E+(8*3)-8,$10,$32, $87,$4E+(8*3)+1,$12,$32
db $87,$4E+(8*6)-8,$10,$32, $87,$4E+(8*6)+1,$12,$32
db $87,$4E+(8*9)-8,$10,$32, $87,$4E+(8*9)+1,$12,$32
menu_oam_icons_end:

menu_oam_obj_logo_jp:
db $6F+($00*8),$2D-16,$30+$00,$3E
db $6F+($02*8),$2D-16,$30+$02,$3E

db $30-3+($02*8)+2,$2D,$30+$04,$3E
db $30-3+($04*8)+2,$2D,$30+$06,$3E
db $30-3+($05*8)+2,$2D,$30+$07,$3E

db $30-3+($07*8)+4,$2D,$30+$09,$3E
db $30-3+($09*8)+4,$2D,$30+$0B,$3E
db $30-3+($0A*8)+4,$2D,$30+$0C,$3E

db $30-3+($0C*8)+6,$2D,$30+$0E,$3E
db $30-3+($0E*8)+6,$2D,$30+$20,$3E
db $30-3+($10*8)+6,$2D,$30+$22,$3E
db $30-3+($12*8)+6,$2D,$30+$24,$3E
menu_oam_obj_logo_jp_end:

menu_oam_obj_logo_jp_2:
db %10101000,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010
menu_oam_obj_logo_jp_2_end:

menu_map_empty:
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
dw $1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00,$1C00
menu_map_empty_end:
