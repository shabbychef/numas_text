function vals = growth(xys)
%
% simulate growth vector field.
%
% input:
% 	xys				a 2 x n matrix whose columns are x,y pairs.
% output:
% 	vals			a 2 x n matrix of the gradient at those points.

%%an ellipse:
%k1 = -2;
%k2 = 3;
%vals = [k1 .* (xys(2,:) .- 2.4);k2 .* (xys(1,:) - 1.2)];

vals = [xys(1,:) .* xys(2,:); xys(1,:) ./ xys(2,:)];


%c1 = 1.5;
%c2 = 0.8;
%k1 = 5;
%k2 = 0.5;
%k3 = 0.5;
%k4 = 0.5;
%
%vals = [ k1 .* xys(1,:) .* (c1 .- xys(1,:)) - k2 .* (xys(1,:) .* xys(2,:)); \
%				 k3 .* xys(1,:) + k4 .* xys(2,:) + \
%				 xys(2,:) .* (c2 .* xys(1,:) - xys(2,:)) ];
%%				 k3 .* xys(2,:) .* (c2 .* xys(1,:) - xys(2,:)) ];


%c1 = 1.5;
%c2 = 0.8;
%k1 = 5;
%k2 = 0.5;
%k3 = 0.5;
%k4 = 0.5;
%
%vals = [ k1 .* xys(1,:) .* ( c1 .- xys(1,:) - k2 .* xys(2,:));\
%				 k3 .* xys(2,:) .* ( c2 .* xys(1,:) - xys(2,:)) ];
