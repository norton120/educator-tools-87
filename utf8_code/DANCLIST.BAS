   10 FOR PG = 1 TO 2
   20 N=0
   30 IF PG = 2 THEN T$="        Grade 8 Sign Up Sheet" :ELSE T$="           Grade 6 and 7 Sign Up Sheet"
   40 FOR S=1 TO 5
   50 LPRINT T$
   60 LPRINT" "
   70 FOR X = 1 TO 30
   80 N = N + 1
   90 LPRINT N;"_________________________"; TAB(40) N+30;"____________________________"
  100 LPRINT" "
  110 NEXT X
  120 N = N + 30
  130 LPRINT CHR$(12)
  140 NEXT S
  150 NEXT PG
  160 END