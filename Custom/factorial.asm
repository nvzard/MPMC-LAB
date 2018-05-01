DATA SEGMENT
A DB 5
DATA ENDS
CODE SEGMENT
         ASSUME DS:DATA,CS:CODE
START:
      MOV AX,DATA
      MOV DS,AX
      MOV AH,00
      MOV AL,A
 L1:  DEC A
      MUL A
      MOV CL,A
      CMP CL,01
      JNZ L1
      MOV AH,4CH
      INT 21H 
CODE ENDS
END START



MOV CX, [0500] loads 0500 Memory location content to CX Register
MOV AX, 0001 loads AX register with 0001
MOV DX, 0000 loads DX register with 0000
MUL CX multiply AX with CX and store result in DX:AX pair
LOOP 040A runs loop till CX not equal to Zero
MOV [0600], AX store AX register content to memory location 0600
MOV [0601], DX store DX register content to memory location 0601
HLT stops the execution of program