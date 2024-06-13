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