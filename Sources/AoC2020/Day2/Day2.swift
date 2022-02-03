//
//  File.swift
//  
//
//  Created by Jerry Tromp on 03/02/2022.
//

import Foundation

struct Password {
    let lower: Int
    let higher: Int
    let char: Character
    let phrase: String
}

func day2part1(input: [Password]) -> Int {
    input.filter { isPart1Valid(password: $0) }.count
}

func day2part2(input: [Password]) -> Int {
    input.filter { isPart2Valid(password: $0) }.count
}


func isPart1Valid(password: Password) -> Bool {
    let count = password.phrase.filter { password.char == $0 }.count
    return password.lower...password.higher ~= count
}

func isPart2Valid(password: Password) -> Bool {
    let phrase = password.phrase
    
    let lowerIndex = phrase.index(phrase.startIndex, offsetBy: password.lower - 1)
    let higherIndex = phrase.index(phrase.startIndex, offsetBy: password.higher - 1)
    
    let lowerChar: Character? = lowerIndex < phrase.endIndex ? phrase[lowerIndex] : nil
    let higherChar: Character? = higherIndex < phrase.endIndex ? phrase[higherIndex] : nil
    
    return (lowerChar == password.char || higherChar == password.char) && lowerChar != higherChar
}


