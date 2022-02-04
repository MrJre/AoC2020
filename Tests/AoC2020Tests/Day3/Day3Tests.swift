//
//  File.swift
//  
//
//  Created by Jerry Tromp on 04/02/2022.
//

import Foundation
import XCTest
@testable import AoC2020

final class Day3Tests: XCTestCase {
    
    func testExamplePart1() throws {
        let data = """
            ..##.......
            #...#...#..
            .#....#..#.
            ..#.#...#.#
            .#...##..#.
            ..#.##.....
            .#.#.#....#
            .#........#
            #.##...#...
            #...##....#
            .#..#...#.#
            """

        let input = parseDay3Input(from: data)
        
        let result = day3part1(input: input)
        XCTAssertEqual(result, 7)
    }
    
    func testExamplePart2() throws {
        let data = """
            ..##.......
            #...#...#..
            .#....#..#.
            ..#.#...#.#
            .#...##..#.
            ..#.##.....
            .#.#.#....#
            .#........#
            #.##...#...
            #...##....#
            .#..#...#.#
            """

        let input = parseDay3Input(from: data)
        
        let result = day3part2(input: input)
        XCTAssertEqual(result, 336)
    }
}
