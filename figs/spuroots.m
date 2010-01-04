function [x1,x2,x3] = spuroots(b,c)
% roots of x^2 + bx + c
%

disc = sqrt(b*b - 4 * c);
x1   = (- b - disc) / 2.0;
x2   = (- b + disc) / 2.0;
x3   = 2.0 * c / (- b - disc);

