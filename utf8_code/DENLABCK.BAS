   10 COLOR 15,1:CLS
   20 PRINT"This is used to help score the Regents Density Lab"
   30 INPUT"Mass of metal cube";M1
   40 INPUT"Volume of metal cube";V1
   50 D1 = M1/V1
   60 PRINT "Density of cube is";D1
   70 INPUT"Mass of metal bar";M1
   80 INPUT"Volume of metal bar";V1
   90 D1 = M1/V1
  100 PRINT "Density of bar is";D1
  110 INPUT"Mass of Black marble";M1
  120 INPUT"Mass of Silver marble";M2
  130 INPUT"Mass of Quartz";M3
  140 INPUT"Water for Black marble";V1
  150 INPUT"Water for Silver marble";V2
  160 INPUT"Water for Quartz";V3
  170 INPUT"Water & Black marble";S1
  180 INPUT"Water & Silver marble";S2
  190 INPUT"Water & Quartz";S3
  200 V1 = S1 - V1
  210 V2 = S2 - V2
  220 V3 = S3 - V3
  230 D1 = M1/V1
  240 D2 = M2/V2
  250 D3 = M3/V3
  260 PRINT"Black marble volume =";V1;"and density =";D1
  270 PRINT"Silver marble volume =";V2;"and density =";D2
  280 PRINT"Quartz volume =";V3;"and density =";D3
  285 IF D3 > 2.26 THEN GOTO 295
  290 DD = 2.26 - D3 : GOTO 300
  295 DD = D3 - 2.26
  300 PE = DD/2.26
  310 PE = PE * 100
  320 PRINT " The Percent error is";PE;"%"
  330 INPUT"Do another <1-yes, 2-no>";Y
  340 IF Y = 2 THEN GOTO 360
  350 CLS:GOTO 30
  360 SYSTEM
  370 END