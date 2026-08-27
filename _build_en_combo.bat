@echo off
echo Building Combo Version... (English Version)
echo -- Graphics
echo - en/bg1_en.png
"./tools/conv/superfamiconv.exe" -i "./gfx/en/bg1_en.png" -p "./gfx/temp/bg1_en.pal" -t "./gfx/temp/bg1_en.chr" -m "./gfx/temp/bg1_en.map" -P 7
echo - bg2.png
"./tools/conv/superfamiconv.exe" -i "./gfx/bg2.png" -p "./gfx/temp/bg2.pal" -t "./gfx/temp/bg2.chr" -m "./gfx/temp/bg2.map"
echo - msu1.png
"./tools/conv/superfamiconv.exe" -i "./gfx/msu1.png" -p "./gfx/temp/msu1.pal" -t "./gfx/temp/msu1.chr" -m "./gfx/temp/msu1.map"
echo - icons.png
"./tools/conv/superfamiconv.exe" -i "./gfx/icons.png" -p "./gfx/temp/icons.pal" -t "./gfx/temp/icons.chr" -S -W 16 -H 16
echo - en/obj_logo_en.png
"./tools/conv/superfamiconv.exe" -i "./gfx/en/obj_logo_en.png" -p "./gfx/temp/obj_logo_en.pal" -t "./gfx/temp/obj_logo_en.chr" -S -D -W 16 -H 16
echo - en/ep1.png (+ Palette)
rem "./tools/conv/superfamiconv.exe" -i "./gfx/en/ep1.png" -p "./gfx/temp/ep1_en.pal" -t "./gfx/temp/ep1_en.chr" -m "./gfx/temp/ep1_en.map" -B 4 -P 1 --color-zero 000000
"./tools/conv/superfamiconv.exe" palette -i "./gfx/en/ep1_pal.png" -d "./gfx/temp/ep1_en.pal" -o "./gfx/temp/ep1_en.pal.png" -H 8 -W 256 --color-zero 000000
"./tools/conv/superfamiconv.exe" tiles -i "./gfx/en/ep1.png" -p "./gfx/temp/ep1_en.pal" -d "./gfx/temp/ep1_en.chr" -B 4
"./tools/conv/superfamiconv.exe" map -i "./gfx/en/ep1.png" -p "./gfx/temp/ep1_en.pal" -t "./gfx/temp/ep1_en.chr" -d "./gfx/temp/ep1_en.map" -B 4 -P 1
echo - en/ep2.png (+ Palette)
rem "./tools/conv/superfamiconv.exe" -i "./gfx/en/ep2.png" -p "./gfx/temp/ep2_en.pal" -t "./gfx/temp/ep2_en.chr" -m "./gfx/temp/ep2_en.map" -B 4 -P 1 --color-zero 000000
"./tools/conv/superfamiconv.exe" palette -i "./gfx/en/ep2_pal.png" -d "./gfx/temp/ep2_en.pal" -o "./gfx/temp/ep2_en.pal.png" -H 8 -W 256 --color-zero 000000
"./tools/conv/superfamiconv.exe" tiles -i "./gfx/en/ep2.png" -p "./gfx/temp/ep2_en.pal" -d "./gfx/temp/ep2_en.chr" -B 4
"./tools/conv/superfamiconv.exe" map -i "./gfx/en/ep2.png" -p "./gfx/temp/ep2_en.pal" -t "./gfx/temp/ep2_en.chr" -d "./gfx/temp/ep2_en.map" -B 4 -P 1
echo - en/ep3.png (+ Palette)
rem "./tools/conv/superfamiconv.exe" -i "./gfx/en/ep3.png" -p "./gfx/temp/ep3_en.pal" -t "./gfx/temp/ep3_en.chr" -m "./gfx/temp/ep3_en.map" -B 4 -P 1 --color-zero 000000
"./tools/conv/superfamiconv.exe" palette -i "./gfx/en/ep3_pal.png" -d "./gfx/temp/ep3_en.pal" -o "./gfx/temp/ep3_en.pal.png" -H 8 -W 256 --color-zero 000000
"./tools/conv/superfamiconv.exe" tiles -i "./gfx/en/ep3.png" -p "./gfx/temp/ep3_en.pal" -d "./gfx/temp/ep3_en.chr" -B 4
"./tools/conv/superfamiconv.exe" map -i "./gfx/en/ep3.png" -p "./gfx/temp/ep3_en.pal" -t "./gfx/temp/ep3_en.chr" -d "./gfx/temp/ep3_en.map" -B 4 -P 1
echo - en/ep4.png (+ Palette)
rem "./tools/conv/superfamiconv.exe" -i "./gfx/en/ep4.png" -p "./gfx/temp/ep4_en.pal" -t "./gfx/temp/ep4_en.chr" -m "./gfx/temp/ep4_en.map" -B 4 -P 1 --color-zero 000000
"./tools/conv/superfamiconv.exe" palette -i "./gfx/en/ep4_pal.png" -d "./gfx/temp/ep4_en.pal" -o "./gfx/temp/ep4_en.pal.png" -H 8 -W 256 --color-zero 000000
"./tools/conv/superfamiconv.exe" tiles -i "./gfx/en/ep4.png" -p "./gfx/temp/ep4_en.pal" -d "./gfx/temp/ep4_en.chr" -B 4
"./tools/conv/superfamiconv.exe" map -i "./gfx/en/ep4.png" -p "./gfx/temp/ep4_en.pal" -t "./gfx/temp/ep4_en.chr" -d "./gfx/temp/ep4_en.map" -B 4 -P 1
echo - en/the_end.png
"./tools/conv/superfamiconv.exe" -i "./gfx/en/the_end.png" -p "./gfx/temp/the_end_en.pal" -t "./gfx/temp/the_end_en.chr" -m "./gfx/temp/the_end_en.map" -B 4 --color-zero 000000
echo - en/controls_text.png
"./tools/conv/superfamiconv.exe" tiles -i "./gfx/en/controls_text.png" -p "./gfx/en/controls.pal" -d "./gfx/temp/controls_text.chr" -B 4 -W 16 -H 16
"./tools/conv/superfamiconv.exe" map -i "./gfx/en/controls_text.png" -p "./gfx/en/controls.pal" -t "./gfx/temp/controls_text.chr" -d "./gfx/temp/controls_text.map" -B 4 -P 2 -T 352
echo -- Build ROM...
"./tools/bass/bass" build_en_combo.asm
echo Done.
pause