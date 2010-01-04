function beul
%
% run backwards euler's method on 
% x' = x,
% x(0) = 1
%

tfin = 3.0;
steps = 10;
h = tfin ./ steps;
obyomh = 1.0 ./ (1.0 - h);

diary "beul.dat";

x   = 1.0;
t   = 0.0;
printf("%g %g\n",t,x);
for i=1:steps
	x *= obyomh;
	t += h;
	printf("%g %g\n",t,x);
end

diary off;

xact = exp(tfin);
erro = abs(x - xact)

