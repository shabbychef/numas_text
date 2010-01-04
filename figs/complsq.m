
obs = 100;xeps = 0.1;yeps = 1.0;m = 0.375;b = 1;
Xtrue = randn(obs,1);Ytrue = m .* Xtrue .+ b;
XSaw = Xtrue + xeps * randn(size(Xtrue));
YSaw = Ytrue + yeps * randn(size(Ytrue));
lsmb = [XSaw, ones(obs,1)] \ YSaw;
lsm = lsmb(1); lsb = lsmb(2);
[n,d] = orthlsq([XSaw, YSaw]);
orthm = -n(1) / n(2);orthb = d / n(2);

hold off;
plot(XSaw,YSaw,"*;observed data;");
hold on;
plot(XSaw,m*XSaw .+ b,"r-;true line;");
plot(XSaw,lsm*XSaw .+ lsb,"g-;ordinary least squares;");
plot(XSaw,orthm*XSaw .+ orthb,"b-;orthogonal least squares;");
hold off;

