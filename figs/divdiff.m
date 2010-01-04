function coefs = divdiff(xs,fxs)
% 
% compute the newton polynomial coefficients,
% based on the given data
% input:
% 	xs			the x nodes
% 	fxs			the f values at the nodes
% output:
% 	coefs		the divided differences f[x_0,x_1,...x_k]
%

n = length(xs);
m = length(fxs);

if (m != n)
	error("size mismatch");
end

coefs = fxs;

for i=1:(n-1)
	newxs = xs(1+i:end) - xs(1:end-i);
	coefs(1+i:end) -= coefs(i:end-1);
	coefs(1+i:end) ./= newxs;
end


