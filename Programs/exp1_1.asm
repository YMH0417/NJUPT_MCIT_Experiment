DATA SEGMENT USE16
      MESG  DB 'B23041011 Minghong Yu', 0DH, 0AH, '$'
      COUNT DB 10
DATA ENDS

CODE SEGMENT USE16
                 ASSUME CS:CODE, DS:DATA
      BEG:       
                 MOV    AX, DATA
                 MOV    DS, AX
                 MOV    CX, 10

      PRINT_LOOP:
                 MOV    DX, OFFSET MESG
                 MOV    AH, 9
                 INT    21H

                 LOOP   PRINT_LOOP

                 MOV    AH, 4CH
                 INT    21H

CODE ENDS
    END BEG
