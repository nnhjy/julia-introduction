module Epidemic
export greet
export InfectionStatus, uninfected, infected, dead, recovered, immune
export Plant, Parameters
export make_plants, to_colors
export interact!, update!
export count_infections, count_deaths

greet() = print("Hello World!")

using Plots

"Enumerate possible states of a single plant"
@enum InfectionStatus uninfected infected dead recovered immune

"Data structure containing the infection status of a plant"
mutable struct Plant
    status::InfectionStatus
    infection_time::Int8
end

"Parameters for a simulation"
mutable struct Parameters
    infection_rate::Float32
    death_probability::Float32
    recovery_time::Int8
    immunity_rate::Float32
end

"Create a map of immune and uninfected plants with 1 infected in the middle."
function make_plants(width::Integer=7, height::Integer=7, immunity_rate::Float64=0.0)
    plants = Matrix{Plant}(undef, width, height)
    for i in 1:size(plants)[1]
        for j in 1:size(plants)[2]
            if rand(1)[1] < immunity_rate
                plants[i,j] = Plant(immune, 0)
            else
                plants[i,j] = Plant(uninfected, 0)
            end
        end
    end
    plants[width÷2+1,height÷2+1] = Plant(infected, 0)
    return plants
end

"Show the plant as an empty or a filled in box for quick viewing"
function Base.show(io::IO, plant::Plant)
    if plant.status == infected
        print(io, "◼")
    else
        print(io, "◻")
    end
end

"Map the plants to colors for plotting"
function to_colors(plant::Plant)
    if plant.status == uninfected
        return XRGB(0.0,0.8,0.0)
    end
    if plant.status == infected
        return XRGB(0.8,0.0,0.0)
    end
    if plant.status == dead
        return XRGB(0.1,0.1,0.1)
    end
    if plant.status == recovered
        return XRGB(0.0,0.0,0.8)
    end
    if plant.status == immune
        return XRGB(0.2,0.2,1.0)
    end
end

"""
Simulate the interaction between one plant and a neighbour.

If the neighbour is infected, it infect this plant with the propability parameters.infection_rate.
"""
function interact!(new_plant::Plant, other_plant::Plant, infection_rate)
    if new_plant.status == uninfected && other_plant.status == infected
        if rand(1)[1] < infection_rate
            new_plant.status = infected
            new_plant.infection_time = 0
        end
    end
end

"""
Update a single plant, not accounting for it's interactions with the neighbours.
"""
function update!(new_plant::Plant, recovery_time, death_rate)
    if new_plant.status == infected
        # Increase the number of time steps since infection
        new_plant.infection_time += 1

        # Check if the plant recovers
        if new_plant.infection_time > recovery_time
            new_plant.status = recovered
        end

        # Check if it dies
        if rand(1)[1] < death_rate
            new_plant.status = dead
        end
    end
end

"""
Update the plants in the 2D array of plants, using given parameters.
"""
function update!(plants::Matrix{Plant}, recovery_time, death_rate, infection_rate)
    old_plants = deepcopy(plants)
    for i in 1:size(plants)[1]
        for j in 1:size(plants)[2]
            update!(plants[i,j], recovery_time, death_rate)
        end
    end
    for i in 1:size(plants)[1]-1
        for j in 1:size(plants)[2]
            interact!(plants[i,j], old_plants[i+1,j], infection_rate)
            interact!(plants[i+1,j], old_plants[i,j], infection_rate)
        end
    end
    for i in 1:size(plants)[1]
        for j in 1:size(plants)[2]-1
            interact!(plants[i,j], old_plants[i,j+1], infection_rate)
            interact!(plants[i,j+1], old_plants[i,j], infection_rate)
        end
    end
end

"Count the current number of infections"
function count_infections(plants::Matrix{Plant})
    infections = 0
    for i in 1:size(plants)[1]
        for j in 1:size(plants)[2]
            if plants[i,j].status == infected
                infections += 1
            end
        end
    end
    return infections
end

"Count the number of dead plants"
function count_deaths(plants::Matrix{Plant})
    deaths = 0
    for i in 1:size(plants)[1]
        for j in 1:size(plants)[2]
            if plants[i,j].status == dead
                deaths += 1
            end
        end
    end
    return deaths
end

end # module Epidemic
