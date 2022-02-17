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
    input
        .filter(isPart1Valid)
        .filter(isBirthYearValid)
        .filter(isIssueYearValid)
        .filter(isExpirationYearValid)
        .filter(isHeightValid)
        .filter(isHairColorValid)
        .filter(isEyeColorValid)
        .filter(isPassportIdValid)
        .count
}

func isHeightValid(passport: [String: String]) -> Bool {
    guard let hgt = passport["hgt"] else { return false }
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

func isHairColorValid(passport: [String: String]) -> Bool {
    guard let hcl = passport["hcl"] else { return false }
    return hcl.contains("#") && hcl.count == 7 && hcl.trimmingCharacters(in: .decimalDigits.union(CharacterSet(["a","b","c","d","e","f","#"]))).count == 0
}

func isEyeColorValid(passport: [String: String]) -> Bool {
    guard let ecl = passport["ecl"] else { return false }
    return ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(ecl)
}

func isPassportIdValid(passport: [String: String]) -> Bool {
    guard let pid = passport["pid"] else { return false }
    return pid.count == 9 && pid.trimmingCharacters(in: .decimalDigits).count == 0
}

func isBirthYearValid(passport: [String: String]) -> Bool {
    guard let year = passport["byr"] else { return false }
    return isYearValid(year: year, range: 1920...2002)
}

func isIssueYearValid(passport: [String: String]) -> Bool {
    guard let year = passport["iyr"] else { return false }
    return isYearValid(year: year, range: 2010...2020)
}

func isExpirationYearValid(passport: [String: String]) -> Bool {
    guard let year = passport["eyr"] else { return false }
    return isYearValid(year: year, range: 2020...2030)
}


private func isYearValid(year: String, range: ClosedRange<Int>) -> Bool {
    guard let year = Int(year) else { return false }
    return range ~= year
}
