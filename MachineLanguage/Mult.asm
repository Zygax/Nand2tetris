// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// Pradeda R2 at 0.
@R2
M=0

// Soka i pirma laipteli jei R0 > 0.
@R0
D=M
@STEP
D;JGT

// Jei nesoka eina i END.
@END
0;JMP

// Prrideda R1 prie R2 ir atima 1 is R0.
// Jei R0 yra daugiau 0 dar karta.
(STEP)
    // Get R2.
    @R2
    D=M

    // Prideda R1.
    @R1
    D=D+M

    // Iraso rezulta i R2.
    @R2
    M=D

    // is R0 atima 1.
    @R0
    D=M-1
    M=D

    // Jei R0 vis dar > 0 daro loop.
    @STEP
    D;JGT

(END)
    @END
    0;JMP

