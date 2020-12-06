%include "io.inc"

section .data

rA db 2
cA db 3
matrixA db 0,1,3
        db 5,7,8
        
rB db 3
cB db 2
matrixB db 0,127
        db 1,100
        db 0,10
        
row db 0
col db 0

section .text
global CMAIN
CMAIN:
    ;write your code here
    
LOOP3:

    ;matrixA
    MOV EAX, [row]
    
    i = 0
    row * cA + i
    
    MOV AL, byte [matrixA + EAX]
    PRINT_DEC 1, AL
    
    NEWLINE
    
    ;matrixB
    MOV EBX, i
    
    cB * i + col ; col will implement if LOOP3 is done | L3 limit = cA
    
    MOV BL, byte [matrixB + EBX]
    PRINT_DEC 1, BL
    INC i
    CMP i, cA
    JE LOOP2
    JMP LOOP3
    
    NEWLINE
    
    ;PRINT
    IMUL BL
    ;ADD TEMP, AX
    PRINT_DEC 1, AX
    JMP END
    
LOOP2:
    i = 0
    ;TEMP ACCUMULATE OF WHAT YOU MULTIPLIED    
    INC col
    CMP col, cB
    JE LOOP1
    JMP LOOP3
    ;PRINT
    
LOOP1:
    col = 0
    INC row
    CMP rA, row
    JNE L3
    
END:
    NOP    
    
    
    xor eax, eax
    ret