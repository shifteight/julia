# Returns a Gaussian variable with mean mu and 
# standard deviation sigma.

function h(x...; mu=0.0, sigma=1.0)
	n = length(x)
	(n == 0) ? (return nothing) : begin
		a = zeros(n);
		[a[i] = (mu + sigma*rand()) * x[i] for i = 1:n]
		a
	end
end

h(1.0, 2.0, 3.0, sigma=0.5)