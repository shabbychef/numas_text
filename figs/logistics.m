function logistics

lowleft = [-1,-1];
upright = [4,4];
del     = upright - lowleft;
stepxys = 26 * [1,del(2)/del(1)];

plotfield(lowleft,upright,stepxys,'logic','dummy',0.15);
%plotfield(lowleft,upright,stepxys,'logic','normalscale');
%plotfield(lowleft,upright,stepxys,'logic','halfnormalscale');
gset term postscript landscape color solid;
gset output "dirf.eps";
replot;
gset term x11;

	
