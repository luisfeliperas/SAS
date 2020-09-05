data acova;
input calcario $ bloco $ producao pHsolo;
cards;
CI BI 100 5.1
CI BII 101 5.1
CI BIII 105 5.0
CI BIV 103 5.2
CII BI 130 5.7
CII BII 134 5.8
CII BIII 135 5.7
CII BIV 133 5.6
CIII BI 150 6.1
CIII BII 150 6.1
CIII BIII 155 6.3
CIII BIV 153 6.2
CIV BI 140 6.9
CIV BII 141 6.9
CIV BIII 145 7.0
CIV BIV 143 7.2
;
proc glm data= acova;
class calcario bloco;
means producao= calcario bloco pHsolo;
lsmeans calcario / adjust=tukey pdiff;
run;