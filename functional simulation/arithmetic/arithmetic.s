.text
main:
	ori $8, $0, 2
	ori $9, $0, 5
	sub $8, $8, $9
	add $10, $8, $9
	addu $11, $8, $9
	sub $12, $8, $9
	subu $13, $8, $9
	addi $14, $8, 4
	mult $8, $9
	mfhi $16
	mflo $17
	multu $8, $9
	mfhi $18
	mflo $19
	div $8, $9
	mfhi $20
	mflo $21
	divu $8, $9
	mfhi $22
	mflo $23
	jr $31