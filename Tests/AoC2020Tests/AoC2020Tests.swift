import XCTest
@testable import AoC2020

final class AoC2020Tests: XCTestCase {
    func testDay1Part1() throws {
        let file = file(forDay: 1)
        let input = parseDay1Input(from: file)
        
        let result = day1part1(input: input)
        XCTAssertEqual(result, 471019)
    }
    
    func testDay1Part2() throws {
        let file = file(forDay: 1)
        let input = parseDay1Input(from: file)
        
        let result = day1part2(input: input)
        XCTAssertEqual(result, 103927824)
    }
    
    
}

func file(forDay day: Int) -> String {
    let url = Bundle.module.url(forResource: "Day\(day)", withExtension: ".txt")
    return try! String(contentsOf: url!)
}
