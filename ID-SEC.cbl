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

       PROCEDURE DIVISION.
       010-INITIAL.
           PERFORM 100-ABRIR.
           PERFORM 100-ID.
           PERFORM 100-CERRAR.
       STOP RUN.

       100-ABRIR.
           OPEN INPUT EMPLEADO.

       100-CERRAR.
           CLOSE EMPLEADO.

       100-ID.
           DISPLAY 'INGRESA ID'. ACCEPT WS-ID-EMPL.
           PERFORM 101-CONSULTA UNTIL WS-FLAG EQUAL 1.

           101-CONSULTA.
               READ EMPLEADO AT END MOVE 1 TO  WS-FLAG
               NOT AT END
               IF WS-ID-EMPL EQUAL ID-EMPL
                   DISPLAY REG-EMPL.
