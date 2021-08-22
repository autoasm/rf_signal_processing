function [f, sf]=T2F(t, st)
  dt=t(2)-t(1);
  T=t(end);
  df=1/T;
  N=length(st);
  f=-N/2*df:df:N/2*df-df;
  sf=fft(st);
  sf=T/N*fftshift(sf);
end

function [t, st]=F2T(f, sf)
  df=f(2)-f(1);
  Fmx=(f(end)-f(1)+df);
  dt=1/Fmx;
  N=length(sf);
  T=dt*N;
  t=0:dt:T-dt;
  sff=fftshift(sf);
  st=Fmx*ifft(sff);
end
