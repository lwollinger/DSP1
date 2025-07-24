function [b0,B,A] = dir2cas(b,a);
% Conversão da forma DIRETA para a forma em CASCATA (versão cplxpair)
% -------------------------------------------------------------------
% [b0,B,A] = dir2cas(b,a)
% b0 = coeficiente de ganho
% B = matriz K por 3 de coeficientes reais contendo os bk's (numeradores das seções)
% A = matriz K por 3 de coeficientes reais contendo os ak's (denominadores das seções)
% b = coeficientes do polinômio do numerador da forma DIRETA
% a = coeficientes do polinômio do denominador da forma DIRETA

% Calcula o coeficiente de ganho b0
b0 = b(1); % O primeiro coeficiente de 'b' é o ganho inicial
b = b/b0;  % Normaliza o numerador
a0 = a(1); % O primeiro coeficiente de 'a' é o ganho do denominador
a = a/a0;  % Normaliza o denominador
b0 = b0/a0;% O ganho final é a razão dos ganhos iniciais

% Obtém os comprimentos dos vetores de coeficientes
M = length(b); % Comprimento do numerador
N = length(a); % Comprimento do denominador

% Zera os vetores para que tenham o mesmo comprimento
if N > M
    b = [b zeros(1,N-M)]; % Adiciona zeros ao final de 'b' se 'a' for mais longo
elseif M > N
    a = [a zeros(1,M-N)]; % Adiciona zeros ao final de 'a' se 'b' for mais longo
    N = M;                % Atualiza o comprimento de 'N' para corresponder a 'M'
end

% Inicializa as matrizes B e A para armazenar os coeficientes das seções
K = floor(N/2); % Calcula o número de seções de segunda ordem (metade do comprimento)
B = zeros(K,3); % Matriz para os numeradores das seções (K linhas, 3 colunas)
A = zeros(K,3); % Matriz para os denominadores das seções (K linhas, 3 colunas)

% Se o número de coeficientes for ímpar, adiciona um zero para garantir que todos os pares sejam processados
if K*2 == N;
    b = [b 0]; % Adiciona um zero ao final de 'b' se 'N' for par, para formar um par com um zero extra
    a = [a 0]; % Adiciona um zero ao final de 'a' se 'N' for par
end

% Calcula as raízes dos polinômios e as organiza em pares conjugados complexos
broots = cplxpair(roots(b)); % Raízes do numerador, emparelhadas
aroots = cplxpair(roots(a)); % Raízes do denominador, emparelhadas

% Itera para construir as seções de segunda ordem
for i=1:2:2*K % Loop de 2 em 2 para pegar pares de raízes
    % Processa o numerador (B)
    Brow = broots(i:1:i+1,:); % Seleciona um par de raízes do numerador
    Brow = real(poly(Brow));  % Converte o par de raízes de volta para coeficientes de polinômio reais
    B(fix((i+1)/2),:) = Brow; % Armazena os coeficientes na matriz B

    % Processa o denominador (A)
    Arow = aroots(i:1:i+1,:); % Seleciona um par de raízes do denominador
    Arow = real(poly(Arow));  % Converte o par de raízes de volta para coeficientes de polinômio reais
    A(fix((i+1)/2),:) = Arow; % Armazena os coeficientes na matriz A
end