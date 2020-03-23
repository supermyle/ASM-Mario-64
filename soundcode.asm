.org 0x861C0 ;Start at this point
ADDIU SP, SP, 0xFFE8 ;ADD IMMEDIATE UNSIGNED (Subtract 24 from the stack)
SW RA, 0x14(SP) ;STORE WORD (return address in RA) to Stack + 20 bytes

LUI A0, 0x240C ;Load argument First 4 digits (LOAD UPPER IMMEDIATE)240C into reg A0
ORI A0, A0, 0x0001 ;OR IMMEDIATE loads behind first 4 digits and makes reg A0 = 240C0001
JAL 0x802CA190 ;Jump and Link takes argument from subroutine A0
NOP ;NO OPERATION

LW RA, 0x14(SP) ;LOAD WORD RA (Opposite of SW)
JR RA ;JUMP BACK TO RETURN ADDRESS
ADDIU SP, SP, 0x18 ;ADD 24 back to stack