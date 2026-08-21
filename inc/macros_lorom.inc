//LoROM
macro seekAddr(n) {
	origin (({n} & $7F0000) >> 1) | ({n} & $7FFF)
	base {n}
}

//Seek File Offset (LoROM Base)
macro seekFile(n) {
	origin {n}
	setLoROMBase()
}

//Convert Base from HiROM to LoROM area (FastROM)
macro setLoROMBase() {
	base 0x800000 | (((origin() & $200000) << 2) | ((origin() & $1F8000) << 1) | $8000 | (origin() & $7FFF))
}
