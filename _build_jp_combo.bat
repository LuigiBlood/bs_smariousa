@echo off
echo Assembling Combo Version... (Japanese Version)
"./tools/conv/superfamiconv.exe" -i "./gfx/work/test.png" -p "./gfx/work/test.pal" -t "./gfx/work/test.chr" -m "./gfx/work/test.map"
"./tools/bass/bass" build_jp_combo.asm
echo Done.
pause