//
//  APIClient.swift
//  ApiTestMobile
//
//  Created by ISAAC DAVID SANTIAGO on 15/09/22.
//

import Foundation
import Alamofire

class APIClient{
 
    var baseURL: URL!
    
    static let sharedCharacteres = {
        APIClient(baseUrl: APIManager.shared.baseURL)
    }()
    
    required init(baseUrl: String){
        self.baseURL = URL(string: baseUrl)
    }
    
    func getArray<T: Decodable>(responseHandler: @escaping (Result<T, Error>) -> ()  )  -> Void {
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type":"application/json"
        ]
        let url = self.baseURL?.absoluteString
        AF
            .request(url!,
                     method: .get,
                     encoding: JSONEncoding.default,
                     headers: headers)
            .responseDecodable (of:  T.self){
                response in
                switch response.result {
                    case .success(let data):
                    print(data)
                    responseHandler(.success(data))
                case .failure(_):
                    print(response.error)
                    responseHandler(.failure(response.error!))
                }
               
            }
            
                
    }
    
}
