module epidemic_simple
export make_cells, to_colors, update!, count_infections, count_deaths

"Create a 2D array of cells with 1 infected cell in the middle"
function make_cells(width::Int8=7, height::Int8=7)
    cells = Matrix{Int8}(undef, width, height)
    for i in 1:size(cells)[1]
        for j in 1:size(cells)[2]
            cells[i,j] = 0
        end
    end
    cells[width÷2+1,height÷2+1] = 1
    return cells
end

"Map the cells to colors for plotting"
function to_colors(cell::Int8)
    if cell == 0
        return RGB(0.0,0.8,0.0)
    end
    if cell.status == 1
        return RGB(0.8,0.0,0.0)
    end
end

"""
Run the interaction between one cell and a neighbour.

If the neighbour is infected, it infect this cell with the propability
parameters.infection_rate or, if this cell is recovered, parameters.reinfection_rate.
"""
function interact(cell, neighbour, infection_rate)
    new_cell = cell

    # Check if the cell is infected
    if neighbour == 1

        # Infect with probability 0.1
        if rand(1)[1] < infection_rate
            new_cell = 1
        end
    end

    return new_cell
end

"Update a single cell. Check all neighbours and call the interact function for each."
function update(old_cells, i, j, infection_rate)
    # Copy the current value before updating
    new_cell = old_cells[i,j]

    # Loop over each neighbour
    for (nb_i, nb_j) in [(i-1,j), (i+1,j), (i,j-1), (i,j+1)]

        # Handle boundaries. On boundary cells, some neighbours don't exist.
        if nb_i > size(old_cells)[1] || nb_i < 1
            continue
        end

        if nb_j > size(old_cells)[2] || nb_j < 1
            continue
        end

        new_cell = interact(new_cell, old_cells[nb_i, nb_j], infection_rate)
    end

    return new_cell
end


"Update the simulation one time step"
function update!(cells, infection_rate::Real=0.1)
    # Create a copy to hold the old state
    old_cells = deepcopy(cells)
    print(infection_rate)

    # Here we update the array, so we need to index it
    for i in 1:size(cells)[1]
        # Loop over each cell in a row
        for j in 1:size(cells)[2]

            cells[i,j] = update(old_cells, i, j, infection_rate)

        end
    end
end

"Count the current number of infections"
function count_infections(cells::Matrix{Int8})
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

# End module
end