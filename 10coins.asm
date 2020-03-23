.org 0x861C0 ;Start at this point
ADDIU SP, SP, 0xFFE8 ;TAKE 24 off stack
SW RA, 0x14(SP) ;STORE WORD (return address RA) to Stack + 20 bytes

LUI T1, 0x8034 ;T1 = 80340000
LH T3, 0xB218(T1) ;Load Mario's Current Coins to T3
ORI T4, R0, #10 ;Write decimal 10 to reg T4

BEQ T3, T4, LifeIncrease ;If Mario's Coins (T3) equals 10 (T4)
NOP ;Put NOP statements to eat up Delays
BNE T3, T4, Exit ;If Mario's Coins != 10
NOP

LifeIncrease: ;Label for branching
LB T2, 0xB21D(T1)
ADDI T2, T2, #1 ;Add 1 to reg T2
SB T2, 0xB21D(T1) ;Add 1 to Mario's Lives

SUBIU T3, T3, #10
SH T3, 0xB218(T1) ;Subtract 10 to make coins reset

Exit: ;Label for branching
LW RA, 0x14(SP) ;Load word RA at 20
JR RA 
ADDIU SP, SP, 0x18 ;ADD 24 back to stack

.org 0x9E7E0 ;Switch to this address
LH A3, 0xB218(A3) ;Load Display Coin Counter