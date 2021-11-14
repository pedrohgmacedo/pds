function y=native_overlap_conv(x,h,k)
% ver phg_overlap_conv
% implementa overlap-add, mas chama a função conv ao invés de phg_conv
if min([numel(x) numel(h) k]) == 1
    y = conv(x,h);
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
y = zeros(L+M-1,1);

% calcula uma matriz que é a convolução entre h, e os pedaçoes do vetor x,
% de tamanho k
for n =1:floor(L/k)
    y = y + [zeros((n-1)*k,1); conv( x(1+(n-1)*k:n*k), h ); zeros(L-n*k,1)];
end

% pré aloca y, que é a convolução
% y = zeros( L+M-1,1 );

% % soma todas as colunas da matriz y_aux
% for n = 1:floor(L/k)
%     y = y+y_aux(:,n);
% end

y=y(1:L+M-k-1);