//
//  UserGateway.swift
//  FoxLive
//
//  Created by HOANDHTB on 10/4/18.
//  Copyright © 2018 HOANDHTB. All rights reserved.
//

import Foundation

typealias LoginGatewayCompletionHandler = (_ user: Result<AuthenticateEntity>) -> Void
typealias UserGatewayCompletionHandler = (_ user: Result<UserEntity>) -> Void

struct ParamLogin
{
    var username:String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
protocol UserGateway {
    func login(parameters: ParamLogin, completionHandler: @escaping LoginGatewayCompletionHandler)
    func getUserInfor(user: String, completionHandler: @escaping UserGatewayCompletionHandler)
    func getAcount(completionHandler: @escaping UserGatewayCompletionHandler)
}
