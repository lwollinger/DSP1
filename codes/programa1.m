% Aprendendo a mexer no MATLAB
% Caso necess�rio ajuda, digitar help "nome_fun��o"


%% Como fazer o impulso unit�rio
% zeros(1,N); sem delocamento

zeros(1,10);

%% Como fazer o impulso unit�rio Com deslocamento 

function [x,n] = impseq(n0, n1, n2)
% n1 valor inicial 
% n2 Valor final
n = [n1:n2];
x = [(n-n0) == 0]

%% Plotar gr�fico
% plot(x)
% plot(x, 'o') --> Plota discretizado

%% clear all --> (Limpa vari�veis)
% clc --> (limpa tudo)
