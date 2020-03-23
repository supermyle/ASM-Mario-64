.org 0x861C0 ;Start at this point
ADDIU SP, SP, 0xFFE8 ;TAKE 24 off stack, START SUBROUTINE
SW RA, 0x14(SP) ;STORE WORD (return address RA) to Stack + 20 bytes SUBROUTINE

ORI A0, R0, #80 ;X value = 80
ORI A1, R0, #140 ;Y value = 140
LUI A2, 0x802C ;RAM Pointer to ASCII Text
JAL 0x802D66C0 ;Jump and Link
ORI A2, A2, 0xB244 ;Pointer = 0x802CB244 executed BEFORE JAL due to Delay Slot

Exit:
LW RA, 0x14(SP) ;Load word RA at 20
JR RA ;Jump Register (Return Address)
ADDIU SP, SP, 0x18 ;ADD 24 back to stack

;RAM addresses = 0x86244 + 0x80245000 = 0x802CB244
.org 0x86244
.asciiz "Hi Supermyle"