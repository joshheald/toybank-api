import Vapor
import Foundation

struct CollectionCentre {
    let centreId: String
    let name: String
    let address: String
    let city: String
    let postcode: String
    let phone: String
    let openingHours: [OpeningHours]
    let url: String
    let lat: String
    let lng: String
    let locationNotificationEligible: Bool

    // MARK: JSON keys
    let collectionCentreIDKey = "id"
    let collectionCentreNameKey = "name"
    let collectionCentreAddressKey = "address"
    let collectionCentreCityKey = "city"
    let collectionCentrePostcodeKey = "postcode"
    let collectionCentrePhoneKey = "phone"
    let collectionCentreOpeningHoursKey = "openingHours"
    let collectionCentreUrlKey = "url"
    let collectionCentreLatKey = "lat"
    let collectionCentreLongKey = "lng"
    let collectionCentreLocationNotificationEligibleKey = "locationNotificationEligible"
}

extension CollectionCentre: JsonRepresentable {
    func makeJson() -> Json {
        let openingHoursJson = openingHours.map({$0.makeJson()}) as [Json]
        return Json([
                        collectionCentreIDKey: centreId,
                        collectionCentreLatKey: lat,
                        collectionCentreLongKey: lng,
                        collectionCentreNameKey: name,
                        collectionCentreAddressKey: address,
                        collectionCentreCityKey: city,
                        collectionCentrePostcodeKey: postcode,
                        collectionCentrePhoneKey: phone,
                        collectionCentreOpeningHoursKey: Json(openingHoursJson),
                        collectionCentreLocationNotificationEligibleKey: locationNotificationEligible,
                        collectionCentreUrlKey: url
            ])
    }
}

extension CollectionCentre {
    static func makeTestData() -> [CollectionCentre] {
        let centres = [
                          CollectionCentre(centreId: "centre-1", name:"Tollcross Distribution Centre", address: "2 West Tollcross", city: "Edinburgh", postcode: "EH3 9BP", phone: "07805 203744", openingHours: [OpeningHours(dayOfWeek:1, openTime:"14:00", closeTime:"16:00"), OpeningHours(dayOfWeek:4, openTime:"10:00", closeTime:"12:30")], url:"https://www.toybankuk.com", lat:"55.943098", lng:"-3.205548", locationNotificationEligible: false),
                          CollectionCentre(centreId: "centre-2", name:"Broughton Distribution Centre", address: "Bellevue Crescent", city: "Edinburgh", postcode: "EH3 6NE", phone: "07805 204009", openingHours: [OpeningHours(dayOfWeek:3, openTime:"10:00", closeTime:"13:00"), OpeningHours(dayOfWeek:4, openTime:"13:00", closeTime:"16:00")], url:"https://www.toybankuk.com", lat:"55.960555", lng:"-3.193289", locationNotificationEligible: false),
                          CollectionCentre(centreId: "centre-3", name:"Tesco Broughton Road", address: "7 Broughton Road", city: "Edinburgh", postcode: "EH7 4EW", phone: "0345 6779245", openingHours: [OpeningHours(dayOfWeek:1, openTime:"07:00", closeTime:"22:00"), OpeningHours(dayOfWeek:2, openTime:"07:00", closeTime:"22:00"), OpeningHours(dayOfWeek:3, openTime:"07:00", closeTime:"22:00"), OpeningHours(dayOfWeek:4, openTime:"07:00", closeTime:"22:00"), OpeningHours(dayOfWeek:5, openTime:"07:00", closeTime:"22:00"), OpeningHours(dayOfWeek:6, openTime:"07:00", closeTime:"22:00"), OpeningHours(dayOfWeek:7, openTime:"09:00", closeTime:"22:00")], url:"http://www.tesco.com", lat:"55.963141", lng:"-3.196431", locationNotificationEligible: true)
        ]
        return centres
    }
}


