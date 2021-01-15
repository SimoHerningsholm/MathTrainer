       >>SOURCE FORMAT FREE       
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial10.
*> This program has a menu system and allows you to
*> Add, Update, Delete and Display Customer Data
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
*> Select to use a file with keys (Indexed File)
*> We will randomly access data vs. sequential
*> Define the name associated with the key
       SELECT CustomerFile ASSIGN TO "customers.txt"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS IDNum.
 
DATA DIVISION.
FILE SECTION.
*> Model customer data
FD CustomerFile.
       01 CustomerData.
           02 IDNum PIC 99.
           02 FirstName PIC X(15).
           02 LastName PIC X(15).
 
WORKING-STORAGE SECTION.
       *> Customer menu choice
       01 Choice PIC 9.
       *> Tracks whether to exit
       01 StayOpen PIC X VALUE 'Y'.
       *> Tracks whether the customer exists
       01 CustExists PIC X.
 
PROCEDURE DIVISION.
