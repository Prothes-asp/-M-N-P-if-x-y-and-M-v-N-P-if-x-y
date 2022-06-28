.MODEL SMALL
.STACK 100H
.DATA
M DB 4
N DB 2
P DB 3
X DB ?
Y DB ?
MSG1 DB "ENTER X: $"
MSG2 DB 10, 13, "ENTER Y: $"
MSG3 DB 10, 13, "(M-N)P = $"
MSG4 DB 10, 13, "M/N + P = $"
MSG5 DB 10, 13, "CONSIDERING M=4, N=2 AND P=3$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    ;GETTING X
    MOV AH, 9
    LEA DX, MSG1
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    SUB AL, 48
    MOV X, AL
   
    
    ;GETTING Y
    MOV AH, 9
    LEA DX, MSG2
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    SUB AL, 48
    
    ;IF ELSE
    CMP AL, X
    
    JG JUMP1
    JLE JUMP2  
             
    JUMP1:  ;X<=Y
     MOV AH, 9
    LEA DX, MSG3
    INT 21H
    
    MOV AL, M   ;AL = M
    SUB AL, N   ; AL = AL - N
    MOV BL, P   ;BL = P
    
    MUL BL   ;AX = AL * BL 
    
    ADD AX, 48
    MOV DX, AX
    
    MOV AH, 2
    INT 21H
    
    JMP END
    
    JUMP2:  ;X>Y
    MOV AH, 9
    LEA DX, MSG4
    INT 21H 
    
    MOV AX, 4  ; M = 4
    MOV BL, N
    DIV BL  ; AX = AX / BL 
    
    ADD AX, 3   ; P = 3
    ADD AX, 48
    
    MOV DX, AX
    MOV AH, 2
    INT 21H
    
    
    JMP END1:
    
    END:
    END1:         
    
    MAIN ENDP
END MAIN
    
    
    
    