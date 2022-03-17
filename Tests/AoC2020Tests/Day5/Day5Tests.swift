//
//  File.swift
//  
//
//  Created by Jerry Tromp on 17/02/2022.
//

import Foundation
import XCTest
@testable import AoC2020

final class Day5Tests: XCTestCase {
    
    func testExample() throws {
        let data = "FBFBBFFRLR"
        let input = parseDay5Input(from: data)
        
        XCTAssertEqual(day5part1(input: input), 357)
    }
    
    func testRow() throws {
        let data = "FBFBBFF"
        
        XCTAssertEqual(resolve(arrangement: data, range: 0..<128).lowerBound, 44)
    }
    
    func testColumn() throws {
        let data = "RLR"
        XCTAssertEqual(resolve(arrangement: data, range: 0..<8).lowerBound, 5)
    }
}
    
