DATA SEGMENT USE16
    USER       DB 'admin',0
    PASSWD     DB '123456',0
    IN_BUF     DB 30
               DB 30 DUP(?)
    WEL        DB 'WELCOME ADMIN!$'
    PRO_USER   DB 'PLEASE ENTER USERNAME:$'
    PRO_PASSWD DB 'PLEASE ENTER PASSWORD:$'
    ERROR      DB 'INVALID$'
DATA ENDS

CODE SEGMENT USE16
                 ASSUME CS:CODE,DS:DATA,ES:DATA
    BEG:         MOV    AX,DATA
                 MOV    DS,AX
                 MOV    AH,9
                 MOV    DX,OFFSET PRO_USER
                 INT    21H
                 MOV    AH,0AH
                 MOV    DX,OFFSET IN_BUF
                 INT    21H
                 MOV    SI,OFFSET IN_BUF+2
                 MOV    DI,OFFSET USER
    CK_USER:     MOV    AL,[SI]
                 CMP    AL,[DI]
                 JNE    WRONG
                 INC    SI
                 INC    DI
                 MOV    AL,[DI]
                 CMP    AL,0
                 JNZ    CK_USER
                 MOV    AH,2
                 MOV    DL,0AH
                 INT    21H
                 MOV    AH,9H
                 MOV    DX,OFFSET PRO_PASSWD
                 INT    21H
                 MOV    BX,OFFSET IN_BUF+1
    ENTER_PASSWD:MOV    AH,7
                 INT    21h
                 ADD    BX,1
                 MOV    [BX],AL
                 CMP    AL,13
                 JNE    ENTER_PASSWD
                 MOV    SI,OFFSET IN_BUF+2
                 MOV    DI,OFFSET PASSWD
    CK_PASSWD:   MOV    AL,[SI]
                 CMP    AL,[DI]
                 JNE    WRONG
                 INC    SI
                 INC    DI
                 MOV    AL,[DI]
                 CMP    AL,0
                 JNZ    CK_PASSWD
                 MOV    AH,2
                 MOV    DL,0AH
                 INT    21H
                 MOV    AH,9H
                 MOV    DX,OFFSET WEL
                 INT    21H
                 JMP    EXIT
    WRONG:       MOV    AH,2
                 MOV    DL,0AH
                 INT    21H
                 MOV    DX,OFFSET ERROR
                 MOV    AH,9H
                 INT    21H
    EXIT:        MOV    AH,4CH
                 INT    21H
CODE ENDS
          END BEG
