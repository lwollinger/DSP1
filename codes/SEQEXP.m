%    sEQUENCIA EXPONENCIAL DE VALOR REAL

%    Discrete sequence or "stem" plot.
%    stem(Y) plots the data sequence Y as stems from the x axis
%    terminated with circles for the data value. If Y is a matrix then
%    each column is plotted as a separate series.

function [x,n] = SEQEXP(n1, n2, A)
% n é o range.
% A é amplitude

n = [n1:n2];
x = (A).^n;
stem(x)