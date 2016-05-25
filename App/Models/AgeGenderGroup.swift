import Vapor

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