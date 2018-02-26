struct Point{T}
    x::T
    y::T
end

Point{Float64} <: Point
Point{AbstractString} <: Point

Point{Float64} <: Point{Int64}
Point{Float64} <: Point{Real}

function norm(p::Point{<:Real})
    sqrt(p.x^2 + p.y^2)
end