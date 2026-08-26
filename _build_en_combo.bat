@echo off
echo Assembling Combo Version... (English Version)
echo - en/bg1_en.png
"./tools/conv/superfamiconv.exe" -i "./gfx/en/bg1_en.png" -p "./gfx/temp/bg1_en.pal" -t "./gfx/temp/bg1_en.chr" -m "./gfx/temp/bg1_en.map" -P 7
echo - bg2.png
"./tools/conv/superfamiconv.exe" -i "./gfx/bg2.png" -p "./gfx/temp/bg2.pal" -t "./gfx/temp/bg2.chr" -m "./gfx/temp/bg2.map"
echo - icons.png
"./tools/conv/superfamiconv.exe" -i "./gfx/icons.png" -p "./gfx/temp/icons.pal" -t "./gfx/temp/icons.chr" -S -W 16 -H 16
echo - en/obj_logo_en.png
"./tools/conv/superfamiconv.exe" -i "./gfx/en/obj_logo_en.png" -p "./gfx/temp/obj_logo_en.pal" -t "./gfx/temp/obj_logo_en.chr" -S -D -W 16 -H 16
echo - en/ep1.png
"./tools/conv/superfamiconv.exe" -i "./gfx/en/ep1.png" -p "./gfx/temp/ep1_en.pal" -t "./gfx/temp/ep1_en.chr" -m "./gfx/temp/ep1_en.map" -B 4 --color-zero 000000
"./tools/conv/superfamiconv.exe" palette -i "./gfx/en/ep1_pal.png" -d "./gfx/temp/ep1_en.pal" -B 4 -H 8 -W 128 --color-zero 000000
"./tools/conv/superfamiconv.exe" tiles -i "./gfx/en/ep1.png" -p "./gfx/temp/ep1_en.pal" -d "./gfx/temp/ep1_en.chr" -B 4
"./tools/conv/superfamiconv.exe" map -i "./gfx/en/ep1.png" -p "./gfx/temp/ep1_en.pal" -t "./gfx/temp/ep1_en.chr" -d "./gfx/temp/ep1_en.map" -B 4
echo - en/ep2.png
"./tools/conv/superfamiconv.exe" -i "./gfx/en/ep2.png" -p "./gfx/temp/ep2_en.pal" -t "./gfx/temp/ep2_en.chr" -m "./gfx/temp/ep2_en.map" -B 4 --color-zero 000000
echo - en/ep3.png
"./tools/conv/superfamiconv.exe" -i "./gfx/en/ep3.png" -p "./gfx/temp/ep3_en.pal" -t "./gfx/temp/ep3_en.chr" -m "./gfx/temp/ep3_en.map" -B 4 --color-zero 000000
echo - en/ep4.png
"./tools/conv/superfamiconv.exe" -i "./gfx/en/ep4.png" -p "./gfx/temp/ep4_en.pal" -t "./gfx/temp/ep4_en.chr" -m "./gfx/temp/ep4_en.map" -B 4 --color-zero 000000
echo - en/the_end.png
"./tools/conv/superfamiconv.exe" -i "./gfx/en/the_end.png" -p "./gfx/temp/the_end_en.pal" -t "./gfx/temp/the_end_en.chr" -m "./gfx/temp/the_end_en.map" -B 4 --color-zero 000000
"./tools/bass/bass" build_en_combo.asm
echo Done.
pause