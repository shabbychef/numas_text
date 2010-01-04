function plotfield(minxy,maxxy,steps,f,varargin)
%
% plot a vector field.  sets out a grid of xmin:delx:xmax X ymin:dely:ymax
% and evaluates f at those points.
% f should be evaluable at a 2 x n matrix, where in each col, the 
% 	first row is x, the second is y coord
%
% input:
% 	minxy			a 2 x 1 of xmin, ymin
% 	maxxy			a 2 x 1 of xmax, ymax
% 	steps			a 2 x 1 of stepx,stepy
% 	f					the function to be evaluated at the given points
% 	varargin:
% 		g				a function which scales the vectors, based on the
% 							min,max values of the output of f, and the 
% 							spacing.
% 							at the moment its:
% 							g(vecminxy,vecmaxxy,delxy) -> a constant
% 		len			a length which all vectors should be made to this length.
% 							in this case g is ignored. a direction field is plotted
% 							instead.
% output:

PLOTTIPS = 1;

delxy = (maxxy - minxy) ./ steps;

xs = minxy(1):delxy(1):maxxy(1);
ys = minxy(2):delxy(2):maxxy(2);

numx = length(xs);
numy = length(ys);

n  = numx * numy;
xys = zeros(2,n);

for i=0:numx-1;
	for j=0:numy-1;
		which = i+numx*j+1;
		xys(1,which) = xs(i+1);
		xys(2,which) = ys(j+1);
	end
end

vals = feval(f,xys);

if (nargin > 5)
	vlen = varargin{2}
	plotdirectionfield([xys;vals],vlen,PLOTTIPS)
elseif (nargin > 4)
	g = varargin{1};
	minvecs = min(abs(vals'));
	maxvecs = max(abs(vals'));
	scal    = feval(g,minvecs,maxvecs,delxy);
	vals    *= scal;
	plotvecfield([xys;vals],PLOTTIPS);
else
	plotvecfield([xys;vals],PLOTTIPS);
end


function scal = normalscale(minvecs,maxvecs,delxy)
scal = norm(delxy) / norm(maxvecs);

function scal = halfnormalscale(minvecs,maxvecs,delxy)
scal = 0.5 * normalscale(minvecs,maxvecs,delxy);

function vas = nummy(inps)
[m,n] = size(inps);
vas = rand(2,n);

function plotdirectionfield(fld,vlen,plottips)
%
% plot a vector field, with each vector normalized...
% input:
% 	fld 			an 4 x n  matrix.  for a given col:
% 							first 2 rows are x,y location
% 							second 2 rows are x,y of the vector to be plotted
% 	len 			the length to which each vector is to be normalized.
% 	plottips  whether to plot the tips of the vectors
% output:

scaling = vlen ./ sqrt( fld(3,:) .* fld(3,:) + fld(4,:) .* fld(4,:) );
fld(3,:) = scaling .* fld(3,:);      
fld(4,:) = scaling .* fld(4,:);

plotvecfield(fld,plottips);


function plotvecfield(fld,plottips)
%
% plot a vector field
% input:
% 	fld 			an 4 x n  matrix.  for a given col:
% 							first 2 rows are x,y location
% 							second 2 rows are x,y of the vector to be plotted
% 	plottips  whether to plot the tips of the vectors
% output:

lines = [fld(1,:) - 0.5*fld(3,:);fld(2,:) - 0.5*fld(4,:);\
				 fld(1,:) + 0.5*fld(3,:);fld(2,:) + 0.5*fld(4,:)];

plotlines(lines,plottips);

function plotlines(lines,plottips)
%
% plot lines
% input:
% 	lines			a 4 x n  matrix.  for a given col:
% 							first 2 rows are x,y of start point
% 							second 2 rows are x,y of end point
% 	plottips  whether to plot the tips of the vectors
% output:

xs = [lines(1,:);lines(3,:)];
ys = [lines(2,:);lines(4,:)];

plot (xs,ys,"b-;;");

if (plottips)
	hold on;
	plot (xs(2,:),ys(2,:),"@36b;;");
	hold off;
end

