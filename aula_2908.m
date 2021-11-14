% demonstração da aula sobre vazamento espectral

n=0:31;
x = cos(3*pi*n/8);
Xf = fft(x,128);
stem(abs(Xf))

n=0:127;
x = cos(3*pi*n/8)+cos(4*pi*n/9);
Xf = fft(x,128);
stem(abs(Xf))

x1 = [5 4 3 2 1];
x2 = [5 1 2 3 4];
x1f = fft(x1, 5)
x2f = fft(x2, 5)
figure(1)
stem(x1f)
figure(2)
stem(x2f)