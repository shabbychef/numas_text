function [maxe,A] = badgaus(runlim)
%
% baddies:
% maxe = 4.0670
% A =
% -0.937000   0.049720
% 1.067000  -0.055000
% maxe = 12.600
% A =
%  0.76350  0.43390
%  1.68300  0.95680
%  maxe = 47.650
%A =
%
%  0.067070  1.598000
%  0.040180  0.957500
%  maxe = 30.290
%A =
%
%  0.090000  1.363000
%  0.054900  0.83160



A    = zeros(2,2);
maxe = 0;

for i =1:runlim
	[thiser,badA] = gausrun;
	if (thiser > maxe)
		maxe = thiser;
		A = badA;
	end
end



function [maxerr,A] = gausrun
%
% computes a bad naive gaussian elimination
% outputs max relative error, and the matrix
%

skew = 10;
sol  = [skew;1];
SF   = 4;

B = 2 .* rand(2,2) - eye(2,2);
B(1,1) = sigfi( (B(1,1)/skew), (SF - 2) );
B(2,1) = sigfi( (B(2,1)/skew), (SF - 1) );

A = sigfi(B,SF);
b = A * sol;

mult = A(2,1) / A(1,1);
mult = sigfi(mult,SF);

c = b;
J = A;
J(2,1) = 0;
J(2,2) = sigfi(J(2,2) - sigfi(mult * J(1,2),SF),SF);
c(2)   = sigfi(c(2) - sigfi(mult * c(1),SF),SF);

apx    = zeros(size(sol));
apx(2) = sigfi( (c(2) / J(2,2)), SF );
apx(1) = sigfi( (sigfi((c(1) - sigfi((J(1,2) * apx(2)),SF)),SF) / J(1,1)),SF );

zerr   = abs(sol - apx);
maxerr = max(zerr);


function ret = sigfi(x,r)
% give r significant figures.

topow = floor(log(abs(x)) ./ log(10.0));
tenpo = 10 .** (topow - r + 1);

ret   = tenpo .* round(x ./ tenpo);





