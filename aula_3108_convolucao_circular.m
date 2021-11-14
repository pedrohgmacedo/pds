% exemplo de convolução circular
% na convolução tradicional, esperavamos obter Y = [0 5 4 3 2 1]
% entretanto, obtemos o sinal deslocado Y = [1 5 4 3 2];

clc;
x = [0 1]
h = [5 4 3 2 1]
X = fft(x,5)
H = fft(h,5)
Y = ifft(X.*H)

h = [ 1 1 1 1 1 ]
x = [ 1 1 1 1 1 ]
y = phg_conv(h,x)

% a dft dos sinais precisa ser feitas com Lx + Lh -1
ifft(fft(h,9).*fft(x,9))