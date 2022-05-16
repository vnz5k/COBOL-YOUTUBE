       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIMULADOR.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WS-REG-SIM.
               05 WS-MON-MEN PIC 9(05).
               05 WS-TAS-ANU PIC 9V99.
               05 WS-BONIF   PIC 99.

           01 WS-RES.
               05 WS-TAS-MEN PIC 9V99.
               05 WS-INT-MEN PIC S9(04)V99.
               05 WS-MON-NET PIC $$$$$9.99.
               05 WS-RESULTADO PIC 9(03).

       PROCEDURE DIVISION.
           100-INITIAL.
               DISPLAY 'INGRESA MONTO MENSUAL'.      ACCEPT WS-MON-MEN.

               DISPLAY 'INGRESA LA TASA MENSUAL'.    ACCEPT WS-TAS-ANU.

               DISPLAY 'INGRESA LA BONIFICACION'.    ACCEPT WS-BONIF.

               DIVIDE 12 INTO WS-TAS-ANU GIVING WS-TAS-MEN ROUNDED.
               MULTIPLY WS-TAS-MEN BY WS-MON-MEN GIVING WS-INT-MEN.
               SUBTRACT WS-BONIF FROM WS-INT-MEN GIVING WS-RESULTADO.
               ADD WS-RESULTADO TO WS-MON-MEN GIVING WS-MON-NET.

           101-RES.
               DISPLAY 'LA TASA MENSUAL ES: '           WS-TAS-MEN.
               DISPLAY 'EL INTERES MENSUAL ES: '        WS-INT-MEN.
               DISPLAY 'EL MONTO NETO A  PAGAR ES: '    WS-MON-NET.

           STOP RUN.
