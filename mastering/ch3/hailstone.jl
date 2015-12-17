function hailstone(n)
	k = 1
	a = [n]
	while n > 1
		n = (n % 2 == 0) ? n >> 1 : 3n + 1
		push!(a, n)
		k += 1
	end

	return (k, a)
end

for i = 1000:1000:6000
	(m, s) = hailstone(i)
	println("hailstone($i) => $m iterations")
end