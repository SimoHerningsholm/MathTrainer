       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. SquareExercise.
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 userAnswer PIC 9(4)V99.
01 correctAnswer PIC 9(4).
01 counter PIC 9.
01 numberToSquare pic x comp-x.
01 oneDigitNum REDEFINES numberToSquare PIC 9(1).
LINKAGE SECTION.
01 levelChoice PIC X(1).
01 playerPoints PIC 9(4).
PROCEDURE DIVISION USING levelChoice, playerPoints.
SquareProcess.
    EVALUATE levelChoice
        WHEN "1"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM SquareLevelOneProcess
              DISPLAY oneDigitNum "^2"
              PERFORM Answer
           END-PERFORM
        WHEN "2"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM SquareLevelTwoProcess
              DISPLAY numberToSquare  "^2"
              PERFORM Answer
           END-PERFORM
        WHEN "3"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM SquareLevelThreeProcess
              DISPLAY numberToSquare "^2"
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
SquareLevelOneProcess.
    CALL 'randomfunc' USING 1, 9, numberToSquare
    MOVE numberToSquare TO oneDigitNum
    COMPUTE correctAnswer = oneDigitNum ** 2.
SquareLevelTwoProcess.
    CALL 'randomfunc' USING 10, 20, numberToSquare
    COMPUTE correctAnswer = numberToSquare ** 2.
SquareLevelThreeProcess.
    CALL 'randomfunc' USING 20, 30, numberToSquare
    COMPUTE correctAnswer = numberToSquare ** 2.