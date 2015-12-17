function g(a, b, c...)
	n = length(c)
	if n > 0 then
		x = zeros(n)
		for i = 1:n
			x[i] = a + b*c[i]
		end
		return x
	else
		return nothing
	end
end

println(g(1., 2.))
println(g(1., 2., 3., 4.))
println(g(1., 2., 4//5, 5//7))