function darctan
% data for example problem 7.3
% to approximate the derivative of arctan(x) by fwd diff

hpows = 0:-1:-16;
h = 10 .** hpows;
appx = phi(sqrt(2.0),h);
err  = abs((1.0/3.0) * ones(size(appx)) - appx);

n = length(h);

for i=1:n
	printf("\\tenex{1}{%d} & %9.17g \\\\\n",hpows(i),appx(i));
end

%diary "deriv.dat";
diary on;

for i=1:n
	printf("%9g %9.17g \n",h(i),err(i));
end

diary off;

endfunction 
function appx = phi(x,h)

appx = atan(x*ones(size(h)) + h) - atan(x*ones(size(h)) - h);
appx = ((ones(size(h))) ./ (2 * h)) .* appx;

endfunction 
