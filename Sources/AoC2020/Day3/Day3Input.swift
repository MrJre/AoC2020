func parseDay3Input(from file: String) -> GeologyGrid {
    let rows = file.split(separator: "\n")
    let grid = rows.flatMap { $0.compactMap { $0 } }
    
    return GeologyGrid(map: grid, width: rows.first!.count)
}

