function ratx = rat(x)
%
%test the sigmoidal
%
ratx = (1.0 .- exp(-(x))) ./ (1.0 .+ exp(-(x)));

%ratx = sign(x) .* (1.0 .- exp(-abs(x))) ./ (1.0 .+ exp(-abs(x)));


