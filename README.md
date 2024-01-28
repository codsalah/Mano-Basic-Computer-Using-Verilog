# Mano Basic Computer

## Overview

The Mano Basic Computer is a theoretical computer architecture described by M. Morris Mano. It includes a central processing unit (CPU), random access memory (RAM), and an input-output bus. This project was undertaken by a team of 5 students as part of our Microcontrollers Architecture Course.

# Modules

- **4bit_counter**: Module for a 4-bit counter.
- **256_RAM**: Module for a 256-byte Random Access Memory (RAM).
- **AC_adderNlogic**: Module for an Arithmetic and Logic Unit (ALU) adder and logic operations.
- **AC_CONTROL**: Module for controlling the Arithmetic and Logic Unit (ALU).
- **AC_REG**: Module for the Arithmetic and Logic Unit (ALU) register.
- **AR_Control**: Module for controlling the Address Register (AR).
- **BUS_Control**: Module for controlling the system bus.
- **BUS_Selection**: Module for selecting signals on the bus.
- **Control_Unit**: Module for the main control unit.
- **D_ff_reset**: Module for a D flip-flop with reset functionality.
- **D_flipflop**: Module for a D flip-flop.
- **decoder**: Module for a binary decoder.
- **Decoder3x8**: Module for a 3x8 binary decoder.
- **DR_Control**: Module for controlling the Data Register (DR).
- **DR_REG**: Module for the Data Register (DR).
- **Encoder8x3**: Module for an 8x3 binary encoder.
- **main**: Main module.
- **Main_tb_behav.wcfg**: Module for the testbench behavior configuration.
- **mano_basic_comp3**: Module for the Mano Basic Computer.
- **Memory_control**: Module for controlling memory operations.
- **MUX8x3**: Module for an 8x3 multiplexer.
- **PC_Control**: Module for controlling the Program Counter (PC).
- **PC_REG**: Module for the Program Counter (PC) register.
- **seq_counter**: Module for a sequential counter.
- **Sequence_counter**: Module for a sequence counter.
- **timing_signals**: Module for timing signals.

# Instruction Set

This implementation can execute all the instructions described by M. Morris Mano.

| Instruction | Hexadecimal Code | Description                                       |
|-------------|------------------|---------------------------------------------------|
| AND         | 0XXX 8XXX        | And memory word to AC                             |
| ADD         | 1XXX 9XXX        | Add memory word to AC                             |
| LDA         | 2XXX AXXX        | Load AC from memory                               |
| STA         | 3XXX BXXX        | Store content of AC into memory                   |
| BUN         | 3XXX CXXX        | Branch unconditionally                            |
| BSA         | 6XXX DXXX        | Branch and save return address                    |
| ISZ         | 7XXX EXXX        | Increment and skip if zero                         |
| CLA         | 7800             | Clear AC                                          |
| CLE         | 7400             | Clear E                                           |
| CMA         | 7200             | Complement AC                                     |
| CME         | 7100             | Complement E                                      |
| CIR         | 7080             | Circulate right AC and E                          |
| CIL         | 7040             | Circulate left AC and E                           |
| INC         | 7020             | Increment AC                                      |
| SPA         | 7010             | Skip next instruction if AC is positive           |
| SNA         | 7008             | Skip next instruction if AC is negative           |
| SZA         | 7004             | Skip next instruction if AC is zero               |
| SZE         | 7002             | Skip next instruction if E is zero                |
| HLT         | 7001             | Halt the computer                                 |
| INP         | F800             | Input character to AC                             |
| OUT         | F400             | Output character from AC                          |
| SKI         | F200             | Skip next instruction on Input Flag               |
| SKO         | F100             | Skip next instruction on Output Flag              |
| ION         | F080             | Interrupt on                                      |
| IOF         | F040             | Interrupt off                                     |

