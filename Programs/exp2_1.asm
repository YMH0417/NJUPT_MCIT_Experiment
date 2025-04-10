DATA SEGMENT
      BUF     DB 'ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz 0123456789 BCDE BCDE$'
      COUNT   DB 0
      MESSAGE DB 'The count of characters (42H~45H) is: $'
DATA ENDS

CODE SEGMENT
                     ASSUME CS: CODE, DS: DATA
      START:         
                     MOV    AX, DATA
                     MOV    DS, AX

                     MOV    SI, OFFSET BUF
                     MOV    CX, 0

      CHECK_LOOP:    
                     MOV    AL, [SI]
                     CMP    AL, '$'
                     JE     DISPLAY_RESULT

                     CMP    AL, 42H
                     JB     NEXT_CHAR

                     CMP    AL, 45H
                     JA     NEXT_CHAR

                     INC    CX

      NEXT_CHAR:     
                     INC    SI
                     JMP    CHECK_LOOP

      DISPLAY_RESULT:
                     MOV    COUNT, CL

                     MOV    AH, 09H
                     MOV    DX, OFFSET MESSAGE
                     INT    21H

                     MOV    BL, COUNT
                     MOV    CX, 8

      PRINT_BINARY:  
                     ROL    BL, 1
                     JC     PRINT_ONE

                     MOV    DL, '0'
                     MOV    AH, 02H
                     INT    21H
                     JMP    CONTINUE_PRINT

      PRINT_ONE:     
                     MOV    DL, '1'
                     MOV    AH, 02H
                     INT    21H

      CONTINUE_PRINT:
                     LOOP   PRINT_BINARY

                     MOV    AH, 4CH
                     INT    21H
CODE ENDS
              END	 START
