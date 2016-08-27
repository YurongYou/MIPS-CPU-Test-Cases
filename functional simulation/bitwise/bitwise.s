.text
main:
	addi $2, $0, 0x00ff
	srl $3, $2, 1
	sll $4, $3, 25
	srl $5, $4, 1
	sra $6, $4, 1

	addi $7, $0, 1
	addi $8, $0, 25
	srlv $9, $2, $7
	sllv $10, $9, $8
	srlv $11, $10, $7
	srav $12, $10, $7