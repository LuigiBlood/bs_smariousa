//Enforce Satellaview to be considered not present
enqueue pc
seekAddr($809ED0)
	php
	sep #$20
	lda.b #1
	sta $7FFFE1
	plp
	rtl
dequeue pc

//Remove use of Satellaview hardware
enqueue pc
seekAddr($808051)
	nop;nop;nop
	nop;nop
	nop;nop;nop

seekAddr($809BE4)
	nop;nop;nop
	nop;nop;nop;nop
	nop;nop
dequeue pc
