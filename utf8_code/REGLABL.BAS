   10 DIM N$(35),BOOK(35),CON$(35),QU$(12)
   20 PRINT"This will make lables with students names and numbers."
   30 PRINT"Make sure Letrix is loaded and lables are in printer."
   40 INPUT"What period is this for";P1
   50 PER=P1 * 100
   60 GOSUB 805
   70 FOR X = 1 TO S
   75 GOSUB 1000
   80 LPRINT TAB(L2)"\I";N$(X);"\i"
   90 LPRINT" Regents Earth Science '94 - '95"
  100 LPRINT "     Arlington Middle School"
  110 LPRINT"        Mr. Knox Room 212"
  120 LPRINT " "
  130 LPRINT" "
  150 NEXT X
  160 END
  805 ' DATA INPUT SUBROUTINE
  815 FI$="schdata\PER"+RIGHT$(STR$(P1),1)
  820 OPEN"I",2,FI$
  825 IF EOF(2) THEN 935  
  830 INPUT#2,P1,S,Q,M,K
  831 IF Q=0 THEN INPUT#2,QU$(0):GOTO 840
  832 FOR X = 1 TO Q: INPUT#2,QU$(X): NEXT X
  840 FOR X=1 TO S
  845 IF EOF(2) THEN 935  
  850 INPUT#2,N$(X),G$,B$,BOOK(X),CON$(X)
  930 NEXT X
  935 V=1:CLOSE
  940 RETURN
 1000 L = LEN(N$(X))
 1005 L = 35 - L
 1010 L2 =INT(L/2)
 1020 RETURN