%include "io.inc"

section .data

rA db 2
cA db 3
matrixA db 2,3,4
        db 1,0,0
        
rB db 3
cB db 2
matrixB db 0,127
        db 1,100
        db 0,10
        
row db 0
col db 0
i   db 0
temp dw 0

section .text
global CMAIN
CMAIN:
    ;write your code here
    
LOOP3:

    ;matrixA
    MOV AL, [row] ;0
    IMUL byte [cA] ; 0
    MOV DL, [i] ;PALIT ;0
    MOVSX DX, DL ;SIGN EXTENSION ;P
    ADD AX, DX ;0
    
    MOVSX EAX, AX  ;SIGN PARA MALAGAY SA 
    MOV CL, byte [matrixA + EAX] ;0
   
    ;matrixB
    MOV AL, [i] ; RECYCLE ;P
    IMUL byte [cB]
    MOV DH, [col]
    MOVSX SI, DH ;P
    ADD AX, SI
    MOVSX EBX, AX 
    MOV DL, byte [matrixB + EBX] ;P
    MOVSX CX, CL
    MOVSX DX, DL
    IMUL CX,DX
    ADD [temp], CX
    INC byte [i]
    MOV DH,[i] ;P
    CMP DH, [cA]
    JE LOOP2
    JMP LOOP3
    
LOOP2:
     NEWLINE
     PRINT_DEC 2, temp 
     PRINT_CHAR " "
     MOV dword [temp],0 ; CAUTION NA MAS MALAKI
     MOV byte [i],0
    INC byte [col]
    MOV DH, [col] ;P
    CMP DH, [cB]
    JE LOOP1
    JMP LOOP3
    
LOOP1:
    MOV byte [i],0
    MOV byte [col],0
    INC byte [row]
    MOV CH, [row]
    CMP CH, [rA]
    JNE LOOP3
    JMP END
    
END:
    NOP    
    
    
    xor eax, eax
    ret