//8x8 tiles
//$80A984 - PAL (16-color)
//$81E764 - MAP (RLE) (Ptr: $81CEF5)
//$9B9400 - GFX

enqueue pc
seekAddr($80A984); insert "../../gfx/temp/createdby.pal"
seekAddr($9B9400); insert "../../gfx/temp/createdby.chr"
seekAddr($81CEF5); dl map_createdby

dequeue pc
map_createdby:
db $00,$00,$07,$FF; insert "../../gfx/temp/createdby.map"
db $FF