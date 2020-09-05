data prova;
input adubacao diametro;
cards;
0 10
0 11
0 11
0 11
50 11
50 10
50 11
50 10
100 9
100 9
100 10
100 10
150 12
150 11
150 12
150 13
;
title "Prova";
proc print
 data= prova;
proc glm data= prova;
 class adubacao;
 model diametro = adubacao;
 means adubacao / tukey;
 means adubacao / tukey alpha=0.01;
 means adubacao / duncan;
 means adubacao / duncan alpha=0.01;
 means adubacao / dunnett;
 means adubacao / dunnett alpha=0.01;
 means adubacao / SCHEFFE; 
 means adubacao / SCHEFFE alpha=0.01;
 contrast 'A vs B_C_D' adubacao 3 -1 -1 -1;
 contrast 'A vs B_C' adubacao 2 -1 -1 0;
 contrast 'A vs C_D' adubacao 2 0 -1 -1;
proc corr;
 var adubacao diametro;
PROC REG;
 model diametro = adubacao;
 OUTPUT OUT= RESIDl P=PREVISTO R=RESIDO;
 title 'AJUSTE DA FUNCAO LINEAR';
proc plot;
 plot RESIDO* adubacao /VREF = 0;
 TITLE 'PLOT DE RESIDUOS P/ AJUSTE LINEAR';
PROC UNIVARIATE DATA= RESIDl NORMAL PLOT;
 var RESIDO;
 title "TESTE DE NORMALIDADE DOS RESIDUOS";
run;

