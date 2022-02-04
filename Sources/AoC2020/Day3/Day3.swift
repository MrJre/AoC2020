import Foundation

struct GeologyGrid {
    let map: [Character]
    let width: Int
    var height: Int { map.count / width }
}

func day3part1(input: GeologyGrid) -> Int {
    calcNumberOfTrees(in: input, given: (3, 1))
}

func day3part2(input: GeologyGrid) -> Int {
    let slopes = [(1,1), (3,1), (5,1), (7,1), (1,2)]
    return slopes.reduce(1) { $0 * calcNumberOfTrees(in: input, given: $1) }
}

func calcNumberOfTrees(in grid: GeologyGrid, given slope: (x: Int, y: Int)) -> Int {
    var treeCount = 0
    var x = slope.x
    var y = slope.y
    
    while y < grid.height {
        if grid.map[y * grid.width + x % grid.width] == "#" {
            treeCount += 1
        }
        x += slope.x
        y += slope.y
    }
    return treeCount
}
