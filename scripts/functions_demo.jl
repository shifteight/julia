# unicode can be used for function names
Σ(x, y) = x + y
# print(Σ(2, 3))

function g(x, y)
    return x * y
    x + y
end

function f(x, y)::Int8
    return x * y
end

# first-class functions
function create_adder(x)
	adder = function(y)
		return x + y
	end
	return adder
end
