   10 CLS: COLOR 15,1:CLS
   15 DIM N$(33),N(33,35,1),G(33,6),R(7),R$(10),L$(6),BOOK(3,33),CON$(3,1,33),QU$(30)
   16 DIM LN(60), LG(30,60,1), LB$(60), LT(60), RTG(33)
   18 ON ERROR GOTO 8000
   19 WIDTH LPRINT 136
   20 Y=0: PRINT  TAB(35)"Regents Maintenance Program"
   25 INPUT"WHAT PERIOD IS THIS FOR";P1
   30 VIEW PRINT 1 TO 24:CLS: PRINT" ":PRINT" ":PRINT"THIS IS A :":PRINT" ":PRINT" ":PRINT"1-Input Lab Info."
   31 PRINT"2-Update"
   32 PRINT"3-Print Lab Covers";TAB(30)"11-Print Exam Storage"
   33 PRINT"4-Grade Calculation";TAB(30)"12-Check M.P. Grades"
   34 PRINT"5-Class List";TAB(30)"13-Change M.P. Grades"
   35 PRINT"6-Delete Lab Cover";TAB(30)"14-Get Old Lab Lists"
   36 PRINT"7-Input Regents Grades";TAB(30)"15-Stop Work on This Class"
   37 PRINT"8-Save Lab Lists";TAB(34)"Without saving Data"
   38 PRINT"9-Make Up Insert"TAB(30)"16-Add a student to the lab covers"
   39 PRINT"10-Save Class Data":PRINT" ":PRINT TAB(30)"WHAT #";
   40 IF V<>1 THEN GOTO 50   
   45 INPUT A :ON A GOTO 11410,135,11620,330,670,6100,11900,5000,1268,980,11700,4010,4300,5200,1047,7000
   50 INPUT A:ON A GOTO 11405,130,11618,325,665,6100,11899,5000,1265,980,11698,4000,4290,5200,1047,7000
  130 GOSUB 805  
  135 VIEW PRINT 1 TO 24:GOSUB 6000: INPUT"THIS IS TO 1-DELETE, 2-ADD OR 3-MOVE  A STUDENT";A:IF A=3 THEN GOSUB 2500
  136 IF A=2 THEN GOTO 170
  138 IF A=3 THEN GOTO 165
  140 INPUT"WHAT IS THE # OF THE STUDENT TO BE DELETED";N
  145 PRINT"IF ";N$(N);" IS THE PERSON TO BE DELETED ENTER 1.":INPUT"IF NOT ENTER 2";Y1:IF Y1=1 THEN GOSUB 150 :ELSE GOTO 140
  149 GOTO 165
  150 N$(N)=" ":FOR X=1 TO Q:N(N,X,0)=0:N(N,X,1)=0:NEXT X
  155 FOR X=N TO S:N$(X)=N$(X+1):FOR B = 0 TO 3:BOOK(B,X)=BOOK(B,X+1):FOR CN = 0 TO 1:CON$(B,CN,X)=CON$(B,CN,X+1):NEXT CN:NEXT B:FOR J=0 TO M:G(X,J)=G(X+1,J):NEXT J:NEXT X:FOR X1=N TO S:FOR T=1 TO Q:FOR Z=0 TO 1:N(X1,T,Z)=N(X1+1,T,Z):NEXT Z:NEXT T:NEXT X1
  160 S=S-1:RETURN
  165 INPUT"ANY MORE CHANGES(1-YES,2-N0)";Y:IF Y=1 THEN 135  :ELSE GOTO 30   
  170 S=S+1:GOSUB 175:GOTO 184
  175 INPUT"AT WHAT POSITION MUST THE STUDENT BE INSERTED";N
  176 PRINT"THAT WILL PUT THEM BETWEEN ";N$(N-1);" AND ";N$(N);" O.K.";
  177 INPUT"( Y OR N )";Y$
  178 IF Y$="N" OR Y$="n" THEN GOTO 175 :ELSE GOTO 180
  180 FOR X=S TO N STEP-1:N$(X)=N$(X-1):FOR BK = 0 TO 3:BOOK(BK,X)=BOOK(BK,X-1):FOR CN=0 TO 1:CON$(BK,CN,X)=CON$(BK,CN,X-1):NEXT CN:NEXT BK:FOR J=0 TO M:G(X,J)=G(X-1,J):NEXT J:NEXT X:FOR X1=S TO N STEP-1:FOR T=1 TO Q:FOR Z=0 TO 1:N(X1,T,Z)=N(X1-1,T,Z):NEXT
  184 FOR X= 1 TO Q: N(N,X,0)=0: N(N,X,1)=0: NEXT X
  185 PRINT"THE NAME OF STUDENT #";N;
  190 INPUT"IS";N$(N)
  191 INPUT"UNIT number for book is";B:B=B-1
  192 INPUT"Book # is";BOOK(B,N)
  194 INPUT"Book condition is";CON$(B,0,N)
  195 FOR J=0 TO M-1:PRINT"M.P.#";J+1;:INPUT"GRADE";G(N,J):NEXT J
  200 INPUT"HOW MANY GRADES MUST BE ADDED";G1
  205 IF G1=0 THEN GOTO 165  :ELSE 210  
  210 FOR X=1 TO G1
  215 PRINT"GRADE #";X;:INPUT" IS";N(N,X,0):INPUT" OUT OF";N(N,X,1)
  220 NEXT X
  225 INPUT"HOW MANY MISTAKES";G3:IF G3=0 THEN GOTO 165  :ELSE 230  
  230 FOR X=1 TO G3
  235 INPUT"WHAT GRADE #";T:PRINT"#";T;:INPUT" IS";N(N,T,0);:INPUT"OUT OF";N(N,T,1)
  240 NEXT X
  245 V=1:GOTO 30   
  325 GOSUB 805  
  330 INPUT"DO YOU WANT HARDCOPY(1) OR SOFTCOPY(2)";P
  335 INPUT"IS THIS FOR: 1-ONE STUDENT 2-ENTIRE CLASS";C
  340 ON C GOTO 345  ,445  
  345 INPUT"WHAT IS THE NUMBER OF THE STUDENT YOU WANT INFORMATION ON(0 WHEN DONE)";X:IF X=0 THEN LPRINT CHR$(27);CHR$(38);CHR$(108);CHR$(48);CHR$(72):GOTO 30
  350 IF P=1 THEN GOTO 395  
  355 PRINT N$(X);"  ";
  360 FOR O=1 TO Q
  365 PRINT QU$(O); N(X,O,0);"/";N(X,O,1);",";
  370 NEXT O
  375 GOSUB 945  
  380 PRINT"TOTALING";N(X,0,0);"/";N(X,0,1);"=";F;"%"
  385 N(X,0,0)=0:N(X,0,1)=0
  390 IF P=2 THEN GOTO 345  
  395 PRINT"MAKE SURE PRINTER IS READY. HIT KEY TO START"
  400 Q$=INKEY$:IF Q$="" THEN GOTO 400
  405 LPRINT N$(X);"  ";
  410 FOR O=1 TO Q
  415 LPRINT QU$(O); N(X,O,0);"/";N(X,O,1);",";
  420 NEXT O
  425 GOSUB 945  
  430 LPRINT"TOTALING";N(X,0,0);"/";N(X,0,1);"=";F;"%"
  435 N(X,0,0)=0:N(X,0,1)=0
  440 GOTO 345  
  445 INPUT"IS THIS A FINAL GRADE CALCULATION(1-YES,2-N0)";F1:IF F1=1 THEN M=M+1
  446 IF F1=1 THEN GOSUB 9900
  450 INPUT"DO YOU WANT: 1-JUST NAMES AND GRADES  2-EVERYTHING";E
  455 ON E GOTO 460  ,540  
  460 IF P=1  THEN GOTO 500  
  465 FOR X=1 TO S
  470 PRINT N$(X);
  475 GOSUB 945  
  480 PRINT"  RECIEVED GRADES TOTALING";N(X,0,0);"/";N(X,0,1);"=";F;"%"
  485 IF X=10 OR X=20 THEN LINE INPUT"Hit ENTER key to continue";GOON$
  490 IF F1=1 THEN G(X,M-1)=F
  495 NEXT X:LINE INPUT"Hit ENTER to continue";GOON$:GOTO 30
  500 PRINT"MAKE SURE PRINTER IS READY. HIT SPACE TO START."
  505 Q$=INKEY$:IF Q$="" THEN GOTO 505
  510 FOR X=1 TO S
  515 GOSUB 945  
  520 LPRINT N$(X);"  RECIEVED GRADES TOTALING";N(X,0,0);"/";N(X,0,1);"=";F;"%"
  525 IF F1=1 THEN G(X,M-1)=F
  530 N(X,0,0)=0:N(X,0,1)=0
  535 NEXT X:GOTO 30   
  540 IF P=1 THEN GOTO 600  
  542 CLS: FOR X= 1 TO Q: PRINT X;QU$(X);:NEXT X:PRINT" "
  544 VIEW PRINT 3 TO 24
  545 FOR X = 1 TO S
  550 PRINT N$(X);",";
  555 FOR L=1 TO Q
  560 PRINT N(X,L,0);"/";N(X,L,1);",";
  565 NEXT L
  570 GOSUB 945  
  575 PRINT"TOTALING ";N(X,0,0);"/";N(X,0,1);"=";F;"%"
  580 IF F1=1 THEN G(X,M-1)=F
  585 IF X=10 OR X=20 THEN LINE INPUT"Hit ENTER key to continue";GOON$
  590 N(X,0,0)=0:N(X,0,1)=0
  595 NEXT X:LINE INPUT"Hit ENTER to continue";GOON$:GOTO 30
  600 PRINT"MAKE SURE PRINTER IS READY. HIT SPACE TO START."
  605 Q$=INKEY$:IF Q$="" THEN GOTO 605
  606 LPRINT CHR$(15);:LPRINT "Period";P1;"     Marking Period";
  607 IF F1=1 THEN MRP=M :ELSE MRP=M+1
  608 LPRINT MRP:FOR X=1 TO Q: LPRINT"  #";X;"- ";QU$(X);:NEXT X:LPRINT" ":LPRINT" "
  610 FOR X=1 TO S
  615 LPRINT N$(X);" ";
  620 FOR L=1 TO Q
  625 LPRINT N(X,L,0);"/";N(X,L,1);",";
  630 NEXT L
  635 GOSUB 945  
  640 LPRINT"TOTALING";N(X,0,0);"/";N(X,0,1);"=";
  645 LPRINT F;"%"
  650 IF F1=1 THEN G(X,M-1)=F
  655 N(X,0,0)=0:N(X,0,1)=0
  660 NEXT X: LPRINT CHR$(27);CHR$(38);CHR$(108);CHR$(48);CHR$(72):GOTO 30
  665 GOSUB 805  
  670 INPUT"1-HARDCOPY,2-SOFTCOPY";H
  675 IF H<>1 THEN GOTO 710  
  680 PRINT"MAKE SURE PRINTER IS READY.  HIT SPACE TO START."
  685 Q$=INKEY$:IF Q$="" THEN GOTO 685
  690 LPRINT"PERIOD ";P1
  695 FOR X=1 TO S
  700 LPRINT X;N$(X)
  705 NEXT X: LPRINT CHR$(27);CHR$(38);CHR$(108);CHR$(48);CHR$(72):GOTO 30
  710 CLS:PRINT"THERE ARE ";S;" STUDENTS IN THIS CLASS   "
  715 U=INT(S/2)
  720 FOR X=1 TO U
  725 PRINT X;N$(X);TAB(28)X+U;N$(X+U)
  730 NEXT X
  732 IF U*2 < S THEN PRINT TAB(28)U*2+1;N$(U*2+1)
  735 PRINT " ":LINE INPUT"HIT ENTER TO CONT.";A$:GOTO 30   
  805 ' DATA INPUT SUBROUTINE
  807 INPUT"<O>ld or <C>urrent Marking Period";OP$
  809 IF OP$="C" OR OP$="c" THEN GOTO 815
  810 INPUT"Marking Period";MP$
  811 FI$ = "A:per"+RIGHT$(STR$(P1),1)+".mp"+MP$
  812 GOTO  820
  815 FI$="C:\school\schdata\per"+RIGHT$(STR$(P1),1)
  820 OPEN"I",2,FI$
  825 IF EOF(2) THEN 935  
  830 INPUT#2,P1,S,Q,M,K,CON$(0,0,0),CON$(1,0,0),CON$(2,0,0),CON$(3,0,0)
  831 IF Q=0 THEN INPUT#2,QU$(0):GOTO 835
  832 FOR X = 1 TO Q: INPUT#2,QU$(X): NEXT X
  835 LET A$="/"
  840 FOR X=1 TO S
  845 IF EOF(2) THEN 935  
  850 INPUT#2,N$(X),G$,B$,BOOK(0,X),CON$(0,0,X),CON$(0,1,X),BOOK(1,X),CON$(1,0,X),CON$(1,1,X),BOOK(2,X),CON$(2,0,X),CON$(2,1,X),BOOK(3,X),CON$(3,0,X),CON$(3,1,X)
  855 LF=1:I=1
  860 FOR J=0 TO M
  865 IF MID$(G$,I,1)=A$ THEN  GOTO 875  
  870 I=I+1:GOTO 865  
  875 G(X,J)=VAL(MID$(G$,LF,I-LF))
  880 LF=I+1:I=I+1
  885 NEXT J
  890 LF=1:I=1
  895 FOR Y=1 TO Q
  900 FOR Z=0 TO 1
  905 IF MID$(B$,I,1)=A$ THEN GOTO 915  
  910 I=I+1:GOTO 905  
  915 N(X,Y,Z)=VAL(MID$(B$,LF,I-LF))
  920 LF=I+1: I=I+1
  925 IF I<LEN(B$) THEN NEXT Z:NEXT Y
  930 NEXT X
  935 V=1:CLOSE
  940 RETURN
  945 FOR Z1=0 TO 1
  946 N(X,0,Z1)=0
  950 FOR G=1 TO Q
  955 N(X,0,Z1)=N(X,0,Z1)+N(X,G,Z1)
  960 NEXT G
  965 NEXT Z1
  970 F=(N(X,0,0)/N(X,0,1))*100
  975 RETURN
  980 ' DATA OUTPUT SUBROUTINE
  990 PRINT"Is ";FI$;" the correct file name";:INPUT"<1-yes, 2-no>"; FA
  992 IF FA=2 THEN INPUT"New Name{include drive}";FI$
  995 OPEN"O",1,FI$
 1000 PRINT#1,P1;",";S;",";Q;",";M;",";K;",";CON$(0,0,0);",";CON$(1,0,0);",";CON$(2,0,0);",";CON$(3,0,0)
 1002 FOR X= 1 TO Q-1:PRINT#1,QU$(X);",";:NEXT X:PRINT#1,QU$(Q)
 1005 B$=" ":A$="/":G$=" "
 1010 FOR X=1 TO S
 1015 FOR Y=1 TO Q
 1020 FOR Z=0 TO 1
 1025 B$=B$+STR$(N(X,Y,Z))+A$ 
 1030 NEXT Z :NEXT Y
 1035 FOR Y1=0 TO M:G$=G$+STR$(G(X,Y1))+A$:NEXT Y1
 1040 PRINT#1,N$(X);",";G$;",";B$;",";BOOK(0,X);",";CON$(0,0,X);",";CON$(0,1,X);",";BOOK(1,X);",";CON$(1,0,X);",";CON$(1,1,X);",";BOOK(2,X);",";CON$(2,0,X);",";CON$(2,1,X);",",BOOK(3,X);",";CON$(3,0,X);",";CON$(3,1,X)
 1043 G$=" ":B$=" ":NEXT X:CLOSE:IF B=1 THEN GOTO 2555
 1045 IF B=2 THEN GOTO 30
 1046 IF B=3 THEN RETURN
 1047 CLS:LINE INPUT"ENTER 0 IF YOU HAVE MORE CLASSES TO DO OR ANY NUMBER TO EXIT:";V$:V=VAL(V$):IF V=0 THEN RUN :ELSE GOTO 1050
 1050 IF V>0 OR V$=CHR$(13) THEN SYSTEM
 1265 GOSUB 805  
 1268 GOSUB 1270: GOTO 1302
 1270 N=1:P3=1:NROW=2:CLS
 1275 FOR X=1 TO Q
 1277 IF X=4 THEN NROW=4:P3=1
 1278 IF X=7 THEN NROW=5:P3=1
 1279 IF X=10 THEN NROW=6:P3=1
 1280 IF X=13 THEN NROW=7:P3=1
 1281 IF X=16 THEN NROW=8:P3=1
 1282 IF X=19 THEN NROW=9:P3=1
 1283 IF X=22 THEN NROW=10:P3=1
 1284 IF X=25 THEN NROW=11:P3=1
 1285 LOCATE NROW, P3:PRINT" GR.#";X;QU$(X);
 1286 IF N(N,X,1)<1 THEN N=N+1
 1287 IF N<>S AND N(N,X,1)<1 THEN GOTO 1285
 1290 PRINT N(N,X,1)
 1295 P3=P3+25
 1300 NEXT X
 1301 RETURN
 1302 VIEW PRINT 17 TO 24
 1305 CLS: PRINT "# OF STUDENT THAT MADE UP WORK";:INPUT N
 1310 PRINT "IF ";N$(N);" ISN'T THE CORRECT STUDENT ENTER 0 FOR GRADE #."
 1315 PRINT "GRADE TO BE INSERTED";:INPUT G3:IF G3=0 THEN GOTO 1305
 1320 PRINT N$(N);:INPUT" RECIEVED";N(N,G3,0)
 1325 PRINT"OUT OF";N(N,G3,1);" (JUST HIT ENTER IF CORRECT)";:HOLDIT=N(N,G3,1)
 1326 INPUT TAKEIT$
 1327 IF TAKEIT$ = "" THEN TAKEIT$ = STR$(HOLDIT)
 1328 N(N,G3,1)= VAL(TAKEIT$)
 1330 PRINT"DO YOU WANT TO: 1-ADD ANOTHER GRADE FOR THIS STUDENT, 2-ADD GRADES FOR ANOTHER  STUDENT, 3-FINISHED WITH THIS";:INPUT Y
 1335 ON Y GOTO 1310 ,1305 ,30
 1340 END
 2500 INPUT"WHAT IS THE NUMBER OF THE STUDENT TO BE MOVED";N
 2505 PRINT"IF ";N$(N);" IS CORRECT ENTER ANY NUMERAL"
 2510 INPUT"IF NOT ENTER 0";Y
 2515 IF Y=0 THEN GOTO 2500 :ELSE GOTO 2520
 2520 N$(33)=N$(N):FOR BK = 0 TO 3:BOOK(BK,33)=BOOK(BK,N):FOR CN=0 TO 1:CON$(BK,CN,33)=CON$(BK,CN,N):NEXT CN:NEXT BK
 2525 FOR X=1 TO Q:FOR T=0 TO 1:N(33,X,T)=N(N,X,T):NEXT T:NEXT X
 2530 FOR J=0 TO M:G(33,J)=G(N,J):NEXT J
 2535 GOSUB 150
 2540 Q5=Q
 2545 CLS:B=1:GOTO 980:FOR X = 1 TO 31:FOR Y =1 TO Q:FOR Z = 0 TO 1:N(X,Y,Z)=0:NEXT Z:NEXT Y: NEXT X
 2555 PRINT"TO WHAT PER. MUST ";N$(33);:INPUT" BE ADDED";P1
 2560 FOR CLE = 1 TO S:N$(CLE)="":BOOK(CLE)=0:CON$(CLE)="":FOR WIPE = 1 TO Q:FOR PQ = 0 TO 1: N(CLE,WIPE,PQ)=0:NEXT PQ:NEXT WIPE:FOR GR = 1 TO 6:G(CLE,GR) = 0:NEXT GR: NEXT CLE
 2565 CLS:GOSUB 805
 2575 IF Q5>Q THEN Q=Q5
 2585 S=S+1:VIEW PRINT 1 TO 24:GOSUB 6000:GOSUB 175
 2595 N$(N)=N$(33):FOR BK=0 TO 3:BOOK(BK,N)=BOOK(BK,33):FOR CN=0 TO 1:CON$(BK,CN,N)=CON$(BK,CN,33):NEXT CN:NEXT BK
 2605 FOR X=1 TO Q:FOR T=0 TO 1:N(N,X,T)=N(33,X,T):NEXT T:NEXT X
 2615 FOR J=0 TO M:G(N,J)=G(33,J):NEXT J
 2625 B=0:RETURN
 4000 GOSUB 805
 4010 INPUT"Is this for (1) one student or (2) the entire class";CCHECK
 4020 INPUT"Do you want (1) hard or (2) soft copy";COP
 4030 IF CCHECK=1 THEN GOTO 4130
 4040 FOR X=1 TO S
 4045 IF COP=1 THEN LPRINT N$(X); :ELSE PRINT N$(X);
 4050 FOR AVG=0 TO M-1
 4060 MPG = MPG+ G(X,AVG)
 4070 IF COP=1 THEN LPRINT G(X,AVG); :ELSE PRINT G(X,AVG);
 4080 NEXT AVG
 4090 MPG = MPG/M
 4100 IF COP=1 THEN LPRINT " =";MPG;"%" :ELSE PRINT " =";MPG;"%"
 4110 MPG=0
 4112 IF COP<>1 AND X=22 THEN LINE INPUT"Hit ENTER key to continue";GOON$
 4120 NEXT X
 4122 LINE INPUT"Hit ENTER to continue";GOON$
 4125 GOTO 30
 4130 GOSUB 6000
 4140 INPUT"What is the number of the student you want to check";X
 4150 IF COP=1 THEN LPRINT N$(X); :ELSE PRINT N$(X);
 4160 FOR AVG=0 TO M-1
 4170 MPG = MPG + G(X,AVG)
 4180 IF COP=1 THEN LPRINT G(X,AVG); :ELSE PRINT G(X,AVG);
 4190 NEXT AVG
 4200 MPG = MPG/M
 4210 IF COP=1 THEN LPRINT " =";MPG;"%" :ELSE PRINT " =";MPG;"%"
 4220 MPG=0
 4230 INPUT"Do you want info. on another student";YUP$
 4240 YUP$=LEFT$(YUP$,1)
 4250 IF YUP$="Y" OR YUP$="y" THEN GOTO 4140 :ELSE GOTO 30
 4290 GOSUB 805
 4300 GOSUB 6000
 4310 INPUT"What is the student's number";X
 4320 PRINT N$(X);
 4330 FOR AVG=0 TO M
 4340 PRINT" M.P. #";AVG+1;" =";G(X,AVG);
 4350 NEXT AVG
 4355 PRINT " "
 4360 INPUT"What marking period grade must be changed";AVG
 4370 AVG=AVG-1
 4380 INPUT"What is the new grade";G(X,AVG)
 4390 INPUT"Any more changes";YUP$
 4400 YUP$=LEFT$(YUP$,1)
 4410 IF YUP$="Y" OR YUP$="y" THEN GOTO 4310 :ELSE GOTO 30
 4500 LPRINT CHR$(27);CHR$(20);:FOR Y1=0 TO 5
 4520 LPRINT TAB(Y1*23)L$(Y1+1);
 4540 NEXT Y1
 4545 LPRINT" "
 4550 FOR Y1=0 TO 5
 4560 LPRINT TAB(Y1*23)R$(Y1+1);
 4580 NEXT Y1
 4585 LPRINT" "
 4590 LPRINT" "
 4600 IF X<=S THEN RETURN :ELSE GOTO 30
 5000 'Save Lab Lists
 5005 SL=S
 5010 OPEN "O",1,"RLABS"
 5020 PRINT#1,L1;",";L2;",";SL
 5030 FOR Z=1 TO L2
 5040 PRINT#1,LT(Z);",";LB$(Z);",";
 5050 NEXT Z
 5080 FOR X = 1 TO SL
 5090 FOR Y = 1 TO L2
 5100 FOR Z = 0 TO 1
 5110 PRINT#1, LG(X,Y,Z)
 5120 NEXT Z:NEXT Y
 5140 NEXT X
 5150 CLOSE
 5160 GOTO 30
 5200 'Lab list input
 5210 OPEN"I",2,"RLABS"
 5220 IF EOF(2) THEN GOTO 5370
 5230 INPUT#2,L1,L2,SL
 5240 FOR Z = 1 TO L2
 5250 INPUT#2, LT(Z),LB$(Z)
 5260 NEXT Z
 5270 FOR X = 1 TO SL
 5290 FOR Y = 1 TO L2
 5300 FOR Z = 0 TO 1
 5310 INPUT#2, LG(X,Y,Z)
 5350 NEXT Z: NEXT Y
 5360 NEXT X
 5370 CLOSE
 5380 GOTO 30
 6000 CLS: FOR CHART = 1 TO 10
 6010 PRINT CHART;N$(CHART);TAB(25)CHART+10;N$(CHART+10);TAB(50)CHART+20;N$(CHART+20)
 6020 NEXT CHART
 6022 PRINT TAB(50)"31";N$(31)
 6025 VIEW PRINT 16 TO 23
 6030 RETURN
 6100 'deleting students from saved lists
 6110 PRINT"This is used to delete students from cover sheet lists already printed."
 6120 PRINT"You must have list loaded in memory and note the number of student to"
 6130 PRINT"be deleted before proceeding."
 6140 PRINT"Enter 0 for student number to return to the main menu."
 6150 INPUT"Student # to be deleted";N
 6160 IF N=0 THEN GOTO 30
 6170 FOR X=1 TO L2:LG(N,X,0)=0:LG(N,X,1)=0:NEXT X
 6180 FOR X1=N TO SL:FOR T=1 TO L2:FOR Z=0 TO 1:LG(X1,T,Z)=LG(X1+1,T,Z):NEXT Z:NEXT T:NEXT X1
 6190 GOTO 30
 7000 PRINT"You must have old lists loaded. Do You";:INPUT YP$
 7010 IF LEFT$(YP$,1)="y" THEN GOTO 7020 :ELSE GOTO 30
 7020 INPUT"What is the number of the student you want to add";ST
 7030 FOR X = SL TO ST STEP -1
 7040 FOR Y = 1 TO L2
 7050 FOR Z = 0 TO 1
 7060 LG(X,Y,Z)=LG(X-1,Y,Z)
 7070 NEXT Z
 7080 NEXT Y
 7090 NEXT X
 7100 FOR X = 1 TO L2: FOR Y = 0 TO 1: LG(ST,X,Y)=0:NEXT Y:NEXT X
 7110 GOTO 30
 8000 PRINT"*******You have an error#";ERR;"in line";ERL;"*****"
 8020 INPUT"Do you want to ignore and continue";YUP$
 8030 YUP$=LEFT$(YUP$,1)
 8040 IF YUP$="Y" OR YUP$="y" THEN GOTO 30 :ELSE END
 9900 B=3:LT$=RIGHT$(STR$(P1),1):MPL$=RIGHT$(STR$(M),1)
 9910 FI$="b:per"+LT$+".mp"+MPL$
 9920 LINE INPUT"Replace Student Data Disk with Marking Period Storage Disk. <ENTER> to Cont.";GOON$
 9930 GOSUB 995: B=0: FI$=" "
 9940 LINE INPUT"Put Student disk back in B:  <ENTER> to cont.";GOON$
 9950 RETURN
11400 ' Lab input routein
11405 GOSUB 805
11410 IF L1 = 0 THEN L1 = 1
11440 GOSUB 1270
11450 INPUT"How many labs";L
11460 L2 = L2 + L
11470 FOR X = L1 TO L2
11480 LOCATE 22,1:PRINT"Number for Lab";X;:LOCATE 22,20:INPUT LN(X)
11484 LOCATE 23,1:INPUT"Lab Time";LT(X)
11490 NEXT X
11500 FOR Y = L1 TO L2
11505 LN = LN(Y)
11510 LB$(Y)=QU$(LN(Y))
11520 NEXT Y
11530 FOR X = 1 TO S
11540 FOR Y = L1 TO L2
11545 LN = LN(Y)
11550 FOR Z = 0 TO 1
11560 LG(X,Y,Z)=N(X,LN,Z)
11570 NEXT Z
11580 NEXT Y
11590 NEXT X
11600 L1 = L1 + L
11605 INPUT"Do you want to input another marking period <0>-yes, <1>-no";V
11610 GOTO 30
11615 ' PRINTS LAB LISTS
11618 GOSUB 805
11620 FOR X = 1 TO S
11630 LPRINT " "
11640 LPRINT N$(X):LPRINT" "
11650 FOR Y = 1 TO L2
11660 LPRINT TAB(10) LB$(Y); TAB(40) LG(X,Y,0);"/";LG(X,Y,1);
11662 IF LG(X,Y,0) = 0 THEN LPRINT "Lab Time 0 min.": GOTO 11670
11664 LPRINT "Lab Time";LT(Y);"min."
11666 LTT = LTT + LT(Y)
11670 NEXT Y
11675 LPRINT" ": LPRINT"Total Lab Time";LTT
11680 LPRINT CHR$(12):LTT = 0
11685 LPRINT CHR$(27);CHR$(38);CHR$(108);CHR$(48);CHR$(72)
11690 NEXT X :GOTO 30
11695 ' PRINTS STORAGE SHEETS
11698 GOSUB 805
11700 INPUT"Name & Year";LAB$
11705 LPRINT TAB(25)"Examination Storage Sheet"
11710 LPRINT TAB(27)"Earth Science Regents":LPRINT TAB(25) LAB$
11720 INPUT"Name & Year";LAB$ :LPRINT TAB(25) LAB$
11730 LPRINT " ":LPRINT " ": LPRINT " "
11734 LPRINT TAB(25)" Marking Period Grades";:LPRINT TAB(51)"Class Avg.";:LPRINT TAB(62)"Regents";:LPRINT TAB(70)"Final"
11735 LPRINT TAB(62)"Grade";:LPRINT TAB(70)"Grade"
11740 FOR X = 1 TO S
11750 LPRINT N$(X) ; :TB = 21
11760 FOR AVG = 0 TO M-1
11765 IF AVG = 3 THEN GOTO 11774
11767 IF AVG = 4 THEN GOTO 11774
11770 MPG = MPG + G(X,AVG)
11772 GOTO 11780
11774 MPG = MPG + G(X,AVG)
11780 TB = TB + 4
11790 LPRINT TAB(TB) G(X,AVG);
11800 NEXT AVG
11810 LPRINT TAB(50)"|";
11820 MPG = MPG/4 : LPRINT TAB(51) MPG;
11830 LPRINT TAB(62)"|";
11840 LPRINT TAB(63) RTG(X);
11850 FOR GT = 0 TO 3: GDT = GDT + G(X,GT) : NEXT GT : CAV = GDT + RTG(X)
11860 CAV = CAV/5
11865 GDT = 0
11870 LPRINT TAB(70) "|";:LPRINT TAB(71) CAV
11880 FOR L = 1 TO 78 : LPRINT "-";:NEXT L:LPRINT "-"
11885 MPG = 0
11890 NEXT X
11892 LPRINT CHR$(27);CHR$(38);CHR$(108);CHR$(48);CHR$(72)
11895 END
11896 ' INPUTS REGENT EXAM GRADES
11899 GOSUB 805
11900 FOR X = 1 TO S
11910 PRINT"Regents Grade for ";N$(X);
11920 INPUT RTG(X)
11930 NEXT X
11940 GOTO 30