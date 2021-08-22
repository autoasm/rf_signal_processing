function [t, out]=noise_nb(fc, B, N0, t)
  dt=t(2)-t(1);
  Fmx=1/dt;
  len=length(t);
  p=N0*Fmx;
  rn=sqrt(p)*randn(1, len);
  [f, rf] = T2F(t, rn);
  [t, out] = bpf(f, rf, fc-B/2, fc+B/2);
end
