//
//  File.swift
//  
//
//  Created by Jerry Tromp on 17/02/2022.
//

import Foundation
import XCTest
@testable import AoC2020

final class Day4Tests: XCTestCase {
    
    func testParsing() {
        let data = """
            ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
            byr:1937 iyr:2017 cid:147 hgt:183cm

            iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
            hcl:#cfa07d byr:1929

            hcl:#ae17e1 iyr:2013
            eyr:2024
            ecl:brn pid:760753108 byr:1931
            hgt:179cm

            hcl:#cfa07d eyr:2025 pid:166559648
            iyr:2011 ecl:brn hgt:59in
            """
        
        let input = parseDay4Input(from: data)
        
        XCTAssertEqual(input.count, 4)
    }
    
    func testThatTestDataHasTwoValidPassports() {
        let data = """
            ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
            byr:1937 iyr:2017 cid:147 hgt:183cm

            iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
            hcl:#cfa07d byr:1929

            hcl:#ae17e1 iyr:2013
            eyr:2024
            ecl:brn pid:760753108 byr:1931
            hgt:179cm

            hcl:#cfa07d eyr:2025 pid:166559648
            iyr:2011 ecl:brn hgt:59in
            """
        
        let input = parseDay4Input(from: data)
        
        XCTAssertEqual(day4part1(input: input), 2)
    }
    
    func testBirthYearIsValid() {
        let year = "2002"
        XCTAssertTrue(isBirthYearValid(year: year))
    }
    
    func testBirthYearIsInvalid() {
        let year = "2003"
        XCTAssertFalse(isBirthYearValid(year: year))
    }
    
    func testIssueYearIsValid() {
        let year = "2020"
        XCTAssertTrue(isIssueYearValid(year: year))
    }
    
    func testIssueYearIsInvalid() {
        let year = "2021"
        XCTAssertFalse(isIssueYearValid(year: year))
    }
    
    func testExpirationYearIsValid() {
        let year = "2021"
        XCTAssertTrue(isExpirationYearValid(year: year))
    }
    
    func testExpirationYearIsInvalid() {
        let year = "2033"
        XCTAssertFalse(isExpirationYearValid(year: year))
    }
    
    
    func testHeightInInchIsValid() {
        let hgt = "60in"
        XCTAssertTrue(isHeightValid(hgt: hgt))
    }
    
    func testHeightInInchIsInvalid() {
        let hgt = "190in"
        XCTAssertFalse(isHeightValid(hgt: hgt))
    }
    
    func testHeightInCmIsValid() {
        let hgt = "190cm"
        XCTAssertTrue(isHeightValid(hgt: hgt))
    }
    
    func testHeightInCmIsInvalid() {
        let hgt = "194cm"
        XCTAssertFalse(isHeightValid(hgt: hgt))
    }
    
    func testHairColorIsValid() {
        let hcl = "#123abc"
        XCTAssertTrue(isHairColorValid(hcl: hcl))
    }
    
    func testHairColorIsInvalid() {
        let hcl = "#123abz"
        XCTAssertFalse(isHairColorValid(hcl: hcl))
    }
    func testHairColorIsInvalidWithoutPound() {
        let hcl = "123abz"
        XCTAssertFalse(isHairColorValid(hcl: hcl))
    }
    
    func testEyeColorIsValid() {
        let ecl = "brn"
        XCTAssertTrue(isEyeColorValid(ecl: ecl))
    }
    
    func testEyeColorIsInvalid() {
        let ecl = "prl"
        XCTAssertFalse(isEyeColorValid(ecl: ecl))
    }
    
    func testPassportIsValid() {
        let pid = "000000001"
        XCTAssertTrue(isPassportIdValid(pid: pid))
    }
    
    func testPassportIsInvalid() {
        let pid = "0123456789"
        XCTAssertFalse(isPassportIdValid(pid: pid))
    }
}
    
