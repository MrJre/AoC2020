import Foundation

func parseDay4Input(from file: String) -> [[String:String]] {
    let passportStrings = file.components(separatedBy: "\n\n")
    
    let passports: [[String:String]] = passportStrings.map {
        let passportAttributes = $0.replacingOccurrences(of: "\n", with: " ").split(separator: " ")
        
        let passport: [(String, String)] = passportAttributes.map {
            let kvpair = $0.split(separator: ":").map(String.init)
            return (kvpair[0], kvpair[1])
        }
        return passport.reduce([String: String]()) {
            var dict = $0
            dict[$1.0] = $1.1
            return dict
        }
    }
    
    return passports
}


