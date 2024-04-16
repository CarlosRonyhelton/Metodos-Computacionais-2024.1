clear; clc;
fprintf('Menu: \n1 - °C --> °F: \n2 - °F --> °C: \n3 - °C --> K: \n')
valor = 1;
opcao = input('Digite uma opção: ');
switch opcao
    case 1
        Tc = input('Digite Tc: ');
        T = (9*Tc/5) + 32;
        unidade = '°F';
    case 2
        Tf = input('Digite Tf: ');
        T = 5*(Tf - 32)/9;
        unidade = '°C';
    case 3
        Tc = input('Digite Tc: ');
        T = Tc + 273;
        unidade = 'K';
    otherwise
        disp('Opção inválida!')
        valor = 0;
end
if valor
   fprintf('Temp = %.2f %s',T, unidade)
end

