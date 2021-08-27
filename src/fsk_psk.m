A=1;
fc=2;
N_sample=8;
N=500;
Ts=1;
dt=Ts/fc/N_sample;
t=0:dt:N*Ts-dt;
Lt=length(t);

d=sign(randn(1, N));
dd=sigexpand((d+1)/2, fc*N_sample);
gt=ones(1, fc*N_sample);
subplot(4, 2, 1);
d_NRZ=conv(dd, gt);
plot(t, d_NRZ(1:length(t)));
axis([0 10 0 1.2]);;
xlabel('Input Signal');

subplot(4, 2, 2);
[f, d_NRZf]=T2F(t, d_NRZ(1:length(t)));
plot(f, 10*log10(abs(d_NRZf).^2/Ts));
axis([-5 5 -50 50]);
xlabel('dB/Hz');

%OOK
ht=A*cos(2*pi*fc*t);
s_2ask=d_NRZ(1:Lt).*ht;
subplot(4, 2, 3);
plot(t, s_2ask);
axis([0 10 -1.2 1.2]);
xlabel('OOK');

[f, s_2askf]=T2F(t, s_2ask);
subplot(4, 2, 4);
plot(f, 10*log10(abs(s_2askf).^2/Ts));
axis([-fc-4 fc+4 -50 50]);
xlabel('dB/Hz');

%2PSK
d_2psk=2*d_NRZ-1;
s_2psk=d_2psk(1:Lt).*ht;
subplot(4, 2, 5);
plot(t, s_2psk);
axis([0 10 -1.2 1.2]);
xlabel('2PSK');

subplot(4, 2, 6);
[f, s_2pskf]=T2F(t, s_2psk);
plot(f, 10*log10(abs(s_2pskf).^2/Ts));
axis([-fc-4 fc+4 -50 50]);
xlabel('dB/Hz');

%2FSK
sd_2fsk=2*d_NRZ-1;
s_2fsk=A*cos(2*pi*fc*t+2*pi*sd_2fsk(1:length(t)).*t);
subplot(4, 2, 7);
plot(t, s_2fsk);
axis([0 10 -1.2 1.2]);
xlabel('2FSK');

subplot(4, 2, 8);
[f, s_2fskf]=T2F(t, s_2fsk);
plot(f, 10*log10(abs(s_2fskf).^2/Ts));
axis([-fc-4 fc+4 -50 50]);
xlabel('dB/Hz');
