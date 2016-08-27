.text
main:
	ori $8, $0, 5
	ori $9, $0, 2
	div $8, $9
	mfhi $20
	mflo $21
	divu $8, $9
	mfhi $22
	mflo $23
	jr $31