//
//  ApiUserGateway.swift
//  BaoVietOffice
//
//  Created by HOANPV on 10/16/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import RxSwift
protocol ApiUserGateway: UserGateway {

}

class ApiUserGatewayImplement: ApiUserGateway
{
    func getAcount(completionHandler: @escaping UserGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getUser()).asObservable().mapObject(UserEntity .self).subscribe(onNext: {
            (result) in
            completionHandler(.success(result))
        }, onError:{
            (error) in
            completionHandler(.failure(error))
        })
    }
    
    func login(parameters: ParamLogin, completionHandler: @escaping LoginGatewayCompletionHandler) {
        apiProvider.request(TSAPI.authenticate(parameters.username, parameters.password)).asObservable().mapObject(AuthenticateEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError: {
            (error) in
            completionHandler(.failure(error))
        })
    }
    
    func getUserInfor(user: String, completionHandler: @escaping UserGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getUserInfor(user)).asObservable().mapObject(UserEntity.self).subscribe(onNext: {
            (result) in
            completionHandler(.success(result))
        }, onError: {
            (error) in
            completionHandler(.failure(error))
        })
    }
    
}
