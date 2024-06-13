clear; clc;
%Entradas
fun = input('Digite a função: ','s');
funSymb = str2sym(fun);
erro = input('Digite o erro tolerado: ');
limIte = input('Digite o limite de iterações: ');

while (1)
    %Entradas
    a = input('Digite o limite inferior: ');
    b = input('Digite o limite superior: ');
    
    % Processamento
    Ima_a = subs(funSymb, a)
    Ima_b = subs(funSymb, b)
    if Ima_a == 0
        fprintf('Raiz = %.10f', a)
        break;
    elseif Ima_b == 0
        fprintf('Raiz = %.10f', b)
        break;
    else
        if Ima_a * Ima_b < 0
            M = (a+b)/2;
            Ima_M = subs(funSymb, M);
            if Ima_M == 0 || abs(b-a) < erro
                fprintf('Raiz = %.10f', M)
            end
            break;
        end
    end
end

for cont = 1:limIte
    if Ima_a * Ima_M < 0
        b = M;
    else
        a = M;
    end
    M = (a+b)/2;
    Ima_M = subs(funSymb, M);
    if Ima_M == 0 || abs(b-a) < erro
       fprintf('Raiz = %.10f\n', M)
    end
end



