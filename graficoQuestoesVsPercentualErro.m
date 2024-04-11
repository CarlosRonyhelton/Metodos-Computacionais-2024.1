clear; clc;
dados = xlsread('resultados1Av.xlsx') % planilhas do excel
% dados = load('resultados1Av.txt') % arquivo de texto txt

questoes = dados(:,1);
percentualErro = dados(:,4)

bar(questoes, percentualErro)
ylabel('% Erro')
xlabel('Questões')
title('% Erro vs Questões')
grid