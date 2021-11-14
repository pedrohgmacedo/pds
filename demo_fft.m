% x =[1 1 1 1 1] ;
% t1 = linspace(0,2*pi,30);
% t = 0:(2*pi/30):(2*pi-2*pi/30);
% t=t/(2*pi)
% a = fft(x)
% plot(t,abs( a(1:30/2+1) ))
% % figure
% % plot(t1,abs(a))
% % plot(ifft(a))

x=fft( data(:,1), 5*fs );
freq=0:( 2*pi/(5*fs) ):( 2*pi-2*pi/(5*fs) );
freq_norm=freq/pi;
freq_hz=freq_norm*fs/2;
plot(freq_hz,abs(x))

x = [1 1 1 1 1]
x_f = fft(x,5);
ifft(2*x_f)
