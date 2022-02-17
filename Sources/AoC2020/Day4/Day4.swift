import Foundation

func day4part1(input: [[String: String]]) -> Int {
    input.filter(isPart1Valid).count
}

private func isPart1Valid(passport: [String: String]) -> Bool {
    switch passport.count {
        case 8: return true
        case 7: return passport["cid"] == nil
        default: return false
    }
}

func day4part2(input: [[String: String]]) -> Int {
    input.filter(isPart2Valid).count
}


private func isPart2Valid(passport: [String: String]) -> Bool {
    guard isPart1Valid(passport: passport) else { return false }
    
    var result = true
    passport.forEach { par in
        switch par.key {
            case "byr": result = result && isBirthYearValid(year: par.value)
            case "iyr": result = result && isIssueYearValid(year: par.value)
            case "eyr": result = result && isExpirationYearValid(year: par.value)
            case "hgt": result = result && isHeightValid(hgt: par.value)
            case "hcl": result = result && isHairColorValid(hcl: par.value)
            case "ecl": result = result && isEyeColorValid(ecl: par.value)
            case "pid": result = result && isPassportIdValid(pid: par.value)
            default: break
        }
    }
    
    return result
}

func isHeightValid(hgt: String) -> Bool {
    if hgt.contains("in") {
        guard let hgt = Int(hgt.components(separatedBy: "in")[0]) else { return false }
        return 59...76 ~= hgt
    }
    if hgt.contains("cm") {
        guard let hgt = Int(hgt.components(separatedBy: "cm")[0]) else { return false }
        return 150...193 ~= hgt
    }
    return false
}

func isHairColorValid(hcl: String) -> Bool {
    guard hcl.contains("#"), hcl.count == 7 else { return false }
    return hcl.trimmingCharacters(in: .decimalDigits.union(CharacterSet(["a","b","c","d","e","f","#"]))).count == 0
}

func isEyeColorValid(ecl: String) -> Bool {
    ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(ecl)
}

func isPassportIdValid(pid: String) -> Bool {
    return pid.count == 9 && pid.trimmingCharacters(in: .decimalDigits).count == 0
}

func isBirthYearValid(year: String) -> Bool {
    isYearValid(year: year, range: 1920...2002)
}

func isExpirationYearValid(year: String) -> Bool {
    isYearValid(year: year, range: 2020...2030)
}

func isIssueYearValid(year: String) -> Bool {
    isYearValid(year: year, range: 2010...2020)
}

private func isYearValid(year: String, range: ClosedRange<Int>) -> Bool {
    guard let year = Int(year) else { return false }
    return range ~= year
}
