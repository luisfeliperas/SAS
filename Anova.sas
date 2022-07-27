data solos;
	input profundidade $ sistema $ MPa;
	cards;
PI M 4.68
PI M 3.72
PI M 3.38
PI M 3.38
PII M 4.68
PII M 3.72
PII M 3.38
PII M 3.38
PIII M 4.68
PIII M 4.68
PIII M 4.68
PIII M 4.68
PIV M 3.72
PIV M 3.72
PIV M 3.72
PIV M 3.72
PV M 3.38
PV M 3.38
PV M 3.38
PV M 3.38
PVI M 3.38
PVI M 3.38
PVI M 3.38
PVI M 3.38
PVII M 6.42
PVII M 2.03
PVII M 7.94
PVII M 6.42
PVIII M 6.42
PVIII M 2.03
PVIII M 7.94
PVIII M 10.47
PIX M 10.47
PIX M 2.03
PIX M 7.94
PIX M 6.42
PX M 6.42
PX M 2.03
PX M 6.42
PX M 6.42
PI P 7.94
PI P 7.94
PI P 7.94
PI P 10.47
PII P 6.42
PII P 7.94
PII P 7.94
PII P 6.42
PIII P 7.94
PIII P 6.42
PIII P 7.94
PIII P 5.41
PIV P 5.41
PIV P 5.41
PIV P 6.42
PIV P 6.42
PV P 4.68
PV P 6.42
PV P 5.41
PV P 6.42
PVI P 3.72
PVI P 6.42
PVI P 5.41
PVI P 6.42
PVII P 3.72
PVII P 7.94
PVII P 5.41
PVII P 6.42
PVIII P 4.14
PVIII P 5.41
PVIII P 5.41
PVIII P 5.41
PIX P 4.14
PIX P 5.41
PIX P 5.41
PIX P 4.68
PX P 6.42
PX P 6.42
PX P 6.42
PX P 4.68
;

proc print data=solos;
run;

proc glm;
	class profundidade sistema;
	model MPa=profundidade|sistema/ss3;
	output out=Residl p=previsto r=residuo;
	means profundidade/tukey;
	means sistema/tukey;
	lsmeans sistema*profundidade/ adjust=tukey slice=sistema slice=profundidade 
		pdiff=all;
	run;

proc univariate data=Residl normal plot;
	var residuo;
run;
