       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. SquareRootExercise.
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 userAnswer PIC 9(4)V99.
01 correctAnswer PIC 9(4).
01 counter PIC 9.
01 levelOneNumberTable.
       05 levelOnePartOne PIC 9(1) OCCURS 2 TIMES.
       05 levelOnePartTwo PIC 9(2) OCCURS 6 TIMES.
01 levelTwoAndThreeNumberTable.
       05 levelThree PIC 9(3) OCCURS 8 TIMES.
01 numberToRoot PIC 9(3).
01 rootIndex pic x comp-x.

LINKAGE SECTION.
01 levelChoice PIC X(1).
01 playerPoints PIC 9(4).
PROCEDURE DIVISION USING levelChoice, playerPoints.
SquareProcess.
    EVALUATE levelChoice
        WHEN "1"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM SquareRootLevelOneProcess
              DISPLAY numberToRoot "^0.5"
              PERFORM Answer
           END-PERFORM
        WHEN "2"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM SquareRootLevelTwoProcess
              DISPLAY numberToRoot "^0.5"
              PERFORM Answer
           END-PERFORM
        WHEN "3"
           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter = 5
              PERFORM SquareRootLevelThreeProcess
              DISPLAY numberToRoot "^0.5"
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
SquareRootLevelOneProcess.
    MOVE 49162536496481 TO levelOneNumberTable
    CALL 'randomfunc' USING 1, 8, rootIndex
    IF rootIndex < 3 THEN
       MOVE levelOnePartOne(rootIndex) TO numberToRoot
    ELSE
       MOVE levelOnePartTwo(rootIndex - 2) TO numberToRoot
    END-IF
    COMPUTE correctAnswer = numberToRoot ** 0.5.
SquareRootLevelTwoProcess.
    MOVE 100121144169196225256289 TO levelTwoAndThreeNumberTable
    CALL 'randomfunc' USING 1, 8, rootIndex
    MOVE levelThree(rootIndex) TO numberToRoot
    COMPUTE correctAnswer = numberToRoot ** 0.5.
SquareRootLevelThreeProcess.
    MOVE 324361400441484529576625 TO levelTwoAndThreeNumberTable
    CALL 'randomfunc' USING 1, 8, rootIndex
    MOVE levelThree(rootIndex) TO numberToRoot
    COMPUTE correctAnswer = numberToRoot ** 0.5.