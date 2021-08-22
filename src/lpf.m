function [t, st] = lpf(f, sf, B)
  %B: bandwidth
  df=f(2)-f(1);
  T=1/df;
  N=length(f);
  hf=zeros(1, N);
  bf=[-floor(B/df):floor(B/df)]+floor(N/2);
  hf(bf)=1;
  yf=hf.*sf;
  [t, st]=F2T(f, yf);
  st=real(st);
end

function [t, st] = bpf(f, sf, B1, B2)
  df=f(2)-f(1);
  T=1/df;
  hf=zeros(1, length(f));
  bf=[floor(B1/df):floor(B2/df)];
  bf1=floor(length(f)/2)+bf;
  bf2=floor(length(f)/2)-bf;
  hf(bf1)=1/sqrt(2*(B2-B1));
  hf(bf2)=1/sqrt(2*(B2-B1));
  yf=hf.*sf.*exp(-j*2*pi*f*0.1*T);
  [t, st]=F2T(f, yf);
end
