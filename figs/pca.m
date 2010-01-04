
m			= 150;
n			= 5;
k			= 40;
errs	= 0.1;

tran	= randn(n,k);
offs	= randn(1,k);

X			= rand(m,n);
sawX	= (X * tran) + kron(ones(m,1),offs) + errs * randn(m,k);

wun		= ones(m,1);

W			= sawX - (wun * wun' * sawX) / (wun' * wun);

[U,S,V]	= svd(W);

eigs	= diag(S'*S);
seig	= sum(eigs);
cseig	= cumsum(eigs) ./ seig;

plot ((1:k)',cseig,'xr-@;cum. sum sqrd. sing. vals.;');

gset term postscript color;
gset output "cseig.eps";
replot;
gset output "/dev/null";
gset term x11;
