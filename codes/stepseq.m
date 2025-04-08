% Step Unitário
function [x,n] = stepseq(n0,n1,n2)
% n1 valor inicial 
% n2 Valor final
% generates x(n) = delta(n - no); n1 <= n <= n2
% n é o valor onde ele vai andar para determinar o inicio do valor "1".
n = [n1:n2];
x = [(n-n0) >= 0];