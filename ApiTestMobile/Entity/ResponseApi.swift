//
//  ResponseApi.swift
//  ApiTestMobile
//
//  Created by ISAAC DAVID SANTIAGO on 15/09/22.
//

import Foundation

struct ResponseApi: Decodable{
    let results: [User]
    let info: Info
}

struct Info: Decodable{
    let seed: String
    let results: Int
    let page: Int
    let version: String
}
