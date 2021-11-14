%%
f1 = fir1(31, 0.4, 'low', rectwin(32))
plot(f1)
freqz(f1, 1, 1024, [])
%%
f1 = fir1(31, 0.4, 'low', hamming(32))
plot(f1)
freqz(f1, 1, 1024, [])
%% 
N = 32;
f1 = fir1(N, 0.4, 'high', hamming(N+1))
plot(f1)
freqz(f1, 1, 1024, 8E3)
% a frequência de amostragem vira 2pi
% então de o a 1 estamos olhando de 0 até metade da freqência de amostragem
%%
% freq corte = fs*Wn/2
N = 128;
% wn := freq de corte normalizada
wn = [.4 .5];
% fs := frequência de amostragem
fs = 16e3;

f1 = fir1(N, wn, 'stop', blackman(N+1));
f2 = fir1(N, wn, 'stop', rectwin(N+1));
plot(f1);
% resposta 
hold on;
freqz(f1, 1, 1024, fs);
% freqz(f2, 1, 1024, 16e3);
hold off;

%% importa o arquivo
[data fs] = audioread('orig_song.mp3');
ch_left = data(:,1);
ch_right = data(:,2);

%  filtra e salva como .flac
% ord = ordem do filtro
% para passa baixa, a frequência de corte é fc := Wn*fs/2
% fir1 cria um filtro, baseado em um janela

% teste filtrando saxophone utilizando um passa-faixa
ord = 10*1024;
f1 = fir1(ord, [104*2/fs 659*2/fs], 'bandpass', hamming(ord+1));

% filter aplica o filtro;
% alternativamente podemos fazer a convolução de f1 e data;

% y1 = filter(f1,1,data(:,1));
% y2 = filter(f1,1,data(:,2));

y1 = fftfilt(f1, ch_left);
y2 = fftfilt(f1, ch_right);
% y1 = y1(ord:end); y2 = y2(ord:end);

y = [y1 y2];

% escreve o arquivo .flac
audiowrite('test.flac',y,fs)

%% plots

% cria o vetor de frequência, útil para plot
freq=0:fs/length(data(:,1)):fs-1/fs;

% útil para ver resposta em frequência e verificar efetividade fo filtro;
Y = [fft(y1), fft(y2)];
orig = [fft(data(:,1)) fft(data(:,2))];

% freq(1:end/2+1)

figure(3)
freqz(f1, 1, ord, fs);
title(['resposta em frequencia'])

figure(1)
title(['canal 1'])
hold on; 
plot(freq(1:end/2+1), abs(Y(1:end/2+1, 1)), 'r');
plot(freq(1:end/2+1), abs(orig(1:end/2+1, 1)), 'g');
hold off;

figure(2)
title(['canal 2'])
hold on;
plot(freq(1:end/2+1), abs(Y(1:end/2+1, 2)), 'r');
plot(freq(1:end/2+1), abs(orig(1:end/2+1, 2)), 'g');
hold off;
