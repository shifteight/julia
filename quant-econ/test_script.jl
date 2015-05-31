for i in 1:3
	println("i = $i")
end

using PyPlot
ts_length = 100
epsilon_values = randn(ts_length)
plot(epsilon_values, "b-")

typeof(epsilon_values)

x = [10, "foo", false]

words = ["foo", "bar"]
for word in words
  println("Hello $word")
end

function generate_data(n)
  epsilon_values = Array(Float64, n)
  for i = 1:n
    epsilon_values[i] = randn()
  end
  return epsilon_values
end

ts_length = 100
data = generate_data(ts_length)
plot(data, "b-")

using PyPlot
using Distributions

function plot_histogram(dist, n)
  epsilon_values = rand(dist, n)
  PyPlot.plt.hist(epsilon_values)
end

lp = Laplace()
plot_histogram(lp, 500)

function factorial2(n)
  result = 1
  for i = 2:n
    result = result * i
  end
  return result
end

factorial2(20)

# A binomial random number generator
# http://en.wikipedia.org/wiki/Binomial_distribution#Generating_binomial_random_variates
function binomial_rv(n, p)
  x = 0
  for i = 1:n
    if rand() < p
      x = x + 1
    end
  end
  return x
end

# Testing for above generator
# sample average should be close to n * p
function test_binom(n)
  sum = 0
  for i = 1:n
    sum = sum + binomial_rv(10, 0.2)
  end
  return sum / n
end

test_binom(1000)

# compute an approximation to PI using Monte Carlo
function get_pi(n)
  p = 0
  for i = 1:n
    x, y = rand(2)
    d = sqrt((x - 0.5) ^ 2 + (y - 0.5) ^ 2)
    if d < 0.5
      p = p + 1
    end
  end
  area = p / n
  return area / (0.5 ^ 2)
end

get_pi(1000000)

# simulate and plot the correlated time series
using PyPlot
T = 200
alpha = 0.9
x = zeros(T + 1)
for t in 1:T
  x[t + 1] = alpha * x[t] + randn()
end
plot(x, "b-")

alphas = [0.0, 0.8, 0.98]
T = 200
x = zeros(T + 1)

for alpha in alphas
  x[1] = 0
  for t in 1:T
    x[t + 1] = alpha * x[t] + randn()
  end
  plot(x, label="alpha = $alpha")
end
legend()

# define simple functions
f(x) = sin(1 / x)
f(1 / pi)

# anonymous functions
map(x -> sin(1 / x), randn(3))

# optional and keyword arguments
function f(x, a=1)
  return exp(cos(a * x))
end

f(pi)
f(pi, 2)

help(zip)

x_vals = [1, 2, 3]
y_vals = [1, 2, 3]
zip(x_vals, y_vals)
sum([x * y for (x, y) in zip(x_vals, y_vals)])

sum([x % 2 == 0 for x in 0:99])
sum(map(x -> x % 2 == 0, 0:99))

pairs = ((2, 5), (4, 2), (9, 8), (12, 10))
sum([x % 2 == 0 && y % 2 == 0 for (x, y) in pairs])

function count_capital(s)
  su = uppercase(s)
  sum([x == y && isalpha(x) && isalpha(y) for (x, y) in zip(s, su)])
end

count_capital("A22")
count_capital("Hello World")

help(enumerate)
p(x, coeff) = sum([c * x ^ (power - 1) for (power, c) in enumerate(coeff)])
p(2, [1, 2, 3])

function linapprox(f, a, b, n, x)
  #=
  Evalutes the piecewise linear interpolation of f at x on the interval
  [a, b], with n evenly spaced grid points.

  =#
  length_of_interval = b - a
  num_subintervals = n - 1
  step = length_of_interval / num_subintervals

  # === find first grid point larger than x === #
  point = a
  while point <= x
    point += step
  end

  # === x must lie between the grid points (point - step) and point === #
  u, v = point - step, point

  return f(u) + (x - u) * (f(v) - f(u)) / (v - u)
end

# test it
f(x) = x^2
g(x) = linapprox(f, -1, 1, 3, x)
using PyPlot
x_grid = linspace(-1, 1, 100)
y_vals = map(f, x_grid)
y_approx = map(g, x_grid)
plot(x_grid, y_vals, label="true")
plot(x_grid, y_approx, label="approximation")
legend()

cd("/Users/kevin/Work/julia")
pwd()

file = open("us_cities.txt", "r")
total = 0
for city in eachline(file)
  population = split(city, ":")[2]
  total += int(population)
end
close(file)
println("Total population = $total")

# Arrays

# shape and dimension
a = [10, 20, 30]
typeof(a)
a = ["foo", "bar", 10]
typeof(a)

typeof(linspace(0, 1, 100))

size(a)
ndims(a)

eye(3)
diagm([2,4])
size(eye(3))
a = [10, 20, 30, 40]
reshape(a, 2, 2)
a
reshape(a, 1, 4)

# collapse an array along one dimension
a = [1 2 3 4]
squeeze(a, 1)

# create an empty array by Array() constructor
# it generates just garbage values by default
x = Array(Float64, 2, 2)

ones(2, 2)
fill("foo", 2, 2)

a = [10 20 30]
ndims(a)

a = [10 20; 30 40]
size(a)

a = [1; 2; 3]
ndims(a)

a = [1 2 3]'
ndims(a)

a = collect(10:10:40)
a[end - 1]
a[1:3]

a = randn(2, 2)
b = [true false; false true]
a[b]

a = Array(Float64, 4)
a[2:end] = 42
a

# Arrays are passed by reference
a = ones(3)
b = a
b[3] = 4
a

a = ones(3)
b = copy(a)
b[3] = 4
a

# Array methods
a = [-1, 0, 1]
length(a)
sum(a)
mean(a)
std(a)
var(a)
maximum(a)
minimum(a)
b = sort(a, rev=true)
b === a
b = sort!(a, rev=true)
b === a

# matrix algebra
a = ones(1, 2)
b = ones(2, 2)
a * b
b * a'

A = [1 2; 2 3]
B = ones(2, 2)
A \ B
inv(A) * B

ones(2) * ones(2)
dot(ones(2), ones(2))

A = -ones(2, 2)
A .^ 2
A + ones(2, 2)
2A
a = [10, 20, 30]
b = [-100, 0, 100]
b .> a
a .== b
b .> 1

a = randn(4)
a .< 0
a[a .< 0]

# vectorized functions
log(1.0)
log(ones(4))

A = [1 2; 3 4]
det(A)
trace(A)
eigvals(A)
rank(A)
