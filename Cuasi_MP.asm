;Beaverly Cuasi S15

%include "io.inc"
section .data

rA db 2
cA db 3
matrixA db -1,-2,-3
        db -4,-5,-6
        
rB db 3
cB db 2
matrixB db 7,8
        db 9,10
        db 11,12
        
row db 0
col db 0
i   db 0
temp dw 0

section .text
global CMAIN
CMAIN:
    ;write your code here
    
LOOP3: ;for (int i = 0; i < cA; i++)

    ;matrixA
    MOV AL, [row] 
    IMUL byte [cA] ;row * cA
    MOV BL, [i] 
    MOVSX BX, BL ;SIGN EXTENSION
    ADD AX, BX ;row * cA + i
    
    MOVSX EAX, AX  ;SIGN PARA MALAGAY SA 32 BYTES 
    MOV CL, byte [matrixA + EAX] 
   
    ;matrixB
    MOV AL, [i] ; RECYCLE AL
    IMUL byte [cB] ;cB * i 
    MOV BH, [col]
    MOVSX SI, BH 
    ADD AX, SI ;cB * i + col
    MOVSX EBX, AX 
    MOV BL, byte [matrixB + EBX] 
    MOVSX CX, CL
    MOVSX DX, BL
    IMUL CX,DX
    ADD [temp], CX ;ANSWER
    INC byte [i]
    MOV CH,[i] 
    CMP CH, [cA]
    JE LOOP2
    JMP LOOP3
    
LOOP2: ;for (int col = 0; col < cB; col++)
     
    PRINT_DEC 2, temp ;ANSWER
    PRINT_CHAR " "
    MOV dword [temp],0 ; CAUTION PARA MAS MALAKI MALAGAY ;RESET
    MOV byte [i],0 ; RESET
    INC byte [col]
    MOV BH, [col] 
    CMP BH, [cB]
    JE LOOP1
    JMP LOOP3
    
LOOP1: ;for (int row = 0; row < rA; row++)
    NEWLINE
    MOV byte [i],0 ;RESET
    MOV byte [col],0 ;RESET
    INC byte [row]
    MOV DH, [row]
    CMP DH, [rA]
    JNE LOOP3
    JMP END
    
END:
    NOP    

;reference: matrix multiplication c program javatpoint 
    
    xor eax, eax
    ret