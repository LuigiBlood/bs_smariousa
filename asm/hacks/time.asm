
//How many frames is a minute (60 * 60 = 3600 frames)
//However a full frame is actually 60.09880627 Hz on real hardware, so that times 60 = 3606
enqueue pc
seekAddr($80F982)
	lda.w #3606
dequeue pc

//Change Hour and Minute (At Boot) (Original Code: 18:05)
enqueue pc
seekAddr($808023)
	jsl time_init
	nop; nop
	nop; nop
	nop; nop; nop; nop
dequeue pc
time_init:
	lda.b #0
	sta.l $7FFFF4	//Stop the clock by default
	lda.b #18
	sta.l $7FFFF9
	lda.b #2
	sta.l $7FFFFF
	rep #$20
	lda.w #60*3
	sta.l $7FFFFA
	sep #$20
	rtl


//Change Minute (Before Waiting Screen) (Original Code xx:06)
enqueue pc
seekAddr($809BF7)
	lda.b #3
	sta.l $7FFFFF
dequeue pc

//Add ability to pause/unpause the clock
enqueue pc
seekAddr($80F8D1)
	php
	sep #$20
	lda.l $7FFFF4
	beq +
	jml $80F969
+;	plp
	rtl
dequeue pc

//Unpause the clock when pressing Start in the Controls select
enqueue pc
seekAddr($80A25D)
	jsl hack_controls_startclock
	nop
dequeue pc
hack_controls_startclock:
	lda.b #$01
	sta.l $7FFFF4
	sta.w $1DE3
	rtl


//Retime Intro
enqueue pc
seekAddr($80A33C)
	dw 43*60,22*60,35*60,60*60
	dw 4,4,5,6
	//dw $0A8C,$0564,$08AC,$0E10	//dw 45*60,23*60,37*60,60*60
	//dw $0004,$0004,$0005,$0006
dequeue pc
