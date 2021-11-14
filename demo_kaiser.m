%% demo kaiser
beta = 3.9754327;
M = 104;

[N,Wn,BTA,FILTYPE] = kaiserord([800 950 1050 1200] , [1 0 1], [0.0575 0.00562 0.0575], 6000)

w = kaiser(M+1,beta);
% dividir o Wn por metade da frequência de amostragem
% frequencias normalizadas onde 1 é metade da frquência de amostragem.
% h = fir1(104, [800 950 1050 1200]/3000, 'stop', w);

% h = fir1(104, [875 1125]/3000, 'stop', w);
h = fir1(N, Wn, FILTYPE, kaiser(N+1, BTA));

plot(h)
freqz(h, 1, 1024, 6000)


%%
w1 = hamming(M+1);
w2 = hann(M+1);
w3 = blackman(M+1);
figure; hold on;
plot(w)
plot(w1)
plot(w2)
plot(w3)
figure; hold on;
freqz(w,1,1024,6000)