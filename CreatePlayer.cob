       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. CreatePlayer.
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
PROCEDURE DIVISION.
OPEN I-O playersFile
DISPLAY "Enter Username"
ACCEPT userName
DISPLAY "Enter password"
ACCEPT pass
MOVE ZERO TO points
WRITE playersData
    INVALID KEY DISPLAY "Username taken"
END-WRITE
CLOSE playersFile
EXIT PROGRAM.