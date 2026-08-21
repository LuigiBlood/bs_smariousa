variable wram_alloc = $7E0000

inline skipWRAM(variable size) {
	if (wram_alloc >= $800000) {
		error "WRAM Allocation Overflow"
	}
	wram_alloc = wram_alloc + size
}

inline allocateWRAM(define name, variable nsize) {
	constant {name} = wram_alloc
	namespace {name} {
		constant size = nsize
	}
	skipWRAM(nsize)
}

inline allocate(define name, variable address, variable nsize) {
	constant {name} = address
	namespace {name} {
		constant size = nsize
	}
}

allocateWRAM(ram_args, 0x10)
