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
       01 WS-RES                            PIC X.
       PROCEDURE DIVISION.
       010-INITIAL.
           PERFORM 100-ABRIR.
           PERFORM 100-PROCESO THRU 101-FING
           UNTIL WS-RES EQUAL 'N'.
           PERFORM 100-CERRAR.
       STOP RUN.

       100-ABRIR.
           OPEN OUTPUT EMPLEADO.
       100-CERRAR.
           CLOSE EMPLEADO.
       100-PROCESO.
           DISPLAY 'ID-EMPL'               ACCEPT ID-EMPL.
           DISPLAY 'NOM-EMPL'              ACCEPT NOM-EMPL.

           101-DEP.
           DISPLAY '1| LIMPIEZA  - 2| COBRANZA - 3| SISTEMAS'
           DISPLAY 'CLV-DEP'               ACCEPT CLV-DEP.
               EVALUATE TRUE
           WHEN CLV-DEP = 1 MOVE 'LIMPIEZA' TO NOM-DEP
           WHEN CLV-DEP = 2 MOVE 'COBRANZA' TO NOM-DEP
           WHEN CLV-DEP = 3 MOVE 'SISTEMAS' TO NOM-DEP
           WHEN OTHER DISPLAY 'DEPARTAMENTO INVALIDO'
           PERFORM 101-DEP.

           101-SUELDO.
           DISPLAY '1| 10K  - 2| 20K - 3| 30K'
           DISPLAY 'TAB-S'                 ACCEPT TAB-S.
               EVALUATE TRUE
           WHEN TAB-S = 1 MOVE 'A' TO TAB-S
           MOVE 10000 TO S-MEN
           WHEN TAB-S = 2 MOVE 'B' TO TAB-S
           MOVE 20000 TO S-MEN
           WHEN TAB-S = 3 MOVE 'C' TO TAB-S
           MOVE 30000 TO S-MEN
           WHEN OTHER DISPLAY 'INGRESA OPCION VALIDA.'
               PERFORM 101-SUELDO.

           101-FING.
               DISPLAY 'FECHA MAYOR A 2019'
               DISPLAY 'F-ING' ACCEPT F-ING.
               IF F-ING LESS 20190101
                   DISPLAY 'FECHA INVALIDA'
                   PERFORM 101-FING.
                   IF F-ING GREATER  20190101
                       DISPLAY 'FECHA INGRESADA ES CORRECTA'.

               WRITE REG-EMPL.
               DISPLAY 'AGREGAR OTRO REGISTRO? S/N'
               ACCEPT WS-RES.
