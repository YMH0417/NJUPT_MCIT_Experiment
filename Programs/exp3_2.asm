.model small  
.486  
CODE SEGMENT USE16
             ASSUME CS:CODE
    BEG:     JMP    START

    CNTPORT0 EQU    210H
    CNTPORT1 EQU    211H
    CNTPORT2 EQU    212H
    CTRPORT  EQU    213H

    CNTCMD0  EQU    00110110B
    CNTCMD1  EQU    01110110B
    CNTCMD2  EQU    10110110B

    CNTINIT0 EQU    10000
    CNTINIT1 EQU    2000
    CNTINIT2 EQU    1

    START:   NOP

             MOV    DX, CTRPORT
             MOV    AL, CNTCMD0
             OUT    DX, AL

             MOV    DX, CNTPORT0
             MOV    AX, CNTINIT0
             OUT    DX, AL
             MOV    AL, AH
             OUT    DX, AL

             MOV    DX, CTRPORT
             MOV    AL, CNTCMD1
             OUT    DX, AL

             MOV    DX, CNTPORT1
             MOV    AX, CNTINIT1
             OUT    DX, AL
             MOV    AL, AH
             OUT    DX, AL

             MOV    DX, CTRPORT
             MOV    AL, CNTCMD2
             OUT    DX, AL

             MOV    DX, CNTPORT2
             MOV    AX, CNTINIT2
             OUT    DX, AL
             MOV    AL, AH
             OUT    DX, AL

    WT:      NOP
             JMP    WT

CODE ENDS
END BEG