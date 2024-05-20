   10 CLS
   20 PRINT "               Scoring Aid"
   30 PRINT" "
   40 INPUT"Number of questions on the test";Q
   50 INPUT"Point value for each question";V
   60 TS=Q*V
   65 F=INT(TS*.65)
   70 INPUT"Test Name";N$
   80 LPRINT N$
   90 LPRINT "Number of Questions - ";Q;"    Points / Ques. -";V
  100 LPRINT"Number Wrong"; TAB(15) "Score"
  110 LPRINT CHR$(27); CHR$(38); CHR$(100); CHR$(48); CHR$(68);
  120 FOR X = 0 TO Q
  130 TG = TS - (V*X)
  135 IF TG<(F+1) THEN LPRINT"*";
  140 LPRINT TAB(4)  X; TAB(17) TG
  150 NEXT X
  170 LPRINT CHR$(27); CHR$(38); CHR$(100); CHR$(64)
  175 LPRINT CHR$(27); CHR$(38); CHR$(108); CHR$(48); CHR$(72)
  180 SYSTEM
  190 END