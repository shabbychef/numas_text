function euler
%
% run euler's method.
%
% maxe = 4.0670
% A =
% -0.937000   0.049720
% 1.067000  -0.055000
% maxe = 12.600
% A =
%  0.76350  0.43390
%  1.68300  0.95680
%  maxe = 47.650
%A =
%
%  0.067070  1.598000
%  0.040180  0.957500
%  maxe = 30.290
%A =
%
%  0.090000  1.363000
%  0.054900  0.83160


f = "second";
a = 0;
c = 1;
steps = 10;
tfin = 3.0;
h = tfin / steps;

diary "eulerep.dat";
xfin = eulerun(f,a,c,h,steps);
diary off;
xact = c * exp(tfin - a);
erro = abs(xfin - xact)

%%%%%%%

f = "negsecond";

xfin = eulerun(f,a,c,h,steps);
xact = c * exp(-(tfin - a));
erro = abs(xfin - xact)

%%%%%%%
function bb = second(a,b)
bb = b;

%%%%%%%
function bb = negsecond(a,b)
bb = -b;

%%%%%%%
function xfin = eulerun(f,a,c,h,steps)
%
% run explicit euler's method to solve
% x'(t) = f(t,x)
% x(a) = c

xfin = c;
t    = a;
printf("%g %g\n",t,xfin);

for i=1:steps
	xfin += h * feval(f,t,xfin);
	t += h;
	printf("%g %g\n",t,xfin);
end

