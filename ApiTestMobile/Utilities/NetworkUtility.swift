//
//  NetworkUtility.swift
//  ApiTestMobile
//
//  Created by ISAAC DAVID SANTIAGO on 15/09/22.
//

import Foundation
import Kingfisher

class NetworkUtility{
    
    func getImageFromUrl(_ urlString: String, sucess: @escaping(_ image: Data) -> (), failure: @escaping( ) ->() ){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                print("Image: \(value.image). Got from: \(value.cacheType)")
                sucess(value.image.pngData()!)
            case .failure(let error):
                print("Error: \(error)")
                failure()
            }
        }
    }
}
