function f(x)
  println("Generic function invoked")
end

function f(x::Number)
  println("Number method invoked")
end

function f(x::Integer)
  println("Integer method invoked")
end

type Foo end
foo = Foo()
typeof(foo)
+(x::Foo, y::Foo) = "twofoos"
foo1, foo2 = Foo(), Foo()
foo1 + foo2
+(foo1, foo2)

foofunc(x::Foo) = "onefoo"
foofunc(foo)


using Distributions

type AR1
  a::Real
  b::Real
  sigma::Real
  phi::Distribution
end

m = AR1(0.9, 1, 1, Beta(5, 5))
m.a, m.b, m.sigma, m.phi
typeof(m.phi)
m.phi = Exponential(0.5)
m

typeof([10, 20, 30])

# parameteric types
type FooBar{T}
  foo::T
  bar::T
end

fb = FooBar(1.0, 2.0)
fb = FooBar(1, 2)
fb = FooBar(1, 2.0)

# how to write fast code
function sum_float_array(x::Array{Float64, 1})
  sum = 0.0
  for i in 1:length(x)
    sum += x[i]
  end
  return sum
end
x_float = linspace(0, 1, int(1e6))
@time sum_float_array(x_float)

function sum_array(x)
  sum = 0.0
  for i in 1:length(x)
    sum += x[i]
  end
  return sum
end
@time sum_array(x_float)

n = int(1e6)
x_any = {1/i for i in 1:n}
eltype(x_any)
@time sum_array(x_any)

# simulate an AR1 serires

function simulate(m::AR1, n::Integer, x0::Real)
  ts = Array(Float64, n)
  ts[1] = x0
  for i in 2:n
    ts[i] = m.a * ts[i-1] + m.b + m.sigma * rand(m.phi)
  end
  return ts
end

ts = simulate(m, 100, 1.0)

using PyPlot
plot(ts)

# generate a chi-squared random variable with degree of freedom k
function f(k::Integer)
  @assert k > 0 "k must be a natural number"
  z = randn(k)
  return sum(z .^ 2)
end
f(3)
f(3.5)
f(-2)

function f{T <: Integer}(k_vec::Array{T, 1})
  for k in k_vec
    @assert k > 0 "Each integer must be a natural number"
  end
  n = length(k_vec)
  draws = Array(Float64, n)
  for i in 1:n
    z = randn(k_vec[i])
    draws[i] = sum(z .^ 2)
  end
  return draws
end

f([2, 4, 6])
f(2)
@which(f(2))
@which(f([2,3]))
