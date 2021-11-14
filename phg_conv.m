% a função convolução recebe dois vetores, e realiza a convolução discreta
% entre eles através de produtos escalares
% os vetores de entrada podem ser linhas ou colunas, a função retorna um
% vetor linha

function  y = phg_conv(x,h)

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
y = transpose(y);