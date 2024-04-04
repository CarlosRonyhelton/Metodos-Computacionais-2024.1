clear; clc;

a = input('Digite o valor de a: ');
b = input('Digite o valor de b: ');
c = input('Digite o valor de c: ');

delta = b^2-4*a*c;

if delta > 0
    x1 = (-b + sqrt(delta))/2*a;
    x2 = (-b - sqrt(delta))/2*a;
    fprintf('Raizes calculadas: \nx1 = %.2f\nx2 = %.2f',x1,x2)
elseif delta == 0
    x1 = (-b + sqrt(delta))/2*a;
    fprintf('Raizes calculadas: \nx1 = %.2f\nx2 = %.2f',x1,x1)
else
    disp('Não há raízes reais!')
end



