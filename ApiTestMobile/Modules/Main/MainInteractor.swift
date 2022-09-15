//
//  MainInteractor.swift
//  ApiTestMobile
//
//  Created by ISAAC DAVID SANTIAGO on 15/09/22.
//  
//

import Foundation

class MainInteractor: PresenterToInteractorMainProtocol {
    
    func getAvatar(_ urlAvatar: String, sucess: @escaping(_ image: Data) -> (), failure: @escaping( ) ->() ){
        let networkingUtility = NetworkUtility()
        networkingUtility.getImageFromUrl(urlAvatar) { image in
            sucess(image)
        } failure: {
            failure()
        }

    }
    
    func loadUsers(successRes: @escaping ([User]) -> (), failureRes: @escaping () -> ()) {
        let apiCharacteres = APIClient(baseUrl: APIManager.shared.baseURL)
        apiCharacteres.getArray() { (result: Result<ResponseApi, Error>) in
            switch result {
            case .success(var success):
                print("success \(success)")
                successRes(success.results)
            case .failure(let failure):
                print("Falló \(failure)")
                failureRes()
            }
        }
    }
    
    // MARK: Properties
    var presenter: InteractorToPresenterMainProtocol?
}
