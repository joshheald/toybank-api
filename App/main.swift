import Vapor

let app = Application()

let ageGenderGroups = AgeGenderGroup.makeTestData(numberOfGroups: 12)

app.get("age-gender-groups") { request in
    let groups = ageGenderGroups.map({ group in
        group.makeJson()
    })
    return Json(groups)
}

app.start(port: 8080)
