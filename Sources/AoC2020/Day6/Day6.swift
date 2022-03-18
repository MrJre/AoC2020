import Foundation

func day6part1(input: [PassengerGroup]) -> Int {
    input.reduce(0) { $0 + uniqueQuestions(group: $1).count }
}

func day6part2(input: [PassengerGroup]) -> Int {
    input.reduce(0) { $0 + calculateQuestionIntersectionCount(group: $1) }
}

func uniqueQuestions(group: PassengerGroup) -> Set<Character> {
    group.answers.reduce(Set<Character>()) { $0.union(Set(Array($1))) }
}

func calculateQuestionIntersectionCount(group: PassengerGroup) -> Int {
    group.answers.map { Set<Character>($0) }.reduce(uniqueQuestions(group: group)) { $0.intersection($1) }.count
}
