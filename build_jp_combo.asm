//Build BS Super Mario USA - Power Challenge (Japanese)
//Standalone Combo (All Episodes) Version
architecture snes.cpu

include "./inc/snes.inc"
include "./inc/snes_alloc.inc"
include "./inc/snes_dma.inc"
include "./inc/snes_msu1.inc"
include "./inc/macros_lorom.inc"

output "./out/bs_supermariousa_combo_jp.sfc", create
seekFile(0); fill $200000,$FF
seekFile(0); insert "./roms/bs_supermariousa_ep1.bs"

include "./asm/combo_jp.asm"

seekAddr($86800C); db 0		//Episode (0-3)
seekAddr($86800E); db 0		//?
seekAddr($86800F); db 0		//?

seekFile(0x7FC0); db "                     "
seekFile(0x7FC0); db "BS",0x83,0x58,0x81,0x5B,0x83,0x70,0x81,0x5B,0x83,0x7D,0x83,0x8A,0x83,0x49,"USA"
seekFile(0x7FD5); db 0x30	//Map Mode LoROM + FastROM
seekFile(0x7FD6); db 0x02	//ROM+RAM+Battery
seekFile(0x7FD7); db 0x0B	//2MB ROM
seekFile(0x7FD8); db 0x05	//32 KB SRAM
seekFile(0x7FD9); db 0x00	//Japan / ALL region
seekFile(0x7FDA); db 0x33	//Fixed
seekFile(0x7FDB); db 0x00	//ROM Version 0
seekFile(0x7FDC); dw 0,-1	//Checksums
