import Foundation

func day5part1(input: [String]) -> Int {
    input.map(calculateSeatId(pass:)).reduce(0, max)
}

func day5part2(input: [String]) -> Int {
    let seatIDs = input.map(calculateSeatId(pass:)).sorted(by: <)
    var current = seatIDs[0]
    var i = 1
    while seatIDs[i] == current + 1 {
        current = seatIDs[i]
        i += 1
    }
    
    return seatIDs[i] - 1
}

func calculateSeatId(pass: String) -> Int
{
    let row = pass.prefix(7)
    let column = pass.suffix(3)
    
    let rowNumber = resolve(arrangement: String(row), range: 0..<128).lowerBound
    let columnNumber = resolve(arrangement: String(column), range: 0..<8).lowerBound
    
    return rowNumber * 8 + columnNumber
}

func resolve(arrangement: String, range: Range<Int>) -> Range<Int>
{
    switch arrangement.first {
        case "F", "L": return resolve(arrangement: String(arrangement.dropFirst()), range: range.lowerBound..<range.upperBound - range.count / 2)
        case "B", "R": return resolve(arrangement: String(arrangement.dropFirst()), range: range.lowerBound + range.count / 2..<range.upperBound)
        default: return range
    }
}
