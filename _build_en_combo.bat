@echo off
echo Building Combo Version... (English Version)
echo -- Graphics
echo - en/bg1_en.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/bg1_en.png" -p "./gfx/temp/bg1_en.pal" -t "./gfx/temp/bg1_en.chr" -m "./gfx/temp/bg1_en.map" --palette-base-offset 7
echo - bg2.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/bg2.png" -p "./gfx/temp/bg2.pal" -t "./gfx/temp/bg2.chr" -m "./gfx/temp/bg2.map"
echo - msu1.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/msu1.png" -p "./gfx/temp/msu1.pal" -t "./gfx/temp/msu1.chr" -m "./gfx/temp/msu1.map"
echo - icons.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/icons.png" -p "./gfx/temp/icons.pal" -t "./gfx/temp/icons.chr" -S -W 16 -H 16
echo - en/obj_logo_en.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/obj_logo_en.png" -p "./gfx/temp/obj_logo_en.pal" -t "./gfx/temp/obj_logo_en.chr" -S -D -W 16 -H 16

echo - en/ep1.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/ep1.png" -p "./gfx/temp/ep1_en.pal" -t "./gfx/temp/ep1_en.chr" -m "./gfx/temp/ep1_en.map" -B 4 -N 7 --palette-base-offset 1 --color-zero 000000
echo - en/ep2.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/ep2.png" -p "./gfx/temp/ep2_en.pal" -t "./gfx/temp/ep2_en.chr" -m "./gfx/temp/ep2_en.map" -B 4 -N 7 --palette-base-offset 1 --color-zero 000000
echo - en/ep3.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/ep3.png" -p "./gfx/temp/ep3_en.pal" -t "./gfx/temp/ep3_en.chr" -m "./gfx/temp/ep3_en.map" -B 4 -N 7 --palette-base-offset 1 --color-zero 000000
echo - en/ep4.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/ep4.png" -p "./gfx/temp/ep4_en.pal" -t "./gfx/temp/ep4_en.chr" -m "./gfx/temp/ep4_en.map" -B 4 -N 7 --palette-base-offset 1 --color-zero 000000
echo - en/the_end.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/the_end.png" -p "./gfx/temp/the_end_en.pal" -t "./gfx/temp/the_end_en.chr" -m "./gfx/temp/the_end_en.map" -B 4 --color-zero 000000

echo - en/controls_text.png
"./tools/conv/superfamiconv.exe" tiles -i "./gfx/en/controls_text.png" -p "./gfx/en/controls.pal" -d "./gfx/temp/controls_text.chr" -B 4 -W 16 -H 16
"./tools/conv/superfamiconv.exe" map -i "./gfx/en/controls_text.png" -p "./gfx/en/controls.pal" -t "./gfx/temp/controls_text.chr" -d "./gfx/temp/controls_text.map" -B 4 --palette-base-offset 2 --tile-base-offset 352
echo - en/logo.png
"./tools/conv/superfamiconv.exe" tiles -i "./gfx/en/logo.png" -p "./gfx/en/logo.pal" -d "./gfx/temp/logo.chr" -B 4
"./tools/conv/superfamiconv.exe" map -i "./gfx/en/logo.png" -p "./gfx/en/logo.pal" -t "./gfx/temp/logo.chr" -d "./gfx/temp/logo.map" -B 4 --palette-base-offset 7 --tile-base-offset 384

echo - en/credits1.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/credits1.png" -p "./gfx/temp/credits1.pal" -t "./gfx/temp/credits1.chr" -m "./gfx/temp/credits1.map" -B 2 -N 4 -W 16 -H 16
echo - en/credits2_ep1_1.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/credits2_ep1_1.png" -p "./gfx/temp/credits2_ep1_1.pal" -t "./gfx/temp/credits2_ep1_1.chr" -m "./gfx/temp/credits2_ep1_1.map" -B 4 -N 1 -H 16 -W 16 --palette-base-offset 1 --color-zero 000000
echo - en/credits2_ep1_2.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/credits2_ep1_2.png" -p "./gfx/temp/credits2_ep1_2.pal" -t "./gfx/temp/credits2_ep1_2.chr" -m "./gfx/temp/credits2_ep1_2.map" -B 2 -N 4 -H 16 -W 16 --palette-base-offset 0 --color-zero 000000
echo - en/createdby.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/createdby.png" -p "./gfx/temp/createdby.pal" -t "./gfx/temp/createdby.chr" -m "./gfx/temp/createdby.map" -B 4 -N 1 --color-zero 000000

echo - en/resultsrecord.png
"./tools/conv/superfamiconv.exe" convert -i "./gfx/en/resultsrecord.png" -p "./gfx/temp/resultsrecord.pal" -t "./gfx/temp/resultsrecord.chr" -m "./gfx/temp/resultsrecord.map" -B 2 -N 2 -W 16 -H 16
echo -- Build ROM...
"./tools/bass/bass" ./build/build_en_combo.asm
echo Done.
pause