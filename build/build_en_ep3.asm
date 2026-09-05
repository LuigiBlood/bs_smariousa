//Build BS Super Mario USA - Power Challenge (Japanese)
//Episode 3 - Satellaview Version
architecture snes.cpu

include "../inc/snes.inc"
include "../inc/snes_alloc.inc"
include "../inc/snes_dma.inc"
include "../inc/snes_gfx.inc"
include "../inc/macros_lorom.inc"

output "../out/bs_supermariousa_ep3_en.bs", create
seekFile(0); fill $100000,$FF
seekFile(0); insert "../roms/bs_supermariousa_ep3.bs"

include "../asm/bs3_en.asm"

seekAddr($86800C); db 2		//Episode (0-3)
seekAddr($86800E); db 0		//?
seekAddr($86800F); db 0		//?

seekFile(0x7FC0); db "                "
seekFile(0x7FC0); db "BS MARIO 2 EP 3"
seekFile(0x7FDC); dw 0,-1	//Checksums
