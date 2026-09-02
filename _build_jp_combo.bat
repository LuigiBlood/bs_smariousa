@echo off
echo Assembling Combo Version... (Japanese Version)
echo - jp/bg1_jp.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/jp/bg1_jp.png" -p "./gfx/temp/bg1_jp.pal" -t "./gfx/temp/bg1_jp.chr" -m "./gfx/temp/bg1_jp.map" --palette-base-offset 7
echo - bg2.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/bg2.png" -p "./gfx/temp/bg2.pal" -t "./gfx/temp/bg2.chr" -m "./gfx/temp/bg2.map"
echo - msu1.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/msu1.png" -p "./gfx/temp/msu1.pal" -t "./gfx/temp/msu1.chr" -m "./gfx/temp/msu1.map"
echo - icons.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/icons.png" -p "./gfx/temp/icons.pal" -t "./gfx/temp/icons.chr" -S -W 16 -H 16
echo - jp/obj_logo_jp.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/jp/obj_logo_jp.png" -p "./gfx/temp/obj_logo_jp.pal" -t "./gfx/temp/obj_logo_jp.chr" -S -D -W 16 -H 16
"./tools/bass/bass" ./build/build_jp_combo.asm
echo Done.
pause