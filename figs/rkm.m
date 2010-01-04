function rkm


steps = 4000.0;
h     = 2.0 / steps;

a     = 0.0;
c     = 0.1;
f     = "testme"

[ts,xs] = rkmsolve4(f,a,c,h,steps);

plot(ts,xs,";rkm2;");

gset term postscript landscape color;
gset output "rkm2.ps";
replot;
gset term x11;


function myout = testme(t,x)

myout = 1.0 / (1.0 - x);



function [ts,xs] = rkmsolve(f,a,c,h,steps)
%
% solve the ode x' = f(t,x)
% x(a) = c
% by steps steps of size h
%
% using rkm order 2

n  = steps + 1;

xs = zeros(n,0);
ts = zeros(n,0);


t  = a;
x  = c;

for i=1:steps
	ts(i) = t;
	xs(i) = x;
	k1 = h*feval(f,t,x);
	t += h;
	k2 = h*feval(f,t,x+k1);
	x += (k1 + k2) / 2.0;
end

ts(n) = t;
xs(n) = x;


function [ts,xs] = rkmsolve4(f,a,c,h,steps)
%
% solve the ode x' = f(t,x)
% x(a) = c
% by steps steps of size h
%
% using rkm order 4
%

halfh = h / 2.0;
n  = steps + 1;

xs = zeros(n,0);
ts = zeros(n,0);

t  = a;
x  = c;

for i=1:steps
	ts(i) = t;
	xs(i) = x;
	k1 = h*feval(f,t,x);
	t += halfh;
	k2 = h*feval(f,t,x+0.5*k1);
	k3 = h*feval(f,t,x+0.5*k2);
	t += halfh;
	k4 = h*feval(f,t,x+k3);
	x += (k1 + 2.0*(k2+k3) + k4) / 6.0;
end

ts(n) = t;
xs(n) = x;

