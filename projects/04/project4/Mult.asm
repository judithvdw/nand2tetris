// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


// first set R2 to 0 
@R2 
M=0 

// get the value of R0 (could have also been R1)
@R0
D=M

// store the value of R0 in the times varable to track the amount of times we have added. 
@times
M=D

// start the actual loop part 
(FORLOOP)

// get the current value of times
@times 
D=M // 

// if times is equal 0 zero, go to the STOP part
@STOP
D;JEQ 

// get the value of R1
@R1
D=M

// add r1 to the current value of R2
@R2
M=M+D

// decrease the times variable with 1
@times
M=M-1

// go back to the start of the forloop
@FORLOOP
0;JMP

// end the script
(STOP)
@STOP
0;JMP
