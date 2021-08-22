pkg load signal;

f1=1;
fc=8;
B=2*f1;
fs=6*fc;
dt=1/fs;
N=256;
t=0:dt:(N-1)*dt;
T=t(end);

% message
mt=sqrt(2)*cos(2*pi*f1*t);
% modulation
st=real(hilbert(mt).*exp(j*2*pi*fc*t))
noise = sqrt(0)*randn(1, N);
st_with_noise = st + noise;

subplot(3, 1, 1);
plot(t, mt, t, st_with_noise, t, noise, 'r-.');
axis([0 4 -2 2]);

[f, sf]=T2F(t, st);
Pf=abs(sf).^2/T;
subplot(3, 1, 2);
plot(f, Pf);
axis([-20 20 0 3]);

% demodulation
rt = st_with_noise.*cos(2*pi*fc*t);
rt = rt - mean(rt);
[f, rf] = T2F(t, rt);
[t, yt] = lpf(f, rf, B);
subplot(3, 1, 3);
plot(t, yt);
axis([0 4 -1 1]);
