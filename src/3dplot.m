v=20;
alpha=pi/6;
omega=pi/6;
t=[0:0.01*pi:50*pi];
x=v*t*sin(alpha).*cos(omega*t);
y=v*t*sin(alpha).*sin(omega*t);
z=v*t*cos(alpha);
plot3(x, y, z);
grid on;
