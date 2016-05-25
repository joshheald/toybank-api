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
    
    let id: String
    let startAge: Int
    let endAge: Int
    let gender: Gender
    let description: String
    let urgency: Urgency
}

extension AgeGenderGroup: JsonRepresentable {
    func makeJson() -> Json {
        return Json([
                        "id": id,
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
        let startAges = [1,8,3,0,2,3,5,6,9,12,15, 10]
        let genders = [1,0,1,0,2,1,0,0,0,1,0,2]
        let urgencies = [1,0,1,0,2,1,0,0,0,1,0,2]
        var groups = [AgeGenderGroup]()
        for i in 0..<count {
            let id = "group-\(i)"
            let startAge = startAges[i]
            let gender = randomGender(int: genders[i])
            let urgency = randomUrgency(int: urgencies[i])
            let description = groupDescription(forStartAge: startAge)
            
            groups.append(AgeGenderGroup(id: id, startAge: startAge, endAge: startAge+2, gender: gender, description: description, urgency: urgency))
        }
        return groups
    }
    
    private static func randomGender(int: Int) -> Gender {
        switch int {
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
    
    private static func randomUrgency(int: Int) -> Urgency {
        switch int {
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