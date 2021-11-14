%% Implementação da convolução no domínio do tempo
% Aluno: Pedro Henrique Garcia - R.A. 1829696
%
% Função pro cálculo da convolução no domínio do tempo

%% Inicialização
clc; clear;

Lx=randi(1000); % tamanho do sinal, inteiro aleatorio
Lh=randi(1000); % tamanho da resposta ao impulso, inteiro aleatorio
x = randn(Lx,1); % geramos um sinal aleatório de tamanho Lx
h = randn(Lh,1); % geramos uma resposta ao impulso de tamanho Lh

%% Testes da função de convolução
% testamos o tempo de execução da função craida com a função de convolução
% do matlab
tic; y_conv= conv(x,h); toc
tic; y_phg = phg_conv(x,h);toc
%% Código da função de convolução 
% A função convolução recebe dois vetores, e realiza a convolução discreta
% entre eles através de produtos escalares.
%
% Os vetores de entrada podem ser linhas ou colunas, a função retorna um
% vetor linha

%function  y = phg_conv(x,h)

% Aqui determinamos o tamanho de cada vetor de entrada
Lx = numel(x);
Lh = numel(h);

% como o produto escalar só pode ser feitos com vetores com o mesmo número
% de elementos, preenchemos o final dos vetores de entrada com zeros
x(Lh+Lx-1)=0;
h(Lh+Lx-1)=0;

% Esta parte do código garante que os vetores de entrada estarão no formato
% exigido para a multiplicação de matrizes, para fazer o produto escalar.
% Para fazer h*x como produto escalar, h() precisa ser linha e x() coluna
if (isrow(h) == 1)
    h = transpose(h);
end
if (iscolumn(x) == 1)
    x = transpose(x);
end

% realiza o produto escalar de h[-k]*x[k]; h[-k] é reverso no tempo.
% O n-ésimo elemento do vetor da convolução é o produto escalar dos
% primeiros n-ésimos elementos do vetor h[k], reversos no tempo,
% com os primeiros n-ésimos elementos do vetor x[k]
for n=1:Lx+Lh-1
        y(n)=x(1:n)*h(n:-1:1);
end

%% Comparando os algoritmos
% Verifica-se através deste gráfico, que a diferença entre as duas funções
% de convolução é da ordem de 10E-10, ou seja, é insignificante.
figure
plot(y_phg)
xlabel("Tempo")
ylabel("Intensidade")
title("Implementação da Convolução")

figure
plot(y_conv)
xlabel("Tempo")
ylabel("Intensidade")
title("Convoluçao nativa do matlab")

figure
stem(abs(y_phg - y_conv))
title('Erro')

% podemos ver também o maior valor entre as diferenças - o erro - que é de
% ordem insignificante.
max(abs(y_phg-y_conv))