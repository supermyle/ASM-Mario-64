.org 0x861C0 ;Start at this point
ADDIU SP, SP, 0xFFE8 ;TAKE 24 off stack
SW RA, 0x14(SP) ;STORE WORD (return address RA) to Stack + 20 bytes

LUI T0, 0x8034 ;T0 = 80340000
LH T1, 0xB218(T0) ;T1 = Current Coins

BEQ T1, T2, Increase ;If reg T1 (Mario's Coins) == reg T2 (30)
ORI T2, R0, #30 ;Store Decimal 30 in T2

BNE T1, T2, Exit ;If reg T1 (Mario's Coins) != 30
NOP

Increase:
LB T3, 0xB21D(T0) ;T3 equals Mario's Lives
ADDIU T3, T3, #1 ;Add 1 to Mario's Lives
SB T3, 0xB21D(T0) ;Mario's Lives = T3

SUBI T1, T1, #1 ;T1 = T1 - 1 (Remove from Coins Register)
SH T1, 0xB218(T0) ;Current Coins equals T1

;for(byte i = T3; i < 30; i++)
BLT T3, T2, Increase
NOP

Exit: ;Label for branching
LW RA, 0x14(SP) ;Load word RA at 20
JR RA
ADDIU SP, SP, 0x18 ;ADD 24 back to stack

.org 0x9E7E0 ;Switch to this address
LH A3, 0xB218(A3) ;Load Display Coin Counter