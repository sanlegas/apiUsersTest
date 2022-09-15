//
//  APIManager.swift
//  ApiTestMobile
//
//  Created by ISAAC DAVID SANTIAGO on 15/09/22.
//

import Foundation
class APIManager{
    static let shared = { APIManager()}()
    
    lazy var baseURL: String = {
        return "https://randomuser.me/api/?results=50"
    }()
    

}
