import Vapor

let app = Application()

app.get("age-gender-groups") { request in
    let group = AgeGenderGroup(startAge: 10, endAge: 12, gender: .male, description: "10-12 year old boy", urgency: .high)
    return group.makeJson()
}

app.start(port: 8080)
