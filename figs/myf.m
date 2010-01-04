function vals = myf(xys)
%
% return a vector field
%
% input:
% 	xys				a 2 x n matrix whose columns are x,y pairs.
% output:
% 	vals			a 2 x n matrix of the vector field at those points.


%grad phi, with phi(x,y) = x^2 + y^2
%vals = [2*(xys(1,:)); 2*(xys(2,:)) ];
%grad phi, with phi(x,y) = 2x + 5y
%vals = [2*ones(size((xys(1,:)))); 5*ones(size((xys(2,:)))) ];
%grad phi, with phi(x,y) = xy
%vals = [(xys(2,:)); (xys(1,:))];
%(-y,x)
vals = [-(xys(2,:)); (xys(1,:))];
%
%4*y^2
%vals = [1 * ones(size(xys(1,:))); 4 * xys(2,:) .* xys(2,:) ];


