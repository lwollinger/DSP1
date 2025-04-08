%% Como fazer o impulso unitário Com deslocamento 

function [x,n] = impseq(n0,n1,n2) % eu entro com n0, n1 ,n2 e retorna a função[x,n], x -> amplitude, n -> valores no eixo x("tempo"). 
% n1 valor inicial 
% n2 Valor final
% no é o valor deslocado
% generates x(n) = delta(n - no); n1 <= n <= n2
n = [n1:n2];
x = [(n-n0) == 0];

% Como rodar o código
%[x,n] = impseq(n0, n1, n2)
% == é (igual), = é recebe