//HiROM
macro seekAddr(n) {
	origin ({n} & $3FFFFF)
	base {n}
}

//Seek File Offset (HiROM Base)
macro seekFile(n) {
	origin {n}
	setHiROMBase()
}

//Convert Base from LoROM to HiROM area (FastROM)
macro setHiROMBase() {
	base ((origin() & $3FFFFF) | 0xC00000)
}
