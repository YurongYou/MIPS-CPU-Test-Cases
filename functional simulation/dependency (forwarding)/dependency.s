.text
main:
	# ALU followed by ALU
	lui $2, 0xffff
	ori $2, $2, 0xffff
	add $3, $0, $2
	mult $3, $2
	# ALU followed by hi/lo
	mfhi $4
	# hi/lo followed by ALU
	mult $4, $2
	mflo $5
	# hi/lo followed by store
	sw $5, 0($0)
	lw $6, 0($0)
	# load followed by store
	sw $6, 4($0)
	lw $7, 4($0)
	# load followed by ALU, hazard in five-stage pipeline!!! stall 1 stage.
	addi $8, $7, 1