
dt=0.01;
t=0:dt:5;
s1=exp(-5*t).*cos(20*pi*t);
s2=cos(20*pi*t);

% Energy and power in time domain
E1=sum(s1.*s1)*dt;
P2=sum(s2.*s2)*dt/(length(t)*dt);

% Signal in frequency domain
[f1 s1f]=T2F(t, s1);
[f2 s2f]=T2F(t, s2)

% Energy and power in frequency domain
df1=f1(2)-f1(1);
E1_f=sum(abs(s1f).^2)*df1;

df2=f2(2)-f2(1);
T=t(end);
P2_f=sum(abs(s2f).^2)*df2/T;

% Plot signal
figure(1);
subplot(2, 1, 1);
plot(t, s1, 'k-', 'linewidth', 1.5);
axis([0 2 -1 1]);
grid on;
subplot(2, 1, 2);
plot(t, s2, 'k-', 'linewidth', 1.5);
axis([0 2 -1 1]);
grid on;

[E1, E1_f]
[P2, P2_f]
