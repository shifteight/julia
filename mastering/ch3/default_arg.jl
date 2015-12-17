f(x, p=0.0) = exp(p*x) * sin(x);
t = linspace(0.0, 8pi);
w = zeros(length(t));
for i = 1:length(w)
	w[i] = f(t[i], 0.1)
end
using Winston
plot(t, w)