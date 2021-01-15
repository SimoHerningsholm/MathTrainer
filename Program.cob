       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. MainPrg.
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 startchoice PIC X(1).
01 runMainPrg PIC X(1).
01 runUserPrg PIC X(1).
01 exerciseChoice PIC X(1).
01 levelChoice PIC X(1).
01 exerciseDone PIC X(1).
01 userAnswer PIC 9(4)V99.
01 correctAnswer PIC 9(4)V99.
01 programChoices PIC X(1).
       88 validProgramChoice VALUES ARE 1 THRU 2.
       88 validExitProgramChoice VALUES ARE 0.
01 exerciseChoices PIC X(1).
       88 validExerciseChoice VALUES ARE 1 THRU 6.
       88 validExitUserChoice VALUES ARE 0.
01 levelChoices PIC X(1).
       88 validLevelChoice VALUES ARE 1 THRU 3.
       88 validLevelExitChoice VALUES ARE 0.
01 loggedInPlayer PIC X(10) VALUE ZERO.
01 playerPoints PIC 9(4) VALUE ZERO.
01 moveOn PIC A.
PROCEDURE DIVISION.
Main.
       MOVE "Y" TO runMainPrg
       PERFORM UNTIL runMainPrg = "N"
           PERFORM StartMenuChoice
           PERFORM ExecuteStartMenuChoice
       END-PERFORM.
       STOP RUN.
UserProgramLoop.
       MOVE "Y" TO runUserPrg
       PERFORM UNTIL runUserPrg = "N"
           PERFORM CheckExerciseDone
           PERFORM ExerciseMenuChoice
           PERFORM ExecuteExerciseMenuChoice
       END-PERFORM.
ExecuteExerciseMenuChoice.
       EVALUATE TRUE
           WHEN validExerciseChoice
               PERFORM LevelMenuChoice
               EVALUATE TRUE
                   WHEN validLevelChoice
                       PERFORM CallExerciseWithLevel
                   WHEN validLevelExitChoice
                       GO TO UserProgramLoop
                   WHEN OTHER 
                       DISPLAY "Something went wrong with the level menu validation"
               END-EVALUATE
               DISPLAY "Press enter to continue"
               ACCEPT moveOn
           WHEN validExitUserChoice
               MOVE ZERO TO loggedInPlayer
               MOVE ZERO TO playerPoints
               MOVE "N" TO runUserPrg
           WHEN OTHER 
               DISPLAY "Invalid choice"
       END-EVALUATE.
ExecuteStartMenuChoice.
           EVALUATE TRUE 
               WHEN validProgramChoice
                   EVALUATE startchoice
                       WHEN 1 
                           CALL 'Login' USING loggedInPlayer, playerPoints
                           DISPLAY "You are now logged in as: " loggedInPlayer
                           DISPLAY "Your total points are at the moment: " playerPoints
                           PERFORM UserProgramLoop
                       WHEN 2 CALL 'CreatePlayer'
                       WHEN OTHER DISPLAY "Something went wrong with the program menu validation"
                   END-EVALUATE
               WHEN validExitProgramChoice
                   MOVE "N" TO runMainPrg
               WHEN OTHER 
                   DISPLAY "Invalid choice"
           END-EVALUATE.
CallExerciseWithLevel.
       EVALUATE exerciseChoice
           WHEN "1" 
               CALL 'AddExercise' USING levelChoice, playerPoints
               MOVE "Y" TO exerciseDone
           WHEN "2" 
               CALL 'SubtractExercise' USING levelChoice, playerPoints
               MOVE "Y" TO exerciseDone
           WHEN "3" 
               CALL 'MultiplyExercise' USING levelChoice, playerPoints
               MOVE "Y" TO exerciseDone
           WHEN "4" 
               CALL 'DivideExercise' USING levelChoice, playerPoints
               MOVE "Y" TO exerciseDone
           WHEN "5" 
               CALL 'SquareExercise' USING levelChoice, playerPoints
               MOVE "Y" TO exerciseDone
           WHEN "6" 
               CALL 'SquareRootExercise' USING levelChoice, playerPoints
               MOVE "Y" TO exerciseDone
           WHEN OTHER DISPLAY "Something went wrong with the exercise menu validation"
       END-EVALUATE.
CheckExerciseDone.
       IF exerciseDone = "Y" THEN 
           CALL 'UpdatePlayer' USING loggedInPlayer, playerPoints
           MOVE "N" TO exerciseDone
       END-IF.
StartMenuChoice.
       PERFORM DisplayStartMenu
       ACCEPT startchoice
       MOVE startchoice TO programChoices.
ExerciseMenuChoice.
       PERFORM DisplayMenu
       ACCEPT exerciseChoice
       MOVE exerciseChoice TO exerciseChoices.
LevelMenuChoice.
       PERFORM DisplayLevel
       ACCEPT levelChoice
       MOVE levelChoice TO levelChoices.
DisplayStartMenu.
       DISPLAY "Welcome to the math program".
       DISPLAY "1: Login to user".
       DISPLAY "2: Create new user".
       DISPLAY "0: Quit program".
DisplayMenu.
       DISPLAY "Choose the exercise you want to execute".
       DISPLAY "1: Addition trainer".
       DISPLAY "2: Subtracting trainer".
       DISPLAY "3: Multiplikation trainer".
       DISPLAY "4: Division trainer".
       DISPLAY "5: Square trainer".
       DISPLAY "6: Root trainer".
       DISPLAY "0: Exit user".
DisplayLevel.
       DISPLAY "Choose the level for the chosen exercise".
       DISPLAY "1: Beginner".
       DISPLAY "2: Intermediate".
       DISPLAY "3: Advanced".
       DISPLAY "0: Return to menu".