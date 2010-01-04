function [L,U] = randomlu(n)
% generate random nxn l,u matrices with integer entries.

MAXS    = 4;
L       = floor(2*MAXS*rand(n) - MAXS);
U       = floor(2*MAXS*rand(n) - MAXS);

for i=1:n
	U(i,i) = 1;
	for j=1:(i-1)
		U(i,j) = 0;
	end
	for j=(i+1):n
		L(i,j) = 0;
	end
end

A = L*U
printf("\\threebythree{%d}{%d}{%d}{%d}{%d}{%d}{%d}{%d}{%d}\n",A(1,1),A(1,2),A(1,3),A(2,1),A(2,2),A(2,3),A(3,1),A(3,2),A(3,3));
det(A)
