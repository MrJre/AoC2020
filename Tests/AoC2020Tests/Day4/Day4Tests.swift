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
        let passport = ["byr": "2002"]
        XCTAssertTrue(isBirthYearValid(passport: passport))
    }
    
    func testBirthYearIsInvalid() {
        let passport = ["byr": "2003"]
        XCTAssertFalse(isBirthYearValid(passport: passport))
    }
    
    func testIssueYearIsValid() {
        let passport = ["iyr": "2020"]
        XCTAssertTrue(isIssueYearValid(passport: passport))
    }
    
    func testIssueYearIsInvalid() {
        let passport = ["iyr": "2021"]
        XCTAssertFalse(isIssueYearValid(passport: passport))
    }
    
    func testExpirationYearIsValid() {
        let passport = ["eyr": "2021"]
        XCTAssertTrue(isExpirationYearValid(passport: passport))
    }
    
    func testExpirationYearIsInvalid() {
        let passport = ["eyr": "2033"]
        XCTAssertFalse(isExpirationYearValid(passport: passport))
    }
    
    
    func testHeightInInchIsValid() {
        let passport = ["hgt": "60in"]
        XCTAssertTrue(isHeightValid(passport: passport))
    }
    
    func testHeightInInchIsInvalid() {
        let passport = ["hgt": "190in"]
        XCTAssertFalse(isHeightValid(passport: passport))
    }
    
    func testHeightInCmIsValid() {
        let passport = ["hgt": "190cm"]
        XCTAssertTrue(isHeightValid(passport: passport))
    }
    
    func testHeightInCmIsInvalid() {
        let passport = ["hgt": "194cm"]
        XCTAssertFalse(isHeightValid(passport: passport))
    }
    
    func testHairColorIsValid() {
        let passport = ["hcl": "#123abc"]
        XCTAssertTrue(isHairColorValid(passport: passport))
    }
    
    func testHairColorIsInvalid() {
        let passport = ["hcl": "#123abz"]
        XCTAssertFalse(isHairColorValid(passport: passport))
    }
    func testHairColorIsInvalidWithoutPound() {
        let passport = ["hcl": "123abz"]
        XCTAssertFalse(isHairColorValid(passport: passport))
    }
    
    func testEyeColorIsValid() {
        let passport = ["ecl": "brn"]
        XCTAssertTrue(isEyeColorValid(passport: passport))
    }
    
    func testEyeColorIsInvalid() {
        let passport = ["ecl": "prl"]
        XCTAssertFalse(isEyeColorValid(passport: passport))
    }
    
    func testPassportIsValid() {
        let passport = ["pid": "000000001"]
        XCTAssertTrue(isPassportIdValid(passport: passport))
    }
    
    func testPassportIsInvalid() {
        let passport = ["pid": "0123456789"]
        XCTAssertFalse(isPassportIdValid(passport: passport))
    }
    
    func testPart2InvalidPassports() {
        let data = """
            eyr:1972 cid:100
            hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

            iyr:2019
            hcl:#602927 eyr:1967 hgt:170cm
            ecl:grn pid:012533040 byr:1946

            hcl:dab227 iyr:2012
            ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

            hgt:59cm ecl:zzz
            eyr:2038 hcl:74454a iyr:2023
            pid:3556412378 byr:2007
            """
        
        let input = parseDay4Input(from: data)
        
        XCTAssertEqual(day4part2(input: input), 0)
    }
    
    func testPart2ValidPassports() {
        let data = """
            pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
            hcl:#623a2f

            eyr:2029 ecl:blu cid:129 byr:1989
            iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

            hcl:#888785
            hgt:164cm byr:2001 iyr:2015 cid:88
            pid:545766238 ecl:hzl
            eyr:2022

            iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
            """
        
        let input = parseDay4Input(from: data)
        
        XCTAssertEqual(day4part2(input: input), 4)
    }
}
    
