//
//  UserUseCase.swift
//  BaoVietOffice
//
//  Created by HOANPV on 10/17/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit

typealias DisplayUserUseAuthencatorCaseCompletionHandler = (_ authencation: Result<AuthenticateEntity>) -> Void
protocol UserUseCase{
    func login(param: ParamLogin,  completionHandler: @escaping DisplayUserUseAuthencatorCaseCompletionHandler)
}


class UserUseCaseImplement:  UserUseCase{
    let userGateway: UserGateway
    
    init(userGateway: UserGateway) {
        self.userGateway = userGateway
    }
    
    func login(param: ParamLogin, completionHandler: @escaping DisplayUserUseAuthencatorCaseCompletionHandler) {
        self.userGateway.login(parameters: param){
            (result) in
            completionHandler(result)
        }
    }
}
