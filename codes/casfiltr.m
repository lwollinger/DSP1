function y = casfiltr(b0,B,A,x);
% casfiltr: Realiza a filtragem de uma sequência de entrada 'x' usando uma estrutura em cascata de filtros IIR ou FIR.
%
% Este código implementa a filtragem em cascata, onde um filtro de ordem superior
% é decomposto em uma série de seções de segunda ordem (biquadráticas).
% Isso é frequentemente feito para melhorar a estabilidade numérica e a precisão
% da filtragem, especialmente para filtros de alta ordem.
%
% Sintaxe:
%   y = casfiltr(b0,B,A,x);
%
% Entradas:
%   b0 = Coeficiente de ganho global da forma em cascata.
%   B  = Matriz K por 3 de coeficientes reais que representam os numeradores (bk's)
%        de cada uma das K seções de segunda ordem. Cada linha de B corresponde
%        aos coeficientes [b0 b1 b2] de uma seção.
%   A  = Matriz K por 3 de coeficientes reais que representam os denominadores (ak's)
%        de cada uma das K seções de segunda ordem. Cada linha de A corresponde
%        aos coeficientes [a0 a1 a2] de uma seção.
%   x  = Sequência de entrada a ser filtrada.
%
% Saída:
%   y  = Sequência de saída filtrada.

% Obtém as dimensões da matriz B. K é o número de seções de segunda ordem.
[K,L] = size(B);

% Obtém o comprimento da sequência de entrada.
N = length(x);

% Inicializa a matriz 'w' que armazenará as saídas intermediárias de cada seção.
% A primeira linha de 'w' é a sequência de entrada 'x'.
% Terá K+1 linhas (uma para a entrada e uma para a saída de cada uma das K seções)
% e N colunas (correspondendo ao comprimento da sequência de entrada).
w = zeros(K+1,N);
w(1,:) = x;

% Loop para processar cada seção de segunda ordem em cascata.
for i = 1:1:K
    % Aplica o filtro da i-ésima seção.
    % filter(B(i,:), A(i,:), w(i,:)) aplica o filtro definido pelos coeficientes
    % da i-ésima linha de B (numerador) e da i-ésima linha de A (denominador)
    % à saída da seção anterior (w(i,:)).
    % A saída desta seção é armazenada na próxima linha de 'w'.
    w(i+1,:) = filter(B(i,:),A(i,:),w(i,:));
end

% A saída final 'y' é a saída da última seção (w(K+1,:)) multiplicada pelo
% coeficiente de ganho global b0.
y = b0*w(K+1,:);