%% Sinusoide

n[0:10];
x = 3*cos(0.1*pi*n+pi/3)+2*sin(0.5*pi*n);
stem(x)

%% SEQUENCIA EXPONENCIAL

n = [0:10];
%x = exp((real+imag*j)*n);
x = exp((2+3*j)*n);
stem(x)

%% exercicio 1 usando impseq

% x(n)=2*(impulso(n+2)-(impulso(n-4)))  , -5<=n<=5

% [x,n] = impseq(n0,n1,n2)--> função impulso

n = [-5:5];
x = 2*impseq(-2,-5,5) - impseq(4,-5,5);
stem(n,x);
title('exercicio');
xlabel('n');
ylabel('x(n)');


%% Exercicio 2 

% x(n)=n[u(n)-u(n-10)]+10e^(0.3*(n-10)*[u(n-10)-u(n-20)]), 0<=n<=20
% multiplicação a ponto, ele vai de 0 a 20 (sempre botar)
n=[0:20];
x1 = n.*(stepseq(0,0,20)-stepseq(10,0,20));
x2 = 10*exp(-0.3*(n-10)).*(stepseq(10,0,20)-stepseq(20,0,20));
x = x1 + x2;
stem(n,x);
title('exercicio 2');
xlabel('n');
ylabel('x(n)');

%% Exercicio 3

% rand -> valor randomico

n = [0:50];
x = cos(0.04*pi*n)+0.2*randn(size(n));
stem(n,x);
title('exercicio 3');
xlabel('n');
ylabel('x(n)');


%% Ones(1,5), vetor de 5 elementos com valor 1
%  se eu pegar e transpor ans' ele vira coluna

% exercicio, sequencia de numeros

n = [-10:9];
x = [5,4,3,2,1];
xtilde = x' * ones(1,4);
xtilde = (xtilde(:))';
% xtilde = (xtilde(:))' - para visualizar sem ser em gráfico
stem(n,xtilde);
title('Sequencia Problema 4');
xlabel('n');
ylabel('xtilde(n)');

%% exercicio 2.2 
% a) x1(n) = 2x(n − 5) − 3x(n + 4);

n = -2:10;                      
x = [1:7,6:-1:1]; % escreve 1234567654321                 
[x11,n11] = sigshift(x,n,5);
[x12,n12] = sigshift(x,n,-4);
[x1,n1] = sigadd(2*x11,n11,-3*x12,n12);
stem(n1,x1);
title('Sequencia problema 2.2a');
xlabel('n');
ylabel('x1(n)');

%% Exercicio b) x2(n) = x(3 − n) + x(n) x(n − 2);
% O primeiro termo pode ser escrito como x(−(n − 3)). Portanto, ele é obtido primeiro
% dobrando x(n) e depois deslocando o resultado em 3.
% A segunda parte é uma multiplicação de x(n) e x(n−2), ambos com o mesmo
% comprimento, mas suporte diferente (ou posições de amostra).
%

[x21,n21] = sigfold_flip(x,n);        
[x21,n21] = sigshift(x21,n21,3);
[x22,n22] = sigshift(x,n,2);
[x22,n22] = sigmult(x,n,x22,n22);
[x2,n2] = sigadd(x21,n21,x22,n22);
stem(n2,x2);
title('Sequencia problema 2.2b');
xlabel('n');
ylabel('x2(n)');

%% Exercicio 3.3) x(n) = e(−0,1+j0,3)n , −10 ≤ n ≤ 10

n = [-10:1:10]; alpha = -0.1+0.3j;
x = exp(alpha*n);
subplot(2,2,1); stem(n,real(x)); title('real part'); xlabel('n');
subplot(2,2,2); stem(n,imag(x)); title('imaginary part');xlabel('n');
subplot(2,2,3); stem(n,abs(x)); title('magnitude part');xlabel('n');
subplot(2,2,4); stem(n,(180/pi)*angle(x)); title('phase part'); xlabel('n');