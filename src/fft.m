fs=1000;
f=50;
dt=1/fs;
N=1000;
t=0:dt:(N-1)*dt;
st=cos(2*pi*f*t);

% plot signal in time domain
subplot(2, 1, 1);
plot(t, st);
axis([0 0.25 -1 1])

% plot signal in frequency domain
sf=fft(st);
df=1/t(end);
f=0:df:(N-1)*df;
subplot(2, 1, 2);
plot(f, sf);
axis([0 1000 0 600])
