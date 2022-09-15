//
//  User.swift
//  ApiTestMobile
//
//  Created by ISAAC DAVID SANTIAGO on 15/09/22.
//

import Foundation
struct User: Decodable {
    var gender: String?
    var name: Name?
    var location: Location?
    var email: String?
    var login: Login?
    var dob: Dob?
    var registered: Dob?
    var phone: String?
    var cell: String?
    var id: IdUser?
    var picture: Picture?
    var nat: String?
    var profilePicture: Data?
}

struct Picture: Decodable{
    var large: String?
    var medium: String?
    var thumbnail: String?
}

struct IdUser: Decodable{
    var name: String?
    var value: String?
}
struct Dob: Decodable{
    var date: String?
    var age: Int?
}

struct Login: Decodable{
    var uuid: String?
    var username: String?
    var password: String?
    var salt: String?
    var md5: String?
    var sha1: String?
    var sha256: String?
}

struct Name: Decodable{
    var title: String?
    var first: String?
    var last: String?
}

struct Location: Decodable{
    var street: Street?
    var city: String?
    var state: String?
    var country: String?
    var coordinates: Coordinates?
    var timezone: TimeZone?
}

struct TimeZone: Decodable{
    var offset: String?
    var description: String?
}

struct Street: Decodable{
    var number: Int?
    var name: String?
}

struct Coordinates: Decodable{
    var latitude: String?
    var longitude: String?
}
