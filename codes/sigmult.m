function [y,n] = sigmult(x1,n1,x2,n2)
% 
% y = product sequence over n, with includes n1 and n2
% x1 = first sequence over n1 
% x2 = second sequence over n2 (n2 can be different from n1)
% length(Linhas, Colunas) -> preciso saber o valor das quantidades de
% colunar ou linha que eu vou escrever da matriz.



n = min(min(n1),min(n2)):max(max(n1),max(n2));  % acha o intervalo menor e maior
y1 = zeros(1,length(n));    % cria um vetor de zeros com o tamanho de amostras
y2 = y1;
y1 (find((n>=min(n1))&(n<=max(n1))==1))=x1;
y2 (find((n>=min(n2))&(n<=max(n2))==1))=x2;

y = y1 .* y2;