       IDENTIFICATION DIVISION.
       PROGRAM-ID. GEN-SEC.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
           SELECT EMPLEADO
           ASSIGN TO 'C:\Users\pc\Desktop\B\COBOL-FREE\BSEC.TXT'.

       DATA DIVISION.
       FILE SECTION.
       FD EMPLEADO.
           01 REG-EMPL.
               05 ID-EMPL                   PIC 9(03).
               05 NOM-EMPL                  PIC X(30).
               05 CLV-DEP                   PIC 9.
               05 NOM-DEP                   PIC X(20).
               05 TAB-S                     PIC A.
               05 S-MEN                     PIC 9(05).
               05 F-ING                     PIC 9(08).
       WORKING-STORAGE SECTION.
       01 WS-AREAS.
           05 WS-ID-EMPL                    PIC 9(03).
           05 WS-FLAG                       PIC 9.
           05 WS-RES                        PIC X.

       PROCEDURE DIVISION.
       010-INITIAL.
           PERFORM 100-ABRIR.
           PERFORM 100-PROCESO.
           PERFORM 101-MAS UNTIL WS-RES = 'N'.


       STOP RUN.

       100-ABRIR.
           OPEN INPUT EMPLEADO.

       100-PROCESO.
           DISPLAY 'ID' ACCEPT WS-ID-EMPL.
           PERFORM 101-PROCESO UNTIL WS-FLAG EQUAL 1.

           101-PROCESO.
               READ EMPLEADO AT END CLOSE EMPLEADO
               MOVE 1 TO WS-FLAG PERFORM 101-MAS
               NOT AT END
               IF WS-ID-EMPL EQUAL ID-EMPL
                   DISPLAY REG-EMPL.

           101-MAS.
               DISPLAY 'CONSULTAR OTRO S/N'.
               ACCEPT WS-RES.
               IF WS-RES EQUAL 'S'
                   MOVE 0 TO WS-FLAG
                   OPEN INPUT EMPLEADO PERFORM 100-PROCESO.
