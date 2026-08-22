//init all SNES registers
initsnes:
	pha
	php					// save all registers and status flag

	sep #$20			// A = 8-bit mode
	lda.b #$8F			// screen off, full brightness (while initializing)
	sta.w INIDISP		// store to screen register
	stz.w OBSEL			// sprite register (size + address in VRAM)
	stz.w OAMADDL		// sprite registers (address of sprite memory [OAM])
	stz.w OAMADDH		// "
	stz.w BGMODE		// set graphics Mode 0
	stz.w MOSAIC		// no planes, no mosiac
	stz.w BG1SC			// plane 0 map VRAM location ($0000 vram)
	stz.w BG2SC			// plane 1 map VRAM location
	stz.w BG3SC			// plane 2 "
	stz.w BG4SC			// plane 3 "
	stz.w BG12NBA		// plane 0+1 tile data location
	stz.w BG34NBA		// plane 0+2 "
	stz.w BG1HOFS		// plane 0 scroll x (first 8 bits)
	stz.w BG1HOFS		// plane 0 scroll x (last 3 bits) write to reg twice
	stz.w BG1VOFS		// plane 0 scroll y "
	stz.w BG1VOFS		// plane 0 scroll y "
	stz.w BG2HOFS		// plane 1 scroll x (first 8 bits)
	stz.w BG2HOFS		// plane 1 scroll x (last 3 bits) write to reg twice
	stz.w BG2VOFS		// plane 1 scroll y "
	stz.w BG2VOFS		// plane 1 scroll y "
	stz.w BG3HOFS		// plane 2 scroll x (first 8 bits)
	stz.w BG3HOFS		// plane 2 scroll x (last 3 bits) write to reg twice
	stz.w BG3VOFS		// plane 2 scroll y "
	stz.w BG3VOFS		// plane 2 scroll y "
	stz.w BG4HOFS		// plane 3 scroll x (first 8 bits)
	stz.w BG4HOFS		// plane 3 scroll x (last 3 bits) write to reg twice
	stz.w BG4VOFS		// plane 3 scroll y "
	stz.w BG4VOFS		// plane 3 scroll y "
	lda.b #$80			// increase VRAM after writes to $2118.19
	sta.w VMAIN			// store to VRAM increment register
	stz.w VMADDL		// VRAM address low
	stz.w VMADDH		// VRAM address hi
	stz.w M7SEL			// init mode 7 setting reg
	stz.w M7A			// Mode 7 matrix parameter A register (low)
	lda.b #$01
	sta.w M7A			// Mode 7 matrix parameter A register (high)
	stz.w M7B			// Mode 7 matrix parameter B register (low)
	stz.w M7B			// Mode 7 matrix parameter B register (high)
	stz.w M7C			// Mode 7 matrix parameter C register (low)
	stz.w M7C			// Mode 7 matrix parameter C register (high)
	stz.w M7D			// Mode 7 matrix parameter D register (low)
	lda.b #$01
	sta.w M7D			// Mode 7 matrix parameter D register (high)
	stz.w M7X			// Mode 7 center position X register (low)
	stz.w M7X			// Mode 7 center position X register (high)
	stz.w M7Y			// Mode 7 center position Y register (low)
	stz.w M7Y			// Mode 7 center position Y register (high)
	stz.w CGADD			// Color number register ($0-ff)
	stz.w W12SEL		// BG1 & BG2 Window mask setting register
	stz.w W34SEL		// BG3 & BG4 Window mask setting register
	stz.w WOBJSEL		// OBJ & Color Window mask setting register
	stz.w WH0			// Window 1 left position register
	stz.w WH1			// Window 2 left position register
	stz.w WH2			// Window 3 left position register
	stz.w WH3			// Window 4 left position register
	stz.w WBGLOG		// BG1, BG2, BG3, BG4 Window Logic register
	stz.w WOBJLOG		// OBJ, Color Window Logic Register (or,and,xor,xnor)
	lda.b #$01
	sta.w TM			// Main Screen designation (planes, sprites enable)
	stz.w TS			// Sub Screen designation
	stz.w TMW			// Window mask for Main Screen
	stz.w TSW			// Window mask for Sub Screen
	lda.b #$30
	sta.w CGWSEL		// Color addition & screen addition init setting
	stz.w CGADSUB		// Add/Sub sub designation for screen, sprite, color
	lda.b #$E0
	sta.w COLDATA		// color data for addition/subtraction
	stz.w SETINI		// Screen setting (interlace x,y/enable SFX�data)
	stz.w NMITIMEN		// Enable V-blank, interrupt, Joypad register
	lda.b #$FF
	sta.w WRIO			// Programmable I/O port
	stz.w WRMPYA		// Multiplicand A
	stz.w WRMPYB		// Multiplier B
	stz.w WRDIVL		// Multiplier C
	stz.w WRDIVH		// Multiplicand C
	stz.w WRDIVB		// Divisor B
	stz.w HTIMEL		// Horizontal Count Timer
	stz.w HTIMEH		// Horizontal Count Timer MSB (most significant bit)
	stz.w VTIMEL		// Vertical Count Timer
	stz.w VTIMEH		// Vertical Count Timer MSB
	stz.w MDMAEN		// General DMA enable (bits 0-7)
	stz.w HDMAEN		// Horizontal DMA (HDMA) enable (bits 0-7)
	lda.b #$01
	sta.w MEMSEL		// Access cycle designation (slow/fast rom)

	plp					// restore processor status (8 or 16 bit mode)
	pla					// restore all registers
	rts
