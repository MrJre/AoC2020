//
//  File.swift
//  
//
//  Created by Jerry Tromp on 03/02/2022.
//

import Foundation


func parseDay2Input(from file: String) -> [Password] {
    return file.split(separator: "\n").map {
        let components = $0.split(separator: " ")
        
        let rangeString = components[0].split(separator: "-")
        let lower = Int(rangeString[0])!
        let higher = Int(rangeString[1])!
        
        let char = components[1].split(separator: ":").first!.first!
        let phrase = String(components[2])
        
        return Password(lower: lower, higher: higher, char: char, phrase: phrase)
    }
}


