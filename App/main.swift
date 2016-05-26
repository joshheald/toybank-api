import Vapor

let app = Application()

let ageGenderGroups = AgeGenderGroup.makeTestData(numberOfGroups: 12)
let collectionCentres = CollectionCentre.makeTestData()

app.get("age-gender-groups") { request in
    let groups = ageGenderGroups.map({ group in
        group.makeJson()
    })
    return Json(groups)
}

app.get("collection-centres") { request in
    let centres = collectionCentres.map({ centre in
        centre.makeJson()
    })
    return Json(centres)
}

app.start(port: 8083)
