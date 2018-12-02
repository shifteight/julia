function es(n::Int)
  isprime = trues(n)  # n-element vector of true-s
  isprime[1] = false
  for i in 2:isqrt(n)
    if isprime[i]
      for j in i^2:i:n
        isprime[j] = false
      end
    end
  end
  return filter(x -> isprime[x], 1:n)
end
println(es(100))
@time length(es(10^7))
