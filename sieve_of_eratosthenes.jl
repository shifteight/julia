function es(n::Int)
  isprime = ones(Bool, n)
  isprime[1] = false
  for i in 2:round(Int, sqrt(n))
    if isprime[i]
      for j in (i*i):i:n
        isprime[j] = false
      end
    end
  end
  return filter(x -> isprime[x], 1:n)
end
println(es(100))
@time length(es(10^7))
