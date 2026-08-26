seekAddr($A08000)

include "./hacks/episode.asm"
include "./hacks/sram.asm"
include "./hacks/time.asm"
include "./hacks/bsx.asm"
include "./hacks/msu1.asm"
include "./hacks/reset.asm"

seekAddr($A18000)

include "./menu/init.asm"
include "./menu/joypad.asm"
include "./menu/ppu.asm"
include "./menu/apu.asm"
include "./menu/save.asm"
include "./menu/msu1.asm"
include "./menu/menu_init.asm"
include "./menu/menu_main.asm"
include "./menu/menu_logo.asm"
include "./menu/menu_logo_msu1.asm"
include "./menu/menu_state_extra.asm"
include "./menu/menu_assets.asm"
