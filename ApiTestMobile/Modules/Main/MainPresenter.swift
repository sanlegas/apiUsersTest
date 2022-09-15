//
//  MainPresenter.swift
//  ApiTestMobile
//
//  Created by ISAAC DAVID SANTIAGO on 15/09/22.
//  
//

import Foundation

class MainPresenter: ViewToPresenterMainProtocol {

    var usersLocal: [User]?

    // MARK: Properties
    var view: PresenterToViewMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?
    
    func loadCharacteres(successRes: @escaping () -> (), failureRes: @escaping () -> ()) {
        
        interactor?.loadUsers(successRes: { users in
            let dispatchGroup = DispatchGroup()
            var usersMutable = users
            usersMutable.indices.forEach{
                let i = $0
                dispatchGroup.enter()
                self.interactor?.getAvatar(usersMutable[i].picture!.medium!, sucess: { image in
                    usersMutable[i].profilePicture = image
                    dispatchGroup.leave()
                }, failure: {
                    dispatchGroup.leave()
                    failureRes()
                })
            }
            dispatchGroup.notify(queue: DispatchQueue.main){
                self.usersLocal = usersMutable
                successRes()
            }
        }, failureRes: {
            failureRes()
        })
    }
    
}

extension MainPresenter: InteractorToPresenterMainProtocol {
    
}
