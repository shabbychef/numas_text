function [a,b] = lsqrexp(xys)
% 
% compute the least squares coefficients to interpolate
% x,y vals by a e^x + b e^{-x}
% input:
% 	xys			each row is an x,y pair
% output:
% 	a,b    	the coefficients of the least squares approximate
%


A = [exp(xys(:,1)) exp(-xys(:,1))];
rhv = A' * xys(:,2)
M   = A' * A
x   = M \ rhv;
a   = x(1,1);
b   = x(2,1);

cond(M)


