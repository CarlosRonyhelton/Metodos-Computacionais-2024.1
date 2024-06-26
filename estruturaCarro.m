clc; clear;
n = input('Número de carros que você deseja cadastrar: ')
carro = struct('Fabricante','','Modelo', '', 'Ano', 0, 'Preco',[]);
for cont = 1:n
    carro(cont).Fabricante = input('Fabricante: ','s');
    carro(cont).Modelo = input('Modelo: ','s');
    carro(cont).Ano = input('Ano: ','s');
    menorPreco = input('Menor Preço: ');
    maiorPreco = input('Maior Preço: ');
    carro(cont).Preco = [menorPreco maiorPreco];
end
disp(carro)

% Converte a struct em uma tabela
dataTable = struct2table(carro);

% Define o nome do arquivo Excel
nomeArquivo = 'dados2.xlsx';

% Exporta a tabela para a planilha
writetable(dataTable, nomeArquivo);

% Exibe uma mensagem de confirmação
disp('Dados exportados com sucesso para dados.xlsx');