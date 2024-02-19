using Test
using Epidemic

@testset "Test certain infection" begin
    plant1 = Plant(Epidemic.uninfected, 0)
    plant2 = Plant(Epidemic.infected, 0)
    interact!(plant1, plant2, 1)
    @test plant1.status == Epidemic.infected
end