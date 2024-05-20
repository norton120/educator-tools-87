   10 DIM N$(35),BOOK(35),CON$(35),QU$(12)
   20 PRINT"This will make lables with students names and numbers."
   30 PRINT"Make sure Letrix is loaded and lables are in printer."
   40 INPUT"What period is this for";P1
   60 GOSUB 805
   70 FOR X = 1 TO S
   80 LPRINT "  \H\W\I";N$(X);"\h\w\i"
   90 LPRINT" "
  100 LPRINT "        \I";"TEAM 9";"\i"
  110 LPRINT" "
  120 LPRINT " "
  130 LPRINT " "
  150 NEXT X
  160 END
  805 ' DATA INPUT SUBROUTINE
  815 FI$="schdata\per" + RIGHT$(STR$(P1),1)
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