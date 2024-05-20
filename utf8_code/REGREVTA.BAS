   10 REM  program to tally review questions
   20 PRINT " Review Question Tally Sheets"
   30 INPUT "Topic";T$
   40 INPUT "Last # of part 1 questions";NL
   50 INPUT "0 - All, 1 - Odd, 2 - Even";N2
   60 INPUT "Last # of Additional questions";AL
   70 INPUT "0 - All, 1 - Odd, 2 - Even";A2
   80 DIM N(NL): DIM A(AL)
   90 PRINT "Input # of wrong answer. When finished input +"
   95 PRINT " If no Additional Questions and last paper input -"
  100 INPUT"Part 1 Number or <+>";N$
  105 IF AL=0 AND N$="+" THEN GOTO 100
  107 IF AL=0 AND N$="-" THEN GOTO 250
  110 IF N$="+" THEN GOTO 200
  120 N = VAL(N$)
  130 N(N) = N(N) + 1
  140 GOTO 100
  200 PRINT "Input # of wrong answer. When finished this paper input <+>. When completely     done input <->."
  210 INPUT"A.Q. Number or <+> or <->";A$
  220 IF A$="+" THEN GOTO 100
  225 IF A$ = "-" THEN GOTO 250
  230 A = VAL(A$)
  240 A(A) = A(A) + 1
  245 GOTO 210
  250 LPRINT "Tally sheet for Topic ";T$;"              Date:";DATE$
  260 IF N2 = 0 THEN C=1:S=1:GOTO 300
  270 IF N2 = 1 THEN C=1:S=2:GOTO 300
  280 IF N2 = 2 THEN C=2:S=2:GOTO 300
  300 FOR X = C TO NL STEP S
  310 LPRINT TAB(5) X;"-"N(X)
  320 NEXT X
  330 LPRINT"Additional Questions"
  360 IF A2 = 0 THEN C=1:S=1:GOTO 390
  370 IF A2 = 1 THEN C=1:S=2:GOTO 390
  380 IF A2 = 2 THEN C=2:S=2:GOTO 390
  390 FOR X = C TO AL STEP S
  400 LPRINT X;"-"A(X)
  410 NEXT X
  412 LPRINT CHR$(27);CHR$(38);CHR$(108);CHR$(48);CHR$(72)
  415 SYSTEM
  420 END