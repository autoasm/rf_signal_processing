xa=-2:0.1:2;
ya=xa;
[x,y]=meshgrid(xa, ya);
z=x.*exp(-x.^2-y.^2);
mesh(x, y, z)
