//
//  CacheUsersGateway.swift
//  FoxLive
//
//  Created by HOANPV on 10/5/18.
//  Copyright © 2018 HOANDHTB. All rights reserved.
//

import UIKit

class CacheUsersGateway: UserGateway {
    func getAcount(completionHandler: @escaping UserGatewayCompletionHandler) {
        
    }
    
    
    let apiUserGateway: ApiUserGateway
    let localPersistenceUserGateway: LocalPersistenceUserGateway
    
    init(apiUserGateway: ApiUserGateway, localPersistenceUserGateway: LocalPersistenceUserGateway) {
        self.apiUserGateway = apiUserGateway
        self.localPersistenceUserGateway = localPersistenceUserGateway
    }
    
    func login(parameters: ParamLogin, completionHandler: @escaping LoginGatewayCompletionHandler) {
        apiUserGateway.login(parameters: parameters) { (result) in
            self.handleAthencationApiResult(parameters, result, completionHandler: completionHandler)
        }
    }
    
    func getUserInfor(user: String, completionHandler: @escaping UserGatewayCompletionHandler) {
        apiUserGateway.getUserInfor(user: user) {
            (result) in
            self.handleGetUserInfor(result, completionHandler: completionHandler)
        }
    }
    
    // MARK: - Private
    
    fileprivate func handleAthencationApiResult(_ parameters: ParamLogin,_ result: Result<AuthenticateEntity>, completionHandler: @escaping (Result<AuthenticateEntity>) -> Void) {
        switch result {
        case let .success(dataAuthen):
            CacheLogin.token = dataAuthen.idToken
            if dataAuthen.status == 0
            {
                getUserInfor(user: parameters.username){
                    (resultUser) in
                    switch resultUser
                    {
                    case let .success(data):
                        if data.status == 0
                        {
                            UserDefaults.standard.set(true, forKey: "IsLogin")
                            UserDefaults.standard.synchronize()
                            completionHandler(result)
                        }
                        else
                        {
                            let authen = AuthenticateEntity()
                            authen.status = data.status
                            authen.message = data.message ?? ""
                            completionHandler(.success(authen))
                        }
                        break
                    case let .failure(error):
                        completionHandler(.failure(AuthenticateEntity()))
                        break
                    }
                }
            }
            else
            {
                completionHandler(result)
            }
        case .failure(_):
           completionHandler(result)
        }
    }
    
    fileprivate func  handleGetUserInfor(_ result: Result<UserEntity>, completionHandler: @escaping (Result<UserEntity>) -> Void) {
        switch result {
        case let .success(data):
            data.token_key = CacheLogin.token
            localPersistenceUserGateway.saveUser(data)
            completionHandler(result)
        case .failure(_):
            completionHandler(result)
        }
    }
    
}
