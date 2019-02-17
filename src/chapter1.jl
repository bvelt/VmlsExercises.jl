
function unit_vector(i::T, n::T) where T<:Integer
    [zeros(i-1); 1; zeros(n-i)]
end

function nonzero_count(a::AbstractArray)
    length(findall(!iszero, a))
end

function linear_combination(coefficients, vectors)
    @assert length(coefficients) == length(vectors) "length of coefficients and vectors must be equal"
    sum(coefficients[i] * vectors[i] for i = 1:length(coefficients))
end
