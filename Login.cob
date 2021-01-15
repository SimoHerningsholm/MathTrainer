       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. Login.
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
SELECT playersFile ASSIGN TO "players.txt"
    ORGANIZATION IS INDEXED 
    ACCESS MODE IS RANDOM 
    RECORD KEY IS userName.
DATA DIVISION.
FILE SECTION. 
FD playersFile.
01 playersData.
       02 userName PIC X(10).
       02 pass PIC X(10).
       02 points PIC 9(4).
WORKING-STORAGE SECTION.
01 playerExist PIC X(1).
01 passwordTryout PIC X(10).
01 SuccessfullLogin PIC X(1) VALUE "N".
LINKAGE SECTION.
01 loggedInPlayer PIC X(10).
01 playerPoints PIC 9(4).
PROCEDURE DIVISION USING loggedInPlayer, playerPoints.
OPEN I-O playersFile
PERFORM UNTIL SuccessfullLogin = "Y"
       MOVE 'Y' TO playerExist
       DISPLAY "Enter username"
       ACCEPT userName
       READ playersFile
           INVALID KEY MOVE 'N' TO playerExist
       END-READ
       IF playerExist='N'
           DISPLAY "Invalid username"
       ELSE
           DISPLAY "Enter password"
           ACCEPT passwordTryout
           IF passwordTryout = pass THEN
              MOVE userName TO loggedInPlayer
              MOVE points TO playerPoints
              MOVE "Y" TO SuccessfullLogin
           ELSE 
              DISPLAY "Invalid password"
           END-IF
       END-IF
END-PERFORM.
MOVE "N" TO SuccessfullLogin
CLOSE playersFile
EXIT PROGRAM.