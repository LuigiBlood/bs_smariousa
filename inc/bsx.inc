//IMPORTANT: Make sure BS-X BIOS ROM is mapped at $80-8F:8000-FFFF

//BS-X: Get LCI from Channel Map
//Arguments: 4 byte Software Channel ($7E13D3)
//Return: C flag set = Error, $7E13FE = LCI
macro bsx_GetLciFromMap(a,b,c,d) {
	rep #$20
	lda.w #((b << 8) + a)
	sta.l $7E13D3
	lda.w #((d << 8) + c)
	sta.l $7E13D3+2
	jsl $105C08
}

//BS-X: Find File Address in BS-X Directory
//Arguments: 4 byte Software Channel ($7E13E3)
//Return: C flag set = Error, $7E004E = File Address
macro bsx_GetFileAddrFromDir(a,b,c,d) {
	rep #$20
	lda.w #((b << 8) + a)
	sta.l $7E13E3
	lda.w #((d << 8) + c)
	sta.l $7E13E3+2
	jsl $105B30
}

//BS-X: Test if File Available
//Arguments: File Address ($7E004E)
//Return: C flag set = Error
macro bsx_TestFileAvailable() {
	jsl $105B34
}

//BS-X: Download File
//Arguments: File Address ($7E004E)
//Return: C flag set = Error?
macro bsx_DownloadFile() {
	jsl $105B38
}

//BS-X: Download Manager (use on NMI)
macro bsx_NmiDownload() {
	jsl $105B44
}

//BS-X: Reboot to BIOS (Long)
//Can be used regardless of BS-X MMIO setup
macro bsx_Reboot() {
	jml $105C3C
}
