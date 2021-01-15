       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. SubtractExercise.
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 randomNum01 PIC 9(3)V999.
01 randomNum02 PIC 9(3)V999.

01 subtractLevelOneNum01 PIC 9(1).
01 subtractLevelOneNum02 PIC 9(1).
01 subtractLevelTwoNum01 PIC 9(2).
01 subtractLevelTwoNum02 PIC 9(2).
01 subtractLevelThreeNum01 PIC 9(3).
01 subtractLevelThreeNum02 PIC 9(3).

01 userAnswer PIC 9(4)V99.
01 correctAnswer PIC 9(4)V99.
01 counter PIC 9.
LINKAGE SECTION.
01 levelChoice PIC X(1).
01 playerPoints PIC 9(4).
PROCEDURE DIVISION USING levelChoice, playerPoints.
SubtractProcesss.
    EVALUATE levelChoice
        WHEN "1"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM SubtractionLevelOneProcess
              DISPLAY subtractLevelOneNum01 " - " subtractLevelOneNum02
              PERFORM Answer
           END-PERFORM
        WHEN "2"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM SubtractionLevelTwoProcess
              DISPLAY subtractLevelTwoNum01 " - " subtractLevelTwoNum02
              PERFORM Answer
           END-PERFORM
        WHEN "3"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM SubtractionLevelThreeProcess
              DISPLAY subtractLevelThreeNum01 " - " subtractLevelThreeNum02
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
SubtractionLevelOneProcess.
    MULTIPLY randomNum01 BY 10 GIVING subtractLevelOneNum01
    MULTIPLY randomNum02 BY 10 GIVING subtractLevelOneNum02     
    SUBTRACT subtractLevelOneNum02 FROM subtractLevelOneNum01 GIVING correctAnswer.
SubtractionLevelTwoProcess.
    MULTIPLY randomNum01 BY 100 GIVING subtractLevelTwoNum01
    MULTIPLY randomNum02 BY 100 GIVING subtractLevelTwoNum02     
    SUBTRACT subtractLevelTwoNum02 FROM subtractLevelTwoNum01 GIVING correctAnswer.
SubtractionLevelThreeProcess.
    MULTIPLY randomNum01 BY 1000 GIVING subtractLevelThreeNum01
    MULTIPLY randomNum02 BY 1000 GIVING subtractLevelThreeNum02     
    SUBTRACT subtractLevelThreeNum02 FROM subtractLevelThreeNum01 GIVING correctAnswer.