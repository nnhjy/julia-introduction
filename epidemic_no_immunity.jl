using Colors
using Plots

"Enumerate possible states of a single cell"
@enum InfectionStatus uninfected infected dead recovered

"Data structure containing the infection status of a cell"
mutable struct Cell
    status::InfectionStatus
    infection_time::Int8
end

"""Simulate an interaction between two cells. In the other cell is
   infected, it may infect the this cell.
"""
function interact!(this_cell::Cell, other_cell::Cell, infection_rate)
    if this_cell.status == uninfected && other_cell.status == infected
        if rand(1)[1] < infection_rate
            this_cell.status = infected
            this_cell.infection_time = 0
        end
    end
end

"Show the cell as an empty or a filled in box for quick viewing"
function Base.show(io::IO, cell::Cell)
    if cell.status == infected
        print(io, "◼")
    else
        print(io, "◻")
    end
end

"show an array of cells as filled or empty rectangle characters"
function Base.show(io::IO, cells::Array{Cell, 2})
    Nx = size(cells)[1]
    Ny = size(cells)[2]
    
    # Iterate over rows and columns separately
    for j in 1:Ny
        for i in 1:Nx
            print(cells[i,j])
        end
    print('\n')
    end    
end


"Map the cells to colors for plotting"
function to_colors(cell)
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
end

"""
Run the interaction between one cell and a neighbour.

If the neighbour is infected, it infect this cell with the propability parameters.infection_rate.
"""
function interact!(new_cell, other_cell, parameters::Parameters)
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
function update!(cells, infection_rate)
    # Create a copy to remember the old state
    old_cells = deepcopy(cells)
    
    # Find the number of cells in each direction
    Nx = size(cells)[1]
    Ny = size(cells)[2]    
    
    # Loop over pairs of cells in the same row. There are Nx-1 pairs.
    for j in 1:Ny
        # loop over all columns
        for i in 1:Nx-1
            interact!(cells[i,j], old_cells[i+1,j], infection_rate)
            interact!(cells[i+1,j], old_cells[i,j], infection_rate)
        end
    end

    # Loop over pairs of cells in the same row. There are Nx-1 pairs.
    for j in 1:Ny-1
        # loop over all columns
        for i in 1:Nx
            interact!(cells[i,j], old_cells[i,j+1], infection_rate)
            interact!(cells[i,j+1], old_cells[i,j], infection_rate)
        end
    end
end

"Count the current number of infections"
function count_infections(cells::Matrix{})
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
function count_deaths(cells::Matrix{})
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


