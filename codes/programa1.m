% Aprendendo a mexer no MATLAB
% Caso necessário ajuda, digitar help "nome_função"


%% Como fazer o impulso unitário
% zeros(1,N); sem delocamento

zeros(1,10);

%% Como fazer o impulso unitário Com deslocamento 

function [x,n] = impseq(n0, n1, n2)
% n1 valor inicial 
% n2 Valor final
n = [n1:n2];
x = [(n-n0) == 0]

%% Plotar gráfico
% plot(x)
% plot(x, 'o') --> Plota discretizado

%% clear all --> (Limpa variáveis)
% clc --> (limpa tudo)
