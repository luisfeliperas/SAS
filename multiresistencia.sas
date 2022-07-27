data multi;
input prof $ MPa Ds Umi;
datalines;
0-2 0.8177 1.648 0.219
2-4 0.8177 1.743 0.216
4-6 0.8434 1.666 0.238
6-8 0.8995 1.674 0.220
8-10 0.9646 1.706 0.190
10-12 1.0124 1.652 0.208
12-14 1.0540 1.646 0.200
14-16 1.0109 1.664 0.201
16-18 1.0080 1.659 0.206
18-20 1.0461 1.633 0.187
20-22 1.0762 1.714 0.194
22-24 1.1393 1.601 0.198
24-26 1.2510 1.681 0.209
26-28 1.3092 1.741 0.214
;
proc print data=multi;
run;
ods graphics on;
proc corr data=multi;
var MPa Ds Umi;
run;
proc princomp data=multi out=prin plots=all;
var MPa Ds Umi;
id prof;
run;
proc print data=prin;
proc princomp data=multi cov out=prin plots=all;
var MPa Ds Umi;
id prof;
run;
proc cluster method=ward data=multi outtree=tree;
var MPa Ds Umi;
id prof;
run;
proc tree data=tree horizontal;
id prof;
run;
