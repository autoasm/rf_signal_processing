Ts=1;
N_sample=17;
eye_num=5;
alpha=1;
N_data=1000;
dt=Ts/N_sample;
t=-3*Ts:dt:3*Ts;

d=sign(randn(1, N_data));
dd=sigexpand(d, N_sample);

ht=sinc(t/Ts).*(cos(alpha*pi*t/Ts))./(1-4*alpha^2*t.^2/Ts^2+eps);
st=conv(dd, ht);
tt=-3*Ts:dt:(N_data+3)*N_sample*dt-dt;

figure(1);
subplot(2, 1, 1);
plot(tt, st);

axis([0 20 -1.2 1.2]);
title('baseband');

subplot(2, 1, 2);
ss=zeros(1, eye_num*N_sample);
ttt=0:dt:eye_num*N_sample*dt-dt;
for k=3:50
  ss=st(k*N_sample+1:(k+eye_num)*N_sample);
  drawnow;
  plot(ttt, ss);
  hold on;
end
title('eye diagram');
