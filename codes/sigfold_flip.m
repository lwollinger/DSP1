% Troca os valores de posição mas não a função
function[y,n] = sigfold(x,n)
% implement y(n) = x(-n)
% A função flip ela não sabe meu deslocamento eu passo apenas x(n - 6), eu
% passo apenas "x" e o "n".
% [y,n] = sigfold(x,n);
y = fliplr(x);
n = -fliplr(n);
