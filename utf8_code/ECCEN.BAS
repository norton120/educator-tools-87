   10 PRINT"Eccentricity generator"
   20 FOR X = 1 TO 2
   30 INPUT "Distance";FD
   40 INPUT "Major axis";FM
   50 E = FD/FM
   60 PRINT E
   70 NEXT X
   75 LINE INPUT Z$
   80 CLS
   90 INPUT "Another";Y$
  100 IF Y$<>"n" THEN GOTO 20
  110 END