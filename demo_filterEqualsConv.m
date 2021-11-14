clc; 
x = [1 2 3 4];
h = [4 5 6 7 8 9 10];

phg_conv(x,h)'
phg_filter(h,1,x)'

a = [10 12 14 15 17 19]
b = [ 9 8 7 6 5 4 3 2 1]
fs = 20
freqz(b, 1, [], fs)
% [H, w] = freqz(b, a, [], fs)