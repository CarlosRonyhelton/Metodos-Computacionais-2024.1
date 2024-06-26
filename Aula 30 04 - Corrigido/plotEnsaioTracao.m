clear; clc;
dadosEnsaioTracao = xlsread('dadosEnsaioTracao.xlsx');
F = dadosEnsaioTracao(:,1);
dl = dadosEnsaioTracao(:,2);
lo = 0.0508;
do = 0.0127;
A = (pi*do^2)/4;
vetorTensao = F./A;
limRT = max(vetorTensao);
e = dl/lo;

limElast = 0;

limiteElasticidade(1) = 0;
tamanho = size(vetorTensao);
for cont = 2:tamanho(1)
    limiteElasticidade(cont) = vetorTensao(cont)./e(cont);
    if limiteElasticidade(cont) ~= vetorTensao(2)/e(2)
        limElast = limiteElasticidade(cont-1);
        break;
    end
end

subplot(2,1,1)
plot(e,vetorTensao)
xlabel('e [m]')
ylabel('Tensão [Pa]')
hold on
plot(e(vetorTensao == limRT),limRT, 'ro', 'MarkerSize', 10)
text(e(vetorTensao == limRT),limRT-40000, 'Lim. de Resistência a Tração')
hold off


subplot(2,1,2)
plot(e,vetorTensao)
axis([0 20 0 500000])
xlabel('e [m]')
ylabel('Tensão [Pa]')
hold on
plot(e(vetorTensao == limRT),limRT, 'ro', 'MarkerSize', 10)
hold off