.org 0x861C0 ;Start at this point
ADDIU SP, SP, 0xFFE8 ;TAKE 24 off stack
SW RA, 0x14(SP) ;STORE WORD (return address RA) to Stack + 20 bytes

LUI T1, 0x8034 ;T1 = 80340000
LH T0, 0xAFA0(T1) ;Current Button - RAM Addres holds button Value
ANDI T2, T0, 0x4000 ;Button B

BNE R0, T2, ButtonCheck ;B Button Pressed?
NOP
BEQ R0, T2, Exit ;B Button not Pressed
NOP

ButtonCheck:
LH T3, 0xB218(T1) ;Load Mario's Current Coins to T3
ORI T4, R0, #10 ;Write decimal 10 to reg T4 see if Mario has 10 coins
BGE T3, T4, Increase ;If T3 > T4 then Increase
NOP
BLT T3, T4, Exit ;If T3 < T4 then Exit
NOP

Increase:
LB T4, 0xB21D(T1) ;reg T4 = Mario's Lives
ADDIU T4, T4, #1 ;Add 1 to Reg T4 (Mario's lives)
SB T4, 0xB21D(T1) ;Mario's Lives = T4

SUBIU T3, T3, #10 ;T3 = T3 - 10
SH T3, 0xB218(T1) ;Mario's Coins equals T3

Exit: ;Label for branching
LW RA, 0x14(SP) ;Load word RA at 20
JR RA
ADDIU SP, SP, 0x18 ;ADD 24 back to stack

.org 0x9E7E0 ;Switch to this address
LH A3, 0xB218(A3) ;Load Display Coin Counter