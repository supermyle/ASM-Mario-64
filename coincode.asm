.org 0x861C0 ;Start at this point
ADDIU SP, SP, 0xFFE8 ;TAKE 24 off stack
SW RA, 0x14(SP) ;STORE WORD (return address RA) to Stack + 20 bytes

LUI T1, 0x8034 ;T1 = 80340000
ORI T2, R0, #10 ;10 coins in T2
ORI T3, R0, #3 ;3 Coins in T2
DIV T2, T3 ;Divide T2*T3 (10/3 = 3)
MFHI T2 ;Move From LO SFR to reg T2
SH T2, 0xB262(T1) ;Store half word reg T2 in T1 0x8034B262

LW RA, 0x14(SP) ;Load word RA at 20
JR RA 
ADDIU SP, SP, 0x18 ;ADD 24 back to stack