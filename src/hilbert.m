% run 'pkg load signal' to load signal processing package

fs=400;
dt=1/fs;
snr=10;
f=50;
N=128;
t=0:dt:(N-1)*dt;
st=sin(2*pi*f*t);
sf=fft(st);
df=fs/N;
ff=0:df:(N-1)*df;
subplot(2, 1, 1);
plot(ff, abs(sf));

zt=hilbert(st);
zf=fft(zt);
df=fs/N;
fff=0:df:(N-1)*df;
subplot(2, 1, 2);
plot(fff, abs(zf));
