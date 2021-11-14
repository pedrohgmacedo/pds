%% passa faixa butterworth
ap = 1
ar = 40
fs = 10e3
w = [1394 1394 1570 1704]/fs
om = 2*10e3*tan(w./2)
ompl = 1;
omrl = (om(4)-om(1))/(om(3)-om(2))
eps = sqrt(10^(0.1*ap)-1)
n = log10((10^(0.1*ar)-1)/eps^2)/(2*log10(omrl))
n = ceil(n)
% buttord([w(2) w(3)], [w(1) w(4)], 1, 40)
rts =@(m) (eps.^(-1./n).*exp(1i*(pi/2)*(2*m+4+1)./(4)))
r = rts(1:1:4)
r = vpa(r)
H0 = (-r(1))*(-r(2))*(-r(3))*(-r(4))
syms s
A = (s-r(1))*(s-r(2))*(s-r(3))*(s-r(4))
A = collect(A)
num = sym2poly(H0)
den = sym2poly(A)
%%
[numd,dend] = bilinear(num,den,fs)
om0 = sqrt(om(4)*om(1))
B = om(3)-om(2)
p = vpasolve(A==0,s)
p = cast(p,'like',1)
%% para um filtro passa alta butterworth
ap = 3
ar = 40
fs = 10e3
w = [1e3 4e3]/fs
om = 2*16e3*tan(w/2)
ompl = 1;
omrl = (om(2)/om(1))
eps = sqrt(10^(0.1*ap)-1)
n = log10((10^(0.1*ar)-1)/eps^2)/(2*log10(omrl))
% buttord([w(2)], [w(1)], 3, 40)
n = ceil(n)
rts =@(m) (eps.^(-1./n).*exp(1i*pi*(m-1)./(4)))
r = rts(1:1:2*4)
r = vpa(r)
H0 = (-r(1))*(-r(2))*(-r(3))*(-r(4))
syms s
A = (s-r(1))*(s-r(2))*(s-r(3))*(s-r(4))
A = collect(A)
num = sym2poly(H0)
den = sym2poly(A)
%%
% A = s^4*(s-4e3/r(1))*(s-4e3/r(2))*(s-4e3/r(3))*(s-4e3/r(4))
p = vpasolve(A==0,s)
p = cast(p,'like',1)
[zp, pd, kd] = bilinear(1,p,1,10e3) 
%% passa faixa cheb
ap = 1
ar = 40
fs = 10e3
w = [1394 1510 1570 1704]/fs
om = 2*10e3*tan(w/2)
ompl = 1;
omrl = (om(4)-om(1))/(om(3)-om(2))
eps = sqrt(10^(0.1*ap)-1)
n = acosh(sqrt(10^(0.1*ar)-1)/eps^2)/acosh(omrl)
n = ceil(n)
% cheb1ord([w(2) w(3)], [w(1) w(4)], 1, 40)
re = @(m) (sin(pi./2.*(2.*m+1)./n)*sinh(1./n.*asinh(1./eps)))
im = @(m) (cos(pi./2.*(2.*m+1)./n)*cosh(1./n.*asinh(1./eps)))
r = [re(3:1:5)+1i*im(3:1:5)]
r = vpa(r)
syms s
A = (s-r(1))*(s-r(2))*(s-r(3))
H0 = (-r(1))*(-r(2))*(-r(3))
A = collect(A)
num = sym2poly(H0)
den = sym2poly(A)
%%
om0 = sqrt(om(4)*om(1))
B = om(3)-om(2)
p = vpasolve(A==0,s)
p = cast(p,'like',1)
[zp, pd, kd] = bilinear(1,p,1,10e3) 
%% passa alta cheb
ap = 3
ar = 40
fs = 10e3
w = [1e3 4e3]/fs
om = 2*10e3*tan(w/2)
ompl = 1;
omrl = (om(2)/om(1))
eps = sqrt(10^(0.1*ap)-1)
n = acosh(sqrt(10^(0.1*ar)-1)/eps^2)/acosh(omrl)
n = ceil(n)
% cheb1ord([w(2)], [w(1)], 3, 40)
re = @(m) (sin(pi./2.*(2.*m+1)./n)*sinh(1./n.*asinh(1./eps)))
im = @(m) (cos(pi./2.*(2.*m+1)./n)*cosh(1./n.*asinh(1./eps)))
r = [re(3:1:5)+1i*im(3:1:5)]
r = vpa(r)
syms s
A = (s-r(1))*(s-r(2))*(s-r(3))
H0 = (-r(1))*(-r(2))*(-r(3))
A = collect(A)
num = sym2poly(H0)
den = sym2poly(A)
%%
p = vpasolve(A==0,s)
p = cast(p,'like',1)
[zp, pd, kd] = bilinear(1,p,1,10e3) 