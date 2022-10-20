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
(RESTART)
@SCREEN
D=A
@0
M=D	//starto pradzia RAM0

///////////////////////////
(KBDCHECK)

@KBD
D=M
@BLACK
D;JGT	//sok jei mygtukas nuspaustas
@WHITE
D;JEQ	//else sok i balta ekrana

@KBDCHECK
0;JMP
///////////////////////////
(BLACK)
@1
M=-1	//pripildyti ekrana su: (-1=11111111111111)
@CHANGE
0;JMP

(WHITE)
@1
M=0	//pripildyti ekrana
@CHANGE
0;JMP
//////////////////////////
(CHANGE)
@1	//tikrinti kuo pripildyti ekrana
D=M	//d yra baltas arba juodas

@0
A=M	//ekrano addres nurodo pildyti ekrana
M=D	//pripildyti

@0
D=M+1	//eiti i kita pixeli
@KBD
D=A-D	//KBD-SCREEN=A

@0
M=M+1	//eiti i kita pixeli
A=M

@CHANGE
D;JGT	//jei A=0 baigia, jei ekranas juodas
/////////////////////////
@RESTART
0;JMP