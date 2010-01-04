
clear;

n = 27;
mi = 0.8;
ma = 4.7;

errx = 0.8;
erry = 0.3;

del = (ma - mi) / n;

m		= 1;
b		= 1.0;

xs = (mi .* ones(n,1)) + del .* (1:n)';
ys = m * xs + b * ones(size(xs));

measxs = xs + errx * randn(size(xs));
measys = ys + erry * randn(size(ys));

gset term x11;
gset xrange [0:6];
gset yrange [1:7];

A = [ones(size(xs)) (measxs)];

%ols:
b = A \ measys;
yhs = b(2) * (measxs) + b(1);

%compute total least squares solution
xbar = ones(1,n)*measxs / n;
ybar = ones(1,n)*measys / n;
sxx  = ones(1,n)*(measxs .* measxs);
sxy  = ones(1,n)*(measxs .* measys);
syy  = ones(1,n)*(measys .* measys);

alpha = 0.5 * (sxx - n * xbar * xbar);
beta  = (sxy - n * xbar * ybar);
gamma = 0.5 * (syy - n * ybar * ybar);

gaalph = gamma - alpha;
k 		= (gaalph + sqrt(gaalph * gaalph + beta * beta))/(beta);
d			= ybar - k * xbar;

xts		= measxs;
yts		= k * measxs + d;

%xas = (b(2) / (1.0 + b(2) ^2)) * (ys + (xs ./b(2)) - b(1).* ones(1,n));
%yas = b(2) * (xas) + b(1);
xas = (k / (1.0 + k ^2)) * (measys + (measxs ./k) - d .* ones(size(measxs)));
yas = k * (xas) + d;

%plot data and ordinary least squares

hold off;
plot (measxs,measys,"x;;")
hold on;
plot (measxs,yhs,"3-;;")

for i=1:n
	xx(1) = measxs(i);
	yy(1) = measys(i);
	xx(2) = measxs(i);
	yy(2) = yhs(i);
	plot (xx,yy,"1-;;");
end

gset term postscript;
gset output "lsk1.eps";
replot;
gset output "/dev/null";
gset term x11;

%plot total least squares

input("presskey ");
hold off;
plot (measxs,measys,"x;;")
hold on;
plot (xts,yts,"3-;;")

for i=1:n
	xx(1) = measxs(i);
	yy(1) = measys(i);
	xx(2) = xas(i);
	yy(2) = yas(i);
	printf("%g ?= %g\n", (-1.0 / k), (yas(i) - measys(i)) / (xas(i) - measxs(i)));
	plot (xx,yy,"1-;;");
end

gset term postscript;
gset output "lsk2.eps";
replot;
gset output "/dev/null";
gset term x11;
