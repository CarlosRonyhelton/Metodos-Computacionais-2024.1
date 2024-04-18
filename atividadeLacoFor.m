clear; clc;
dados = xlsread('resultados1Av.xlsx');
percentual = dados(:,4);
tam = size(percentual);
resp = percentual(2);
posicao = 2;
for cont = 1:tam(1)
    if percentual(cont) < resp
        resp = percentual(cont);
        posicao = cont;
    end
end
fprintf('O menor percentual de acerto é %.2f%% e é respectivo a %dª questão', resp, posicao)