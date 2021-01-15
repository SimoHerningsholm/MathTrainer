       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. UpdatePlayer.
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
LINKAGE SECTION.
01 loggedInPlayer PIC X(10).
01 playerPoints PIC 9(4).
PROCEDURE DIVISION USING loggedInPlayer, playerPoints.
DISPLAY "INSIDE UPDATE MODULE"
OPEN I-O playersFile
MOVE loggedInPlayer TO userName
READ playersFile
      INVALID KEY DISPLAY "Something went wrong"
END-READ.
MOVE playerPoints TO points
REWRITE playersData
       INVALID KEY DISPLAY "Something went wrong when trying to update"
END-REWRITE
CLOSE playersFile.
DISPLAY "SUCCESSFULLY GOT TO THE END OF UPDATE MODULE"
EXIT PROGRAM.