% diferença o cheby para o butterworth é a oscilação
% butter não oscila
% cheby perde por ripple na banda de passagem
% cheby2 tem rindo na banda de transição
% elíptico tem ripple nas duas bandas, mas a banda de transição é
% ridículamente estreita. 

%% no filtro IIR nós não podemos utilizar a H(z) pois ela é infinita. 
% Usamos portanto a equação de diferenças. menos contas. 
% Desvantagem é que a fase não é linear. 
% O atraso do IIR é aprox metade da ordem do filtro, o que é 
% insignificante no tempo em comparação com a freq de amostragem. 

%% lp2lp

rp = 3;
rs = 40;
wp = 0.5;
ws = 0.6;
[n wn] = buttord(wp, ws, rp, rs);
[b a] =butter(n,wn);
freqz(b,a,1024)
%%
rp = 3;
rs = 40;
wp = 0.5;
ws = 0.6;
[n wp] = cheb1ord(wp, ws, rp, rs);
[b a] = cheby1(n,rp,wp);
freqz(b,a,1024)
%% 
% invariancia ao impulso não pode ser compensado por causa do aliasing
% por isso é usado apenas a transformção bilinear. 
