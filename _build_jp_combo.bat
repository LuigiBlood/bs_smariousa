@echo off
echo Assembling Combo Version... (Japanese Version)
"./tools/conv/superfamiconv.exe" -i "./gfx/work/test.png" -p "./gfx/work/test.pal" -t "./gfx/work/test.chr" -m "./gfx/work/test.map"
"./tools/conv/superfamiconv.exe" -i "./gfx/work/bg1_jp.png" -p "./gfx/work/bg1_jp.pal" -t "./gfx/work/bg1_jp.chr" -m "./gfx/work/bg1_jp.map" -P 7
"./tools/conv/superfamiconv.exe" -i "./gfx/work/bg2.png" -p "./gfx/work/bg2.pal" -t "./gfx/work/bg2.chr" -m "./gfx/work/bg2.map"
"./tools/bass/bass" build_jp_combo.asm
echo Done.
pause