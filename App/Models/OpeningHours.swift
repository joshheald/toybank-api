import Vapor
import Foundation

struct OpeningHours {
    let dayOfWeek: Int
    let openTime: String
    let closeTime: String

    // MARK: JSON Keys
    let openingHoursDayOfWeekKey = "dayOfWeek"
    let openingHoursOpenTimeKey = "openTime"
    let openingHoursCloseTimeKey = "closeTime"
}

extension OpeningHours: JsonRepresentable {
    func makeJson() -> Json {
        return Json(makeJsonDictionary())
    }
    
    func makeJsonDictionary() -> [String : Json] {
        return [
                   openingHoursDayOfWeekKey: Json(dayOfWeek),
                   openingHoursOpenTimeKey: Json(openTime),
                   openingHoursCloseTimeKey: Json(closeTime)
        ]
    }
}