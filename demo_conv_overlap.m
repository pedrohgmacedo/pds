%% Demonstração do método overlap-add para calcular a convolução
% Aluno: Pedro Henrique Garcia - R.A. 1829696
%% Inicialização dos vetores
close all; clc; clear;

% vetor x
x = rand(1E5,1);
% resposta ao impulso
h = randn(42,1);
% numero de elementos em um bloco
k = 50;
%% Função para cálculo da convolução através do método overlap-add

% function y=phg_overlap_conv(x,h,k)
% calcula a convolução através do método overlap-add
% x e h são 2 vetores de qualquer forma, e k é o número de elementos em
% cada bloco, retorna vetor coluna

% Overlap-add é uma forma eficiente para calcular a convolução discreta de
% um sinal x longo com uma resposta ao impulso finita; 
% dividindo-se o sinal em blocos de tamanho apropriado, podemos calcular
% sua convolução discreta com apenas um pequeno delay.
% sobre: https://en.wikipedia.org/wiki/Overlap%E2%80%93add_method

% se alguns dos argumentos possuir apenas 1 elementos, a convolução é o
% produto escalar entre eles.
if min([numel(x) numel(h) k]) == 1
    y = phg_conv(x,h);
    return
end

% x precisa ser inteiramente dividido em blocos de k elementos, por isso
% adicionamos k zeros ao final de x
x(numel(x)+k)=0;

% L é o tamanho de x, com zeros adicionados, M é o tamanho de y
M = numel(h);
L = numel(x);

% protege contra vetores linha, pois y e x precisam ser colunas
if (isrow(x)==1)
    x = transpose(x);
end
if (isrow(h) == 1)
    h = transpose(h);
end

% pré-aloca y_aux, que é a matrix com as convoluções deslocadas
y = zeros(L+M-1);

% calcula uma matriz que é a convolução entre h, e os pedaçoes do vetor x,
% de tamanho k
for n = 1:floor(L/k)
    y = y + [zeros((n-1)*k,1); phg_conv( x(1+(n-1)*k:n*k), h ); zeros(L-n*k,1)];
end

% pré aloca y, que é a convolução
% y = zeros( L+M-1,1 );

% % soma todas as colunas da matriz y_aux
% for n = 1:floor(L/k)
%     y = y+y_aux(:,n);
% end

y=y(1:L+M-k-1);
%% Testes das funções

% Mostra o tempo de execução da função nativa
tic; y_conv = conv(x,h); toc
%Mostra o tempo de execução da função escrita
tic; y_phg_overlap = phg_overlap_conv(x,h,k); toc

% Verifica-se através dos gráficos que a diferença entre as duas funções
% de convolução é da ordem maior que aprox 1E-10, ou seja, é insignificante.
figure
plot(y_phg_overlap)
xlabel("Tempo")
ylabel("Intensidade")
title("Implementação da Convolução método Overlap-Add")

figure
plot(y_conv)
xlabel("Tempo")
ylabel("Intensidade")
title("Convoluçao nativa do matlab")

figure
stem(abs(y_phg_overlap - y_conv))
title('Erro')

% podemos ver também o maior valor entre as diferenças que é de
% ordem insignificante.
max(abs(y_phg_overlap-y_conv))