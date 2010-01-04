function Dnn = richardsons(col0)
% compute the D(n,n) entry in the richardsons method table,
% given col0
%

n = length(col0)-1;

fourh = 1;
for i=1:n
	fourh *= 4;
	denom = fourh - 1;
	col0(i+1:end) = fourh*col0(i+1:end) - col0(i:end-1);
	col0(i+1:end) ./= denom;
end

Dnn = col0(end);

