module VmlsExercises

using LinearAlgebra, SparseArrays, VMLS

export
    unit_vector,
    nonzero_count,
    linear_combination,
    device_temperature_model,
    device_max_power_at_temp_ceiling

include("chapter1.jl")
include("chapter2.jl")

end # module
