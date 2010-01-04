function [n,d] = orthlsq(X)

Xm							= mean(X);
X								= center(X);
[U,S,V]					= svd(X);

n								= V(:,end);
d								= Xm * n;
	
