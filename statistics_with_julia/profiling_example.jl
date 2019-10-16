using Statistics

@time begin
    data = Float64[]
    for i in 1:10^6
        group = Float64[]
        for j in 1:5*100
            push!(group, rand())
        end
        push!(data, mean(group))
    end
    println("98% of the means lie in the estimated range: ",
    (quantile(data, 0.01), quantile(data, 0.99)))
end

@time begin
    data = [mean(rand(5*100)) for _ in 1:10^6]
    println("98% of the means lie in the estimated range: ",
    (quantile(data, 0.01), quantile(data, 0.99)))
end