t=linspace(-6, 6);
x1=sinc(t);
x2=sinc(t-2);
x3=sinc(2*t);

plot(t, x1, '-s');
hold on;
plot(t, x2, '-*');
hold on;
plot(t, x3, '-o');
hold on;
