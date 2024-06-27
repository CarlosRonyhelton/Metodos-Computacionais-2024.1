clc; clear;

carro = struct();
fprintf('Digite os parâmetros separados por vírgula (Ex.: Fabricante, Ano, Preco): \n')
texto = input(' ','s');
campos = strsplit(texto, ', ');

for cont = 1:length(campos)
    carro.(campos{cont}) = [];
end

n = input('Número de carros que você deseja cadastrar: ');

for aux = 1:n
    for cont = 1:length(campos)
        if strcmpi(campos{cont}, 'Preco') || strcmpi(campos{cont}, 'Precos')
            menorPreco = input('Menor Preco: ');
            maiorPreco = input('Maior Preco: ');
            carro(aux).(campos{cont}) = [menorPreco maiorPreco];
        else
            carro(aux).(campos{cont}) = input([campos{cont} ': '],'s');
        end
        
    end
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