function plotvf   

%plot a vector field

lowleft = [-2,-2];
upright = [2,2];
del     = upright - lowleft;
stepxys = 17 * [1,del(2)/del(1)];

funcname = 'myf';

plotfield(lowleft,upright,stepxys,funcname,'normalscale')
gset term postscript landscape color solid;
gset output "myf.eps";
replot;
gset term x11;
