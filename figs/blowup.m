function blowup
%
% run euler's method to get blowup.
%

f = "onebyx";
a = 0;
c = 0.1;
steps = 490;
tfin = 2.0;
h = tfin / steps;

diary "blowup.dat";
xfin = eulerun(f,a,c,h,steps);
diary off;

%%%%%%%
function bb = onebyx(a,b)
bb = 1.0 / (1.0 - b);

%%%%%%%
function xfin = eulerun(f,a,c,h,steps)
%
% run explicit euler's method to solve
% x'(t) = f(t,x)
% x(a) = c

ts = zeros(1+steps,1);
xs = zeros(1+steps,1);

xfin = c;
t    = a;
printf("%g %g\n",t,xfin);

ts(1,1) = a;
xs(1,1) = xfin;

for i=1:steps
	xfin += h * feval(f,t,xfin);
	t += h;
	printf("%g %g\n",t,xfin);
	ts(i+1,1) = t;
	xs(i+1,1) = xfin;
end

plot (ts,xs);
