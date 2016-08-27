.text
main:
	ori	$2, $0, 0xffff
	ori	$3, $0, 0xffbf
	and	$4, $2, $3
	andi $5, $2, 0xffbf
	or $6, $2, $3
	xor $7, $2, $3
	nor $8, $2, $3
	lui $2, 0xffff
	ori	$2, $2, 65533
	lui $3, 0xffff
	ori	$3, $3, 65534
	slt $9, $2, $3
	sltu $10, $2, $3
	slti $11, $2, 0