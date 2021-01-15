       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. MultiplyExercise.
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 randomNum01 PIC 9(3)V999.
01 randomNum02 PIC 9(3)V999.

01 multiplyLevelOneNum01 PIC 9(1).
01 multiplyLevelOneNum02 PIC 9(1).
01 multiplyLevelTwoNum01 PIC 9(1).
01 multiplyLevelTwoNum02 PIC 9(2).
01 multiplyLevelThreeNum01 PIC 9(2).
01 multiplyLevelThreeNum02 PIC 9(2).

01 userAnswer PIC 9(4)V99.
01 correctAnswer PIC 9(4)V99.
01 counter PIC 9.
LINKAGE SECTION.
01 levelChoice PIC X(1).
01 playerPoints PIC 9(4).
PROCEDURE DIVISION USING levelChoice, playerPoints.
MultiplyProcess.
    EVALUATE levelChoice
        WHEN "1"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM MultiplyLevelOneProcess
              DISPLAY multiplyLevelOneNum01 " * " multiplyLevelOneNum02
              PERFORM Answer
           END-PERFORM
        WHEN "2"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM MultiplyLevelTwoProcess
              DISPLAY multiplyLevelTwoNum01 " * " multiplyLevelTwoNum02
              PERFORM Answer
           END-PERFORM
        WHEN "3"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM GenerateRandoms
              PERFORM MultiplyLevelThreeProcess
              DISPLAY multiplyLevelThreeNum01 " * " multiplyLevelThreeNum02
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
MultiplyLevelOneProcess.
    MULTIPLY randomNum01 BY 10 GIVING multiplyLevelOneNum01
    MULTIPLY randomNum02 BY 10 GIVING multiplyLevelOneNum02     
    MULTIPLY multiplyLevelOneNum01 BY multiplyLevelOneNum02 GIVING correctAnswer.
MultiplyLevelTwoProcess.
    MULTIPLY randomNum01 BY 10 GIVING multiplyLevelTwoNum01
    MULTIPLY randomNum02 BY 100 GIVING multiplyLevelTwoNum02     
    MULTIPLY multiplyLevelTwoNum01 BY multiplyLevelTwoNum02 GIVING correctAnswer.
MultiplyLevelThreeProcess.
    MULTIPLY randomNum01 BY 100 GIVING multiplyLevelThreeNum01
    MULTIPLY randomNum02 BY 100 GIVING multiplyLevelThreeNum02     
    MULTIPLY multiplyLevelThreeNum01 BY multiplyLevelThreeNum02 GIVING correctAnswer.