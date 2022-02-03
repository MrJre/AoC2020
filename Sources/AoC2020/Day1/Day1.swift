import Foundation

func day1part1(input: [Int]) -> Int
{
    var pair = (0,0)
    let sorted = input.sorted(by: <)
    for smallNumber in sorted {
        for largeNumber in sorted.reversed() {
            
            if smallNumber + largeNumber == 2020 {
                pair = (smallNumber, largeNumber)
            }
            
            if smallNumber + largeNumber < 2020 {
                break
            }
        }
    }
    
    return pair.0 * pair.1
}

func day1part2(input: [Int]) -> Int
{
    var triple = (0,0,0)
    let sorted = input.sorted(by: <)
    for smallNumber in sorted {
        for largeNumber in sorted.reversed() {
            
            if smallNumber + largeNumber < 2020 {
                if let third = input.first(where: { $0 == 2020 - smallNumber - largeNumber }) {
                    triple = (smallNumber, largeNumber, third)
                }
            }
        }
    }
    
    return triple.0 * triple.1 * triple.2
}
