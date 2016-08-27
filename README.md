# MIPS CPU Test Cases
This repository is intended to serve as a shared collection of test cases for our CPU project. By now, the test cases are all functional simulations and will  be extended to timing simulation in near future.

## Instruction Set
The instruction set used in the test cases follows the standard MIPS32 integer instruction (see [MIPS instruction set](https://en.wikipedia.org/wiki/MIPS_instruction_set)). And for now, I have not implement the coprocessor CP0 so the two instructions

```
mfcZ $t, $d
mtcZ $t, $d
```
are not included in the test cases. A brief summary on the type, opcode, syntax of the instructions, see here.

## Functional Simulation


