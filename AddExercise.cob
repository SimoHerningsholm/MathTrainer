       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. AddExercise.
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 randomNum01 PIC 9(3)V999.
01 randomNum02 PIC 9(3)V999.

01 addLevelOneNum01 PIC 9(1).
01 addLevelOneNum02 PIC 9(1).
01 addLevelTwoNum01 PIC 9(2).
01 addLevelTwoNum02 PIC 9(2).
01 addLevelThreeNum01 PIC 9(3).
01 addLevelThreeNum02 PIC 9(3).

01 userAnswer PIC 9(4)V99.
01 correctAnswer PIC 9(4)V99.
01 counter PIC 9.
LINKAGE SECTION.
01 levelChoice PIC X(1).
01 playerPoints PIC 9(4).

PROCEDURE DIVISION USING levelChoice, playerPoints.
AddProcess.
    EVALUATE levelChoice
        WHEN "1"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM AdditionLevelOneProcess
              DISPLAY addLevelOneNum01 " + " addLevelOneNum02
              PERFORM Answer
           END-PERFORM
        WHEN "2"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM AdditionLevelTwoProcess
              DISPLAY addLevelTwoNum01 " + " addLevelTwoNum02
              PERFORM Answer
           END-PERFORM
        WHEN "3"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM AdditionLevelThreeProcess
              DISPLAY addLevelThreeNum01 " + " addLevelThreeNum02
              PERFORM Answer
           END-PERFORM
    END-EVALUATE.
    EXIT PROGRAM.
Answer.
    ACCEPT userAnswer
    IF userAnswer = correctAnswer THEN 
       ADD 1 TO playerPoints
       DISPLAY "Correct answer"
       DISPLAY "Current points" playerPoints
    ELSE
       SUBTRACT 1 FROM playerPoints
       DISPLAY "Wrong answer"
       DISPLAY "Current points" playerPoints
    END-IF.
GenerateRandoms.
    COMPUTE randomNum01 = FUNCTION RANDOM
    COMPUTE randomNum02 = FUNCTION RANDOM.
AdditionLevelOneProcess.
    MULTIPLY randomNum01 BY 10 GIVING addLevelOneNum01
    MULTIPLY randomNum02 BY 10 GIVING addLevelOneNum02     
    ADD addLevelOneNum01 TO addLevelOneNum02 GIVING correctAnswer.
AdditionLevelTwoProcess.
    MULTIPLY randomNum01 BY 100 GIVING addLevelTwoNum01
    MULTIPLY randomNum02 BY 100 GIVING addLevelTwoNum02
    ADD addLevelTwoNum01 TO addLevelTwoNum02 GIVING correctAnswer.
AdditionLevelThreeProcess.
    MULTIPLY randomNum01 BY 1000 GIVING addLevelThreeNum01
    MULTIPLY randomNum02 BY 1000 GIVING addLevelThreeNum02
    ADD addLevelThreeNum01 TO addLevelThreeNum02 GIVING correctAnswer.