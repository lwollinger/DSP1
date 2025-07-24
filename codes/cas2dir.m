function [b,a] = cas2dir(b0,B,A);
% cas2dir: Converte os coeficientes de um filtro da **forma em cascata** para a **forma direta**.
%
% Este código pega as seções de segunda ordem (biquadráticas) de um filtro
% (representadas pelas matrizes B e A) e as combina para obter os
% coeficientes do polinômio do numerador e do denominador na forma direta.
% O ganho global 'b0' também é aplicado ao numerador.
%
% Sintaxe:
%   [b,a] = cas2dir(b0,B,A)
%
% Entradas:
%   b0 = Coeficiente de ganho global da forma em cascata.
%   B  = Matriz K por 3 de coeficientes reais que contêm os bk's (numeradores)
%        de cada uma das K seções de segunda ordem. Cada linha de B é [b0 b1 b2].
%   A  = Matriz K por 3 de coeficientes reais que contêm os ak's (denominadores)
%        de cada uma das K seções de segunda ordem. Cada linha de A é [a0 a1 a2].
%
% Saídas:
%   b = Coeficientes do polinômio do numerador na forma direta.
%   a = Coeficientes do polinômio do denominador na forma direta.

% Obtém o número de seções de segunda ordem (K) a partir das dimensões da matriz B.
[K,L] = size(B);

% Inicializa os polinômios do numerador (b) e do denominador (a) com 1.
% Isso serve como um elemento neutro para a convolução, garantindo que
% a primeira seção seja corretamente combinada.
b = [1];
a = [1];

% Itera por cada seção de segunda ordem (de 1 a K).
for i=1:1:K
    % Realiza a convolução dos coeficientes do numerador.
    % A função 'conv' realiza a multiplicação de polinômios. Aqui,
    % ela combina os coeficientes do numerador atual ('b') com os
    % coeficientes do numerador da i-ésima seção (B(i,:)).
    b=conv(b,B(i,:));

    % Realiza a convolução dos coeficientes do denominador.
    % Similarmente, combina os coeficientes do denominador atual ('a')
    % com os coeficientes do denominador da i-ésima seção (A(i,:)).
    a=conv(a,A(i,:));
end

% Aplica o coeficiente de ganho global 'b0' ao polinômio do numerador resultante.
b = b*b0;