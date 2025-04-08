%    sEQUENCIA EXPONENCIAL DE VALOR Complexo

%    Discrete sequence or "stem" plot.
%    stem(Y) plots the data sequence Y as stems from the x axis
%    terminated with circles for the data value. If Y is a matrix then
%    each column is plotted as a separate series.

function [x,n] = SEQEXPCOMPLEX(n1, n2, real, imag)
% n é o range.

n = [n1:n2];
x = exp((real+imag*j)*n);
stem(x)