%%
clc; clear; 
Nfft=1024;
ord = 32;
w1 = rectwin(ord);
w2 = triang(ord);
w3 = bartlett(ord);
w4 = hamming(ord);
w5 = hann(ord);
w6 = blackman(ord);
w8 = rectwin(64);
w9 = triang(64);
w10 = bartlett(64);
w11 = hamming(64);
w12 = hann(64);
w13 = blackman(64);

figure(1), hold on;
plot(w1); 
plot(w2, 'g'); 
plot(w3, 'k'); 
plot(w4, 'c'); 
plot(w5, 'm');
plot(w6, 'r'); 
hold off;
% freqz(w1,1,1024)

figure(2), hold on;
W1 =fft(w1,Nfft);
W2 =fft(w2,Nfft);
W3 =fft(w3,Nfft);
W4 =fft(w4,Nfft);
W5 =fft(w5,Nfft);
W6 =fft(w6,Nfft);
W7 =fft(w7,Nfft);

% plot(20*log10(abs(W1(1:Nfft/2+1)/W1(1))));
% plot(20*log10(abs(W2(1:Nfft/2+1)/W2(1))), 'g'); 
% plot(20*log10(abs(W3(1:Nfft/2+1)/W3(1))), 'k'); 
% plot(20*log10(abs(W4(1:Nfft/2+1)/W4(1))), 'c');
% plot(20*log10(abs(W5(1:Nfft/2+1)/W5(1))), 'm');
% plot(20*log10(abs(W6(1:Nfft/2+1)/W6(1))), 'r');
% plot(20*log10(abs(W8(1:Nfft/2+1)/W8(1))));
% plot(20*log10(abs(W9(1:Nfft/2+1)/W9(1))), 'g'); 
% plot(20*log10(abs(W10(1:Nfft/2+1)/W10(1))), 'k'); 
% plot(20*log10(abs(W11(1:Nfft/2+1)/W11(1))), 'c');
% plot(20*log10(abs(W12(1:Nfft/2+1)/W12(1))), 'm');
% plot(20*log10(abs(W13(1:Nfft/2+1)/W13(1))), 'r');

%% olhar o help da fun?o fir1
help fir1
%%  vendo a resposta dos filtros
clear; clc;
% f1 = fir1(32,0.2,'low');
f2 = fir1(127,0.2,'low',rectwin(128));
f3 = fir1(127,0.2,'low',triang(128));
f4 = fir1(127,0.2,'low',bartlett(128));
f5 = fir1(127,0.2,'low',hamming(128));
f6 = fir1(127,0.2,'low',hann(128));
f7 = fir1(127,0.2,'low',blackman(128));
figure(2), freqz(f2,1,1024), title('Janela Retangular')
figure(3), freqz(f3,1,1024), title('Janela Trinagular')
figure(4), freqz(f4,1,1024), title('Janela de Bartlett')
figure(5), freqz(f5,1,1024), title('Janela de Hamming')
figure(6), freqz(f6,1,1024), title('Janela de Hann')
figure(7), freqz(f7,1,1024), title('Janela de Blackman')
