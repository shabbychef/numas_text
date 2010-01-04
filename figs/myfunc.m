function [y1,y2] = myfunc(x1,x2)
%
% input:
%  x1			a number
%  x2			another number
% output:
%  y1			some output
%  y2			some output

y1 = cos(x1) .* sin(x2);
y2 = norm(y1);

