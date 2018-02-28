f(x::Float64, y::Float64) = 2x + y

f(x::Number, y::Number) = 2x - y

f(x, y) = println("Whoa there, Nelly.")

# Parametric Methods
same_type(x::T, y::T) where {T} = true
same_type(x, y) = false

myappend(v::Vector{T}, x::T) where {T} = [v..., x]

same_type_numeric(x::T, y::T) where {T<:Number} = true
same_type_numeric(x::Number, y::Number) = false