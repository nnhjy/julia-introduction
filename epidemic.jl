module epidemic
export Cell, Parameters, create_map, to_colors, interact!, update, count_infections, count_deaths

"Enumerate possible states of a single cell"
@enum InfectionStatus uninfected infected dead recovered immune

"Data structure containing the infection status of a cell"
mutable struct Cell
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

"Create a map of immune and uninfected cells with 1 infected in the middle."
function make_cells(width::Integer=7, height::Integer=7, immunity_rate::Float32)
    cells = Matrix{Cell}(undef, width, height)
    for i in 1:size(cells)[1]
        for j in 1:size(cells)[2]
            if rand(1)[1] < immunity_rate
                cells[i,j] = Cell(immune, 0)
            else
                cells[i,j] = Cell(uninfected, 0)
            end
        end
    end
    cells[width÷2+1,height÷2+1] = 1
end

"Map the cells to colors for plotting"
function to_colors(cell::Cell)
    if cell.status == uninfected
        return RGB(0.0,0.8,0.0)
    end
    if cell.status == infected
        return RGB(0.8,0.0,0.0)
    end
    if cell.status == dead
        return RGB(0.1,0.1,0.1)
    end
    if cell.status == recovered
        return RGB(0.0,0.0,0.8)
    end
    if cell.status == immune
        return RGB(0.2,0.2,1.0)
    end
end

"""
Simulate the interaction between one cell and a neighbour.

If the neighbour is infected, it infect this cell with the propability parameters.infection_rate.
"""
function interact!(new_cell::Cell, other_cell::Cell, parameters::Parameters)
    if new_cell.status == uninfected && other_cell.status == infected
        if rand(1)[1] < parameters.infection_rate
            new_cell.status = infected
            new_cell.infection_time = 0
        end
    end
end

"""
Update a single cell, not accounting for it's interactions with the neighbours.
"""
function update!(new_cell::Cell, parameters::Parameters)
    if new_cell.status == infected
        # Increase the number of time steps since infection
        new_cell.infection_time += 1

        # Check if the cell recovers
        if new_cell.infection_time > parameters.recovery_time
            new_cell.status = recovered
        end

        # Check if it dies
        if rand(1)[1] < parameters.death_probability
            new_cell.status = dead
        end
    end
end

"""
Update the cells in the 2D array of Cells, using given parameters.
"""
function update!(cells::Matrix{Cell}, parameters::Parameters)
    old_cells = deepcopy(cells)
    for i in 1:size(cells)[1]
        for j in 1:size(cells)[2]
            update!(cells[i,j], parameters)
        end
    end
    for i in 1:size(cells)[1]-1
        for j in 1:size(cells)[2]
            interact!(cells[i,j], old_cells[i+1,j], parameters)
            interact!(cells[i+1,j], old_cells[i,j], parameters)
        end
    end
    for i in 1:size(cells)[1]
        for j in 1:size(cells)[2]-1
            interact!(cells[i,j], old_cells[i,j+1], parameters)
            interact!(cells[i,j+1], old_cells[i,j], parameters)
        end
    end
end

"Count the current number of infections"
function count_infections(cells::Matrix{Cell})
    infections = 0
    for i in 1:size(cells)[1]
        for j in 1:size(cells)[2]
            if cells[i,j].status == infected
                infections += 1
            end
        end
    end
    return infections
end

"Count the number of dead cells"
function count_deaths(cells::Matrix{Cell})
    deaths = 0
    for i in 1:size(cells)[1]
        for j in 1:size(cells)[2]
            if cells[i,j].status == dead
                deaths += 1
            end
        end
    end
    return deaths
end

# End module
end