%% Deslocamento:
% Nesta operação cada amostra de x(n) é deslocado por uma quantidade k para
% obter uma sequencia deslocada de y(n) = [x(n-k)]

function [y,n] = sigshift(x,m,k)
% implements y(n) = x(x-k)
% ------------------------
% [y,x] = sigshift(x,m,k)
n = m+k;
y = x;