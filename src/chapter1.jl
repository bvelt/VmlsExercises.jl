
function unit_vector(i::T, n::T) where T<:Integer
    [zeros(i-1); 1; zeros(n-i)]
end

function nonzero_count(a::AbstractArray)
    length(findall(!iszero, a))
end
