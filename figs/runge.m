function runge
% generate figures 5.3 and 5.5?
%
% format is possibly lt;name;symboltype;
%
% good lt colors:
% red 1
% blue 3
% black 7
% reddash 8
%
% lines points:
% -@@;
% is also ok:
% 73-@@;title;

global USECHEBY;
USECHEBY = 1;
doplot(5,[17],300,"rungecheb17.ps");
doplot(5,[3 7 10],300,"rungechebsm.ps");
USECHEBY = 0;
doplot(5,[15],300,"runge15.ps");
doplot(5,[50],300,"runge50.ps");
doplot(5,[3 7 10],300,"rungesmall.ps");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function doplot(alpha,ns,m,fname)
% plot the interpolants for the given ns, for
% m intervals of [-alpha,alpha]
% spit to the given filename


xs = -alpha .+ (2*alpha) * (0:(m)) ./ (m);
ys = runge(xs);

hold off;
plot(xs,ys,"7-;runge;");
hold on;

i = 1;
okcolors = [1 3 9 0 8 7];
for n=ns
	ys = interprung(alpha,n,xs);
	plot(xs,ys,sprintf("%d;%d nodes;",okcolors(i),n));
	if (i==length(okcolors)) 
		i = 0;
	end
	++i;
end

gset term postscript color;
gscom = ["gset output \"" fname "\""];
eval(gscom);
replot;
gset term x11;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ys = interprung(alpha,n,xs)
% interpolate runge function on [-alpha,alpha]
% with n equally spaced interpolation points
% then give the poly interpolant on the given xs

global USECHEBY;

if (USECHEBY == 1)
	%chebyshev:
	nodex = alpha * cos( pi .* ( 2.0 .* (0:(n-1)) .+ 1) ./ (2.0*n) );
else
	%equally spaced:
	nodex = -alpha .+ (2*alpha) * (0:(n-1)) ./ (n-1);
end


fxs   = runge(nodex);
coefs = divdiff(nodex,fxs);
ys    = evalnewt(coefs,n-1,nodex,xs,coefs(n)*ones(size(xs)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rx = runge(x)
% runge function
rx = (1 .+ x.*x).^(-1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ys = evalnewt(coefs,n,nodex,xs,ycar)
% evaluate the newton polynomial for the 
% given coefficients and the carry forward

ys = coefs(n) .+ (xs .- nodex(n)) .* ycar;

if (n!=1) 
	ys = evalnewt(coefs,n-1,nodex,xs,ys);
end
