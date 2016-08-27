# MIPS CPU Test Cases
This repository is intended to serve as a shared collection of test cases for our CPU project. By now, the test cases are all functional simulations and will  be extended to timing simulation in near future.

## Instruction Set
The instruction set used in the test cases follows the standard MIPS32 integer instruction set (see [MIPS instruction set](https://en.wikipedia.org/wiki/MIPS_instruction_set)). And for now, I have not implement the coprocessor `CP0`, thus the two instructions

```
mfcZ $t, $d
mtcZ $t, $d
```
are not included in the test cases. A brief summary on the type, opcode, syntax of the instructions, see [here](https://github.com/YurongYou/MIPS-CPU-Test-Cases/blob/master/Instructions.pdf).

## Functional Simulation
The test cases are all running on my classical five-stage MIPS pipeline implementation, compiled by [iverilog](http://iverilog.icarus.com), and the waveforms are captured on [Scansion](http://www.logicpoet.com/scansion/).

All test cases contain 3 files

1. instruction data (`.data`)
2. MIPS source code (`.s`)
3. waveform simulation screenshot (`.png`)

You can check it out by yourself by modifying the [SOPC.v](https://github.com/YurongYou/MIPS-CPU-Test-Cases/blob/master/SOPC.v) file.

The virtual rom and memory have been implemented as shown in the folder.

For now, each test case majorly covers a part of the MIPS ISA as listed in the [here](https://github.com/YurongYou/MIPS-CPU-Test-Cases/blob/master/Instructions.pdf), but with some overlap. For insufficient time to construct the test cases, for now the forwarding, hazard detection and branch control are **all required** for generating the correct waveform for the test cases. Maybe in the future, test cases with better decoupling will be presented here.

## Contribution
Pointing out bugs, modification, contributing new test cases are all welcome! Pull it!


