clear; clc;
dadosEnsaioTracao = xlsread('dadosEnsaioTracao.xlsx');
F = dadosEnsaioTracao(:,1);
dl = dadosEnsaioTracao(:,2);
A = (pi*dl.^2)/4;
vetorTensao = F./A;
lo = 0.0508;
e = dl/lo;
plot(e,vetorTensao)
% axis([0 2 0 5000])
