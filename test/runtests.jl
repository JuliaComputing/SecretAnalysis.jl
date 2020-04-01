using SecretAnalysis
using Test

@testset "pi estimation" begin
    @test 0 <= estimate_pi(1) <= 4
    @test 0 <= estimate_pi(10) <= 4
    @test_throws ArgumentError estimate_pi(0)
end
