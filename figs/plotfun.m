

n = 100;
X = pi .* ((1:n) ./ n);
Y = sin(X);
plot(Y);
gset term postscript monochrome;
gset output "justy.ps";
replot;
gset term x11;
plot(X,Y);
gset term postscript monochrome;
gset output "xandy.ps";
replot;
gset term x11;
W = sqrt(Y);
plot(W);
gset term postscript monochrome;
gset output "justw.ps";
replot;
gset term x11;
plot(Y,W);
gset term postscript monochrome;
gset output "yandw.ps";
replot;
gset term x11;


