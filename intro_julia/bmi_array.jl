heights = rand(Float64, 1000)
weights = rand(Float64, 1000)

heights = heights .* (1.8 - 1.5) .+ 1.5
weights = weights .* (100 - 30) .+ 30

bmi(w, h) = w / (h ^ 2)

indexes = broadcast(bmi, weights, heights)

# 对BM ! 指数 进行分类
# 1 - 体重过低, 2 - 正常范围, 3 - 肥胖前期,
# 4 - I度肥胖, 5 = II度肥胖, 6 - III度肥胖
function bmi_category(index::Float64)
    class = 0
    if index < 18.5
    	class = 1
    elseif index < 24
    	class = 2
    elseif index < 28
    	class = 3
    elseif index < 30
    	class = 4
    elseif index < 40
    	class = 5
    else
    	class = 6
    end

    class
end

classes = bmi_category.(indexes)

for c in [1 2 3 4 5 6]
	n = count(x -> (x == c), classes)
	println("category ", c, " ", n)
end