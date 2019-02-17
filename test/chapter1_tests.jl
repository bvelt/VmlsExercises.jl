
@testset "two vectors are equal if they have the same size and each element is the same" begin
    n = 4
    a = ones(n)
    b = ones(n)
    c = zeros(n)
    @test a == a
    @test a == b
    @test a != c
    @test copy(a) == a
end

@testset "vector can be assigned to more than one variable" begin
    a = ones(4)
    b = a
    a[1] = 0
    @test a == b
end

@testset "two or more vectors can be concatenated using semicolon as delimiter" begin
    n = 3
    a = ones(n)
    b = zeros(n)
    c = [a; b]
    @test length(c) == 2n
    @test c[1:n] == a
    @test c[n+1:end] == b
end

@testset "unit_vector is vector with all elements equal to zero except one element equal to one" begin
    n = 3
    i = 1
    ei = unit_vector(i,n)
    @test length(ei) == n
    @test ei[i] == 1
    [@test ei[x] == 0 for x = 1:n if x != i]
end

@testset "slice of vector is copy" begin
    n = 5
    i = 3
    a = ones(n)
    b = a[i:end]
    a[i] = 0
    @test b[1] == 1
end

@testset "nonzero_count counts number of elements in vector whose value is not equal to zero" begin
    @testset "vector with no elements should have nonzero_count equal to zero" begin
        @test nonzero_count(zeros(0)) == 0
    end
    @testset "vector with all zeros should have nonzero_count equal to zero" begin
        @test nonzero_count(zeros(5)) == 0
    end
    @testset "vector with some nonzero elements should have nonzero_count equal to number of nonzero elements" begin
        @test nonzero_count([0,1,2,3,4]) == 4
    end
end
