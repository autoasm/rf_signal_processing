function out=sigexpand(d, M)
  N=length(d);
  out = zeros(M, N);
  out(1, :)=d;
  out = reshape(out, 1, M*N);
end

Ts=1;
N_sample=8;
dt=Ts/N_sample;
N=1000;
t=0:dt:(N*N_sample-1)*dt;

gt1=ones(1, N_sample);
gt2=ones(1, N_sample/2);
gt2=[gt2 zeros(1, N_sample/2)];

mt3=sinc((t-5)/Ts);
gt3=mt3(1:10*N_sample);

d=(sign(randn(1, N))+1)/2;
data=sigexpand(d, N_sample);

st1=conv(data, gt1);
st2=conv(data, gt2);

d=2*d-1;
data=sigexpand(d, N_sample);
st3=conv(data, gt3);

[f, st1f] = T2F(t, st1(1:length(t)))
[f, st2f] = T2F(t, st2(1:length(t)))
[f, st3f] = T2F(t, st3(1:length(t)))

subplot(3, 2, 1);
plot(t, st1(1:length(t))); grid on;
axis([0 100 -1.5 1.5]);

subplot(3, 2, 2);
plot(f, 10*log10(abs(st1f).^2/Ts)); grid on;
axis([-5 5 -40 40]);
title("db/Hz")

subplot(3, 2, 3);
plot(t, st2(1:length(t)));
axis([0 20 -1.5 1.5]);
grid on;

subplot(3, 2, 4);
plot(f, 10*log10(abs(st2f).^2/Ts));
axis([-5 5 -40 40]);
grid on;
title("db/Hz")

subplot(3, 2, 5);
plot(t, st3(1:length(t)));
axis([0 20 -2 2]); grid on;

subplot(3, 2, 6);
plot(f, 10*log10(abs(st3f).^2/Ts));
axis([-5 5 -4 40]);
title("db/Hz")
grid on;
