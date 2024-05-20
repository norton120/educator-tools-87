   10 CLS
   20 PRINT" This is for calculating various items needed for Regents Earth"
   30 PRINT " Circumference lab."
   40 INPUT" What is the accepted value of the globe";AG
   50 INPUT" Calculate: 1-circum. , 2-mean, 3-diam, 4-% error, 5-vol., 6-surf area, 7-quit";Y
   60 ON Y GOTO 70, 140, 190, 250, 340, 460, 600
   70 INPUT"Distance";D
   80 INPUT"Angle";A
   90 C = (360 * D)/A
  100 PRINT "Circumference =";C
  110 INPUT"Another ( y or n)";H$
  120 IF H$ = "y" THEN GOTO 70
  130 CLS: GOTO 50
  140 INPUT"First value";O
  150 INPUT"Second value";T
  160 INPUT"Third value";TH
  170 M = (O + T + TH)/3
  180 PRINT "mean =";M
  185 INPUT"Ready";H$
  186 CLS:GOTO 50
  190 INPUT "Circumference";C
  200 D = C/3.14
  210 R = D/2
  220 PRINT " Diameter =";D;" radius =";R
  230 INPUT"Ready";H$
  240 CLS:GOTO 50
  250 INPUT"Calculated Circum.";C
  260 IF C > AG THEN GOTO 280
  270 IF C < AG THEN GOTO 290
  280 C1 = C - AG : GOTO 300
  290 C1 = AG - C
  300 E = (C1/AG) * 100
  310 PRINT" % error ="; E
  320 INPUT "Ready";H$
  330 CLS: GOTO 50
  340 INPUT"From (R)adius or (C)ircumference";W$
  350 IF W$ = "r" OR W$ ="R" THEN GOTO 400
  360 INPUT"Circ.";C
  370 R = (C/3.14)/2
  380 GOTO 410
  400 INPUT"Radius";R
  410 R3 = (R*R)*R
  420 V = (4*3.14*R3)/3
  430 PRINT" Volume =";V
  440 INPUT"Ready";H$
  450 CLS:GOTO 50
  460 INPUT"From (R)adius or (C)ircumference or (D)iameter";W$
  470 IF W$ = "r" OR W$ ="R" THEN GOTO 510
  475 IF W$ = "d" OR W$ = "D" THEN GOTO 540
  480 INPUT"Circ.";C
  490 R = (C/3.14)/2
  500 GOTO 520
  510 INPUT"Radius";R
  520 D = R * 2
  530 GOTO 550
  540 INPUT"Diameter";D
  550 D2 = D*D
  560 SA = 3.14 * D2
  570 PRINT"Surface Area =";SA
  580 INPUT"Ready";H$
  590 CLS: GOTO 50
  600 END