clear; clc;
dadosEnsaioTracao = xlsread('dadosEnsaioTracao.xlsx');
F = dadosEnsaioTracao(:,1);
dl = dadosEnsaioTracao(:,2);
do = 0.0127;
A = (pi*do.^2)/4;
vetorTensao = F./A;
lo = 0.0508;
e = dl./lo;
plot(e,vetorTensao)
