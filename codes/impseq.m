%% Como fazer o impulso unit�rio Com deslocamento 

function [x,n] = impseq(n0,n1,n2) % eu entro com n0, n1 ,n2 e retorna a fun��o[x,n], x -> amplitude, n -> valores no eixo x("tempo"). 
% n1 valor inicial 
% n2 Valor final
% no � o valor deslocado
% generates x(n) = delta(n - no); n1 <= n <= n2
n = [n1:n2];
x = [(n-n0) == 0];

% Como rodar o c�digo
%[x,n] = impseq(n0, n1, n2)
% == � (igual), = � recebe