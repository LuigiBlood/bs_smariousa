
//How many frames is a minute (60 * 60 = 3600 frames)
//However it doesn't necessarily take into account the slight 
enqueue pc
seekAddr($80F982)
	lda.w #3600
dequeue pc

//Change Hour and Minute (At Boot) (Original Code: 18:05)
enqueue pc
seekAddr($808023)
	lda.b #18
	sta.l $7FFFF9
	lda.b #2
	sta.l $7FFFFF
dequeue pc

//Change Minute (Before Waiting Screen) (Original Code xx:06)
enqueue pc
seekAddr($809BF7)
	lda.b #3
	sta.l $7FFFFF
dequeue pc