//Hacks in relation to SRAM Repoint
//We'll just do a straight repoint of BS-X SRAM from $10-17:5000-5FFF to $70:0000-7FFF

inline replaceSRAMAddr() {
	dl $700000+((read(origin()+2)&$0F)*$1000)+((read(origin()+1)-$50)*$100)+(read(origin()+0))
}

enqueue pc
seekAddr($86BEC0+1); replaceSRAMAddr() //$115404	//Related to Hours ($7FFFF9)

seekAddr($809C05+1); replaceSRAMAddr() //$1154FC
seekAddr($809C15+1); replaceSRAMAddr() //$115400
seekAddr($809C28+1); replaceSRAMAddr() //$115401
seekAddr($809C49+1); replaceSRAMAddr() //$115400
seekAddr($809C54+1); replaceSRAMAddr() //$1154FC
seekAddr($809C58+1); replaceSRAMAddr() //$11544C
seekAddr($809C5E+1); replaceSRAMAddr() //$115400
seekAddr($809C68+1); replaceSRAMAddr() //$115402
seekAddr($809C79+1); replaceSRAMAddr() //$115404
seekAddr($809CA1+1); replaceSRAMAddr() //$11541C
seekAddr($809CBB+1); replaceSRAMAddr() //$115400
seekAddr($809CC3+1); replaceSRAMAddr() //$115402
seekAddr($809CCE+1); replaceSRAMAddr() //$115404
seekAddr($809CDB+1); replaceSRAMAddr() //$115406

seekAddr($809F7A+1); replaceSRAMAddr() //$115406
seekAddr($809F85+1); replaceSRAMAddr() //$115400
seekAddr($809F89+1); replaceSRAMAddr() //$145400
seekAddr($809F94+1); replaceSRAMAddr() //$105004
seekAddr($809F99+1); replaceSRAMAddr() //$105002
seekAddr($809FA2+1); replaceSRAMAddr() //$105000
seekAddr($809FAB+1); replaceSRAMAddr() //$115000
seekAddr($809FB4+1); replaceSRAMAddr() //$125000
seekAddr($809FC9+1); replaceSRAMAddr() //$105004
seekAddr($809FCD+1); replaceSRAMAddr() //$135004
seekAddr($809FD4+1); replaceSRAMAddr() //$105002
seekAddr($809FD8+1); replaceSRAMAddr() //$135002

seekAddr($809DFF+1); replaceSRAMAddr() //$115404
seekAddr($809E11+1); replaceSRAMAddr() //$115400
seekAddr($809E19+1); replaceSRAMAddr() //$115402
seekAddr($809E24+1); replaceSRAMAddr() //$115404

seekAddr($80A534+1); replaceSRAMAddr() //$115406
seekAddr($80A566+1); replaceSRAMAddr() //$11540A
seekAddr($80A591+1); replaceSRAMAddr() //$115408
seekAddr($80A5C3+1); replaceSRAMAddr() //$11540C

seekAddr($80A66C+1); replaceSRAMAddr() //$10501E
seekAddr($80A673+1); replaceSRAMAddr() //$10501E
seekAddr($80A677+1); replaceSRAMAddr() //$105020
seekAddr($80A67D+1); replaceSRAMAddr() //$105020
seekAddr($80A681+1); replaceSRAMAddr() //$105022
seekAddr($80A688+1); replaceSRAMAddr() //$105022
seekAddr($80A693+1); replaceSRAMAddr() //$115020
seekAddr($80A69E+1); replaceSRAMAddr() //$11501E
seekAddr($80A6AA+1); replaceSRAMAddr() //$11501E
seekAddr($80A6B1+1); replaceSRAMAddr() //$115020
seekAddr($80A6B8+1); replaceSRAMAddr() //$115022
seekAddr($80A6C2+1); replaceSRAMAddr() //$115406
seekAddr($80A6C7+1); replaceSRAMAddr() //$115408
seekAddr($80A6CB+1); replaceSRAMAddr() //$11540C
seekAddr($80A6CF+1); replaceSRAMAddr() //$11540E
seekAddr($80A6DB+1); replaceSRAMAddr() //$11542A

seekAddr($80A6E8+1); replaceSRAMAddr() //$115410
seekAddr($80A6ED+1); replaceSRAMAddr() //$115412
seekAddr($80A6F1+1); replaceSRAMAddr() //$115414
seekAddr($80A6F8+1); replaceSRAMAddr() //$11541C
seekAddr($80A6FF+1); replaceSRAMAddr() //$11541E
seekAddr($80A706+1); replaceSRAMAddr() //$115420
seekAddr($80A70F+1); replaceSRAMAddr() //$115422
seekAddr($80A70F+1); replaceSRAMAddr() //$115422

seekAddr($80A71A+1); replaceSRAMAddr() //$115440
seekAddr($80A71F+1); replaceSRAMAddr() //$115442
seekAddr($80A723+1); replaceSRAMAddr() //$115444
seekAddr($80A72A+1); replaceSRAMAddr() //$115446

//Score Tally
seekAddr($80ABF7+1); replaceSRAMAddr() //$11542A	//Gold Mario Statues
seekAddr($80AE23+1); replaceSRAMAddr() //$115410	//Mushrooms
seekAddr($80AE9C+1); replaceSRAMAddr() //$115416	//Coins
seekAddr($80AF3B+1); replaceSRAMAddr() //$115440	//Cherries
seekAddr($80AFB2+1); replaceSRAMAddr() //$115406	//Bosses
seekAddr($80B046+1); replaceSRAMAddr() //$11541C	//Extra Lives
seekAddr($80B096+1); replaceSRAMAddr() //$115464	//?
seekAddr($80B0A3+1); replaceSRAMAddr() //$11546C	//?
seekAddr($80B0AD+1); replaceSRAMAddr() //$115420	//?
seekAddr($80B0B1+1); replaceSRAMAddr() //$115468	//?

seekAddr($80B45F+1); replaceSRAMAddr() //$115422
seekAddr($80B463+1); replaceSRAMAddr() //$115424
seekAddr($80B467+1); replaceSRAMAddr() //$115426
seekAddr($80B46B+1); replaceSRAMAddr() //$115428

seekAddr($80B6B1+1); replaceSRAMAddr() //$11546C
seekAddr($80B6C5+1); replaceSRAMAddr() //$115464
seekAddr($80B6D0+1); replaceSRAMAddr() //$115468

seekAddr($809F1D+1); replaceSRAMAddr() //$11540E
seekAddr($809F24+1); replaceSRAMAddr() //$115420
seekAddr($809F29+1); replaceSRAMAddr() //$115422
seekAddr($809F2D+1); replaceSRAMAddr() //$115424
seekAddr($809F31+1); replaceSRAMAddr() //$115426
seekAddr($809F35+1); replaceSRAMAddr() //$115428
seekAddr($809F51+1); replaceSRAMAddr() //$115464
seekAddr($809F68+1); replaceSRAMAddr() //$115400

dequeue pc
