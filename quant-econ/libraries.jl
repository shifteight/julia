# The object-oriented API

## subplots

using PyPlot
x = linspace(0, 10, 200)
y = sin(x)
fig, ax = subplots()
ax[:plot](x, y, "r-", linewidth=2, label=L"$y = \sin(x)$", alpha=0.6)
ax[:legend](loc="upper center")

using Distributions
u = Uniform()
fig, ax = subplots()
x = linspace(-4, 4, 150)
for i in 1:3
  # == Compute normal pdf from randomly generated mean and std == #
  m, s = rand(u) * 2 - 1, rand(u) + 1
  d = Normal(m, s)
  y = pdf(d, x)
  # == Plot current pdf == #
  ax[:plot](x, y, linewidth=2, alpha=0.6, label="draw $i")
end
ax[:legend]()

## multiple subplots
num_rows, num_cols = 3, 2
fig, axes = subplots(num_rows, num_cols, figsize=(8, 12))
subplot_num = 0

for i in 1:num_rows
  for j in 1:num_cols
    ax = axes[i, j]
    subplot_num += 1
    # -- generate a normal sample with random mean and std
    m, s = rand(u) * 2 - 1, rand(u) + 1
    d = Normal(m, s)
    x = rand(d, 100)
    # -- histogram the sample
    ax[:hist](x, alpha=0.6, bins=20)
    ax[:set_title]("histogram $subplot_num")
    ax[:set_xticks]([-4, 0, 4])
    ax[:set_yticks]([])
  end
end

# optimization, root finding
using Roots
f(x) = sin(4 * (x - 1/4)) + x + x ^ 20 - 1
newton(f, 0.2)
newton(f, 0.7) # failure of convergence for some initial conditions
fzero(f, 0, 1) # more robust "hybird method"

using Optim
optimize(x -> x^2, -1.0, 1.0)

# numerical integration
quadgk(x -> cos(x), -2pi, pi)
using QuantEcon
nodes, weights = qnwlege(65, -2pi, pi)
integral = do_quad(x -> cos(x), nodes, weights)
@time quadgk(x -> cos(x), -2pi, pi)
@time do_quad(x -> cos(x), nodes, weights)