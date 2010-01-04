function y = calcNewton(t,coefs,xs)
% evaluate the newton polynomial for the 
% given coefficients and nodes, at t

n = length(coefs);

y = coefs(n);
for i=(n-1):-1:1
	y .*= (t .- xs(i));
	y .+= coefs(i);
end

