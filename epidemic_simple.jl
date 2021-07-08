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
Simulate interaction between 2 neighbouring cells. If one is infected, it can infect
the other.
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

"Update the simulation one time step"
function update!(cells, infection_rate::Real=0.1)
    # Create a copy to hold the old state
    old_cells = deepcopy(cells)

    # Loop over pairs of cells in the same row. There are size(cells)[1] columns, and size(cells)[1]-1 pairs.
    for i in 1:size(cells)[1]-1
        # loop over all columns
        for j in 1:size(cells)[2]
            # So the cells are (i+1,j) and (i,j)
            cells[i,j] = interact(cells[i,j], old_cells[i+1,j])
            cells[i+1,j] = interact(cells[i+1,j], old_cells[i,j])
        end
    end

    # Then loop over pairs in the same columns.
    for i in 1:size(cells)[1]
        # loop over all columns
        for j in 1:size(cells)[2]-1
            # So the cells are (i,j+1) and (i,j)
            cells[i,j] = interact(cells[i,j], old_cells[i,j+1])
            cells[i,j+1] = interact(cells[i,j+1], old_cells[i,j])
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