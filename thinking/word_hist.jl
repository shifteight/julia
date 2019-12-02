function processfile(filename)
    hist = Dict()
    for line in eachline(filename)
    	processline(line, hist)
    end
    hist
end

function processline(line, hist)
	line = replace(line, '-' => ' ')
	for word in split(line)
	    word = string(filter(isletter, [word...])...)
	    word = lowercase(word)
	    hist[word] = get!(hist, word, 0) + 1
	end
end

function differentwords(hist)
    length(hist)
end

function totalwords(hist)
    sum(values(hist))
end

function mostcommon(hist)
    t = []
    for (key, value) in hist
    	push!(t, (value, key))
    end
    reverse(sort(t))
end

hist = processfile("emma.txt")
println("Total number of words: ", totalwords(hist))
println("Number of different words: ", differentwords(hist))

t = mostcommon(hist)
println("The most common words are:")
for (freq, word) in t[1:10]
	println(word, "\t", freq)
end