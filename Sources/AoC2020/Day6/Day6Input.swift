import Foundation

func parseDay6Input(from file: String) -> [PassengerGroup] {
    file.components(separatedBy: "\n\n").map { PassengerGroup(answers: $0.split(separator: "\n").map(String.init))}
}

struct PassengerGroup {
    let answers: [String]
}
