       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. DivideExercise.
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 randomNum01 PIC 9(3)V999.
01 randomNum02 PIC 9(3)V999.

01 divideLevelOneNum01 PIC 9(1).
01 divideLevelOneNum02 PIC 9(1).
01 divideLevelTwoNum01 PIC 9(1).
01 divideLevelTwoNum02 PIC 9(2).
01 divideLevelThreeNum01 PIC 9(2).
01 divideLevelThreeNum02 PIC 9(2).

01 userAnswer PIC 9(4)V99.
01 correctAnswer PIC 9(4)V99.
01 counter PIC 9.
LINKAGE SECTION.
01 levelChoice PIC X(1).
01 playerPoints PIC 9(4).
PROCEDURE DIVISION USING levelChoice, playerPoints.
DivideProcess.
    EVALUATE levelChoice
        WHEN "1"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM DivideLevelOneProcess
              DISPLAY divideLevelOneNum02 " / " divideLevelOneNum01
              PERFORM Answer
           END-PERFORM
        WHEN "2"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM DivideLevelTwoProcess
              DISPLAY divideLevelTwoNum02 " / " divideLevelTwoNum01
              PERFORM Answer
           END-PERFORM
        WHEN "3"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM DivideLevelThreeProcess
              DISPLAY divideLevelThreeNum02 " / " divideLevelThreeNum01
              PERFORM Answer
           END-PERFORM
    END-EVALUATE.
    EXIT PROGRAM.
Answer.
    ACCEPT userAnswer
    IF userAnswer = correctAnswer THEN 
       ADD 1 TO playerPoints
       DISPLAY "Correct answer"
       DISPLAY "Current points: " playerPoints
    ELSE
       SUBTRACT 1 FROM playerPoints
       DISPLAY "Wrong answer"
       DISPLAY "Current points: " playerPoints
    END-IF.
GenerateRandoms.
    COMPUTE randomNum01 = FUNCTION RANDOM
    COMPUTE randomNum02 = FUNCTION RANDOM.
DivideLevelOneProcess.
    MULTIPLY randomNum01 BY 10 GIVING divideLevelOneNum01
    MULTIPLY randomNum02 BY 10 GIVING divideLevelOneNum02
    IF divideLevelOneNum01 = 0 THEN 
       ADD 1 TO divideLevelOneNum01
    END-IF
    DIVIDE divideLevelOneNum02 BY divideLevelOneNum01 GIVING correctAnswer.
DivideLevelTwoProcess.
    MULTIPLY randomNum01 BY 10 GIVING divideLevelTwoNum01
    MULTIPLY randomNum02 BY 100 GIVING divideLevelTwoNum02
    IF divideLevelTwoNum01 = 0 THEN 
       ADD 1 TO divideLevelTwoNum01
    END-IF
    DIVIDE divideLevelTwoNum02 BY divideLevelTwoNum01 GIVING correctAnswer.
DivideLevelThreeProcess.
    MULTIPLY randomNum01 BY 100 GIVING divideLevelThreeNum01
    MULTIPLY randomNum02 BY 100 GIVING divideLevelThreeNum02
    IF divideLevelThreeNum01 = 0 THEN 
       ADD 1 TO divideLevelThreeNum01
    END-IF
    DIVIDE divideLevelThreeNum02 BY divideLevelThreeNum01 GIVING correctAnswer.