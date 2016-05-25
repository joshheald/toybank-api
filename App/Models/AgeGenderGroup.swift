import Vapor
import Foundation

struct AgeGenderGroup {
    enum Gender: String {
        case any
        case female
        case male
    }
    
    enum Urgency: String {
        case high
        case medium
        case low
    }

    let startAge: Int
    let endAge: Int
    let gender: Gender
    let description: String
    let urgency: Urgency
}

extension AgeGenderGroup: JsonRepresentable {
    func makeJson() -> Json {
        return Json([
            "startAge": startAge,
            "endAge": endAge,
            "gender": gender.rawValue,
            "description": description,
            "urgency": urgency.rawValue
        ])
    }
}

extension AgeGenderGroup {
    static func makeTestData(numberOfGroups count: Int) -> [AgeGenderGroup] {
        var groups = [AgeGenderGroup]()
        for _ in 0..<count {
            let startAge = Int(arc4random_uniform(12))
            let gender = randomGender()
            let urgency = randomUrgency()
            let description = groupDescription(forStartAge: startAge)
            
            groups.append(AgeGenderGroup(startAge: startAge, endAge: startAge+2, gender: gender, description: description, urgency: urgency))
        }
        return groups
    }
    
    private static func randomGender() -> Gender {
        switch arc4random_uniform(3) {
        case 0:
            return .any
        case 1:
            return .male
        case 2:
            return .female
        default:
            return .any
        }
    }
    
    private static func randomUrgency() -> Urgency {
        switch arc4random_uniform(3) {
        case 0:
            return .high
        case 1:
            return .medium
        case 2:
            return .low
        default:
            return .high
        }
    }
    
    private static func groupDescription(forStartAge startAge: Int) -> String {
        let ageDescriptions = ["Baby", "Toddler", "Pre-school", "Young school", "Old school", "Teenager"]
        let startAgeAsIndex = max(0, Int(startAge/2))
        return ageDescriptions[startAgeAsIndex]
    }
}