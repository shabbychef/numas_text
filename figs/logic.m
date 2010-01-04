function vals = logic(xys)
%
% simulate the logistic equation.
%
% y' = k1y(1-y/k2)
%
% input:
% 	xys				a 2 x n matrix whose columns are x,y pairs.
% output:
% 	vals			a 2 x n matrix of the gradient at those points.

k1 = 1;
k2 = 2;

%dunno what this is:
%vals = [1 * ones(size(xys(1,:))); k1 .- (2.0 * k1 /k2) .* xys(2,:)];
%real logistics:
%vals = [1 * ones(size(xys(1,:))); k1 .* xys(2,:) .* (1 .-  xys(2,:) ./ k2)];
%y^2 - x^2
%vals = [1 * ones(size(xys(1,:))); xys(2,:) .* xys(2,:) - xys(1,:) .* xys(1,:)];
%1-xy
%vals = [1 * ones(size(xys(1,:))); 1 .- xys(1,:) .* xys(2,:) ];
%ysin2x
%vals = [1 * ones(size(xys(1,:))); xys(2,:) .* sin(2*xys(1,:)) ];
%1-y^2
%vals = [1 * ones(size(xys(1,:))); 1 .- xys(2,:) .* xys(2,:) ];
%y-x
%vals = [1 * ones(size(xys(1,:))); xys(1,:) - xys(2,:) ];
%xy
%vals = [1 * ones(size(xys(1,:))); xys(1,:) .* xys(2,:) ];
%%x^2 - y^2
%vals = [1 * ones(size(xys(1,:))); xys(1,:) .* xys(1,:) - xys(2,:) .* xys(2,:)];
%4y - exp(y)
%vals = [1 * ones(size(xys(1,:))); 4 * xys(2,:) - exp(xys(2,:))  ];
%cos(y) + sin(y)
%vals = [1 * ones(size(xys(1,:))); cos(xys(2,:)) + sin(xys(2,:)) ];
%4*y^2
vals = [1 * ones(size(xys(1,:))); 4 * xys(2,:) .* xys(2,:) ];


