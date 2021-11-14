% demo de filtros por meio de otimiza??o
ap = .1; % passband
as = 60; % stopband
fs = 2000; 
f =  [600 700]; % cutoff frequencies
a = [1 0];

% compute deviations
ripples = [(10^(ap/20)-1)/(10^(ap/20)+1) 10^(-as/20)];

% estimate the order and the weights
[n,fo,ao,w] = firpmord(fn,a,[0.01 0.1],fs);

% design the filter
b = firpm(n,fo,ao,w);
freqz(b,1,8192);

%%
% demo de filtros por meio de otimização
ap = .1; % passband
as = 60; % stopband
fs = 2000; 
f = [400 500 600 700]; % cutoff frequencies
a = [1 0 1];

% compute deviations
ripples = [(10^(ap/20)-1)/(10^(ap/20)+1) 10^(-as/20) 10^(-as/20) ];

% estimate the order and the weights
[n,fo,ao,w] = firpmord(f,a,ripples,fs);

% design the filter
b = firpm(n,fo,ao,w);
freqz(b,1,8192);

%%
% frequência de amostragem 44.1 kHz
% relatório, fazer as contas na mão e no matlab para kaiser
% otimização fazer no matlab
% projetar no matlab, e analisar, se deu certo ou se deu melhor
% trabalho de filtros usando a janela de kaiser e de otimização
% 1 passa alta (kaiser e otim)
% 2 passa banda (kaiser e otim)
% com as especificações definida pelo aluno
% freq das bordas passagem e rejeição
% atenuação, feq amostragem, etc tudo em hertz
% oscilação máxima e mínima
% mostrar freqz, módulo fase, discussão sobre fase linear e vantagens

%% 
% regra de filtros analógicos:
% passa baixa normalizado cm freq de corte em 1 rad/s
% 