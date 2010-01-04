function rungrowth

lowleft = [-2.5,-2.5];
upright = [4.5,4.5];
del     = upright - lowleft;
stepxys = 24 * [1,del(2)/del(1)];

funcname = 'growth';
funcname = 'logic';
segscale = 0.19;

plotfield(lowleft,upright,stepxys,funcname,'normalscale',segscale);
gset term postscript landscape color solid;
gset output "growth.eps";
replot;
gset term x11;

DOSTEPS = 0;

if DOSTEPS
	% do an euler approximation
	
	start = 0.5*upright';
	start = [1.5;0.0];
	steps = 3000;
	h     = 0.0005;
	
	appx = zeros(2,steps+1);
	xy = start;
	
	for i=1:steps
		appx(:,i) = xy;
		dir = feval(funcname,(xy));
		xy += h * dir;
	end
	
	appx(:,steps+1) = xy;
	
	hold on;
	plot (appx(1,:)',appx(2,:)',"7;;");
	hold off;
	
	gset term postscript landscape color solid;
	gset output "growtheuler.eps";
	replot;
	gset term x11;
	
	input("enter a key");
	%% do a runge-kutta 2nd order
	
	steps *= 1;
	h *= 3;
	
	appx = zeros(2,steps+1);
	xy = start;
	
	for i=1:steps
		appx(:,i) = xy;
		k1 = h * feval(funcname,xy);
		k2 = h * feval(funcname,(xy + k1));
		xy += 0.5 * (k1 + k2);
	end
	
	appx(:,steps+1) = xy;
	
	plotfield(lowleft,upright,stepxys,funcname,'normalscale',segscale);
	hold on;
	plot (appx(1,:)',appx(2,:)',"8;;");
	hold off;
	
	gset term postscript landscape color solid;
	gset output "growthrk.eps";
	replot;
	gset term x11;
end
	
