clc; clear;
n = input('Número de carros que você deseja cadastrar: ');
% carro = {'Fabricante','';'Modelo', ''; 'Ano', 0; 'Preco',[]};
carro = cell(n,4);
carro{1,1} = 'Fabricante';
carro{1,2} = 'Modelo';
carro{1,3} = 'Ano';
carro{1,4} = 'Preco';
for cont = 1:n
    carro{cont + 1,1} = input('Fabricante: ','s');
    carro{cont + 1,2} = input('Modelo: ','s');
    carro{cont + 1,3} = input('Ano: ','s');
    menorPreco = input('Menor Preço: ');
    maiorPreco = input('Maior Preço: ');
    carro{cont + 1,4} = [menorPreco maiorPreco];
end
disp(carro)

% Define o nome do arquivo Excel
nomeArquivo = 'dados.xlsx';

% Exporta os dados para a planilha
xlswrite(nomeArquivo, carro);

% Exibe uma mensagem de confirmação
disp('Dados exportados com sucesso para dados.xlsx');

