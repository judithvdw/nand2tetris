// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.



(MAINLOOP)
// get current state of the keyboard
@KBD 
D=M

// set up for white (kbd == 0)
@WHITELOOP
D;JEQ

// set up for black (kbd != 0)
@BLACKLOOP
D;JNE


(WHITELOOP)
@colour 
M = 0

@FILL
0;JMP

(BLACKLOOP)
@colour
M = -1

@FILL
0; JMP


(FILL)
// set the counter to the total number of pixels/16 to be filled
@8191 
D=A
@counter
M=D


(INSIDEFILL)
//  
@counter
D=M
@pixel
M=D

// screen location + current value of counter
@SCREEN
D=A
@pixel
M=M+D

// fill the pixel with either 0 or -1
@colour 
D=M
@pixel
A=M
M=D

// current value of counter -1 = new value of counter
@counter
D=M-1
M=D

// continue in the inside loop unless the counter == 0
@INSIDEFILL
D;JGE

// all the way back to the start
@MAINLOOP
0;JMP
