//
//  LocalPersistenceUserGeteway.swift
//  FoxLive
//
//  Created by HOANPV on 10/5/18.
//  Copyright © 2018 HOANDHTB. All rights reserved.
//

import UIKit
import RealmSwift
protocol LocalPersistenceUserGateway: UserGateway {
    func saveUser(_ user: UserEntity)
    
    func deleteUser(_ userId: String)
    
    func getUser(_ userId: String) -> UserEntity?
    
    func getFirstUser() -> UserEntity?
}
class LocalPersistenceUserGatewayImplement: LocalPersistenceUserGateway {
    func getAcount(completionHandler: @escaping UserGatewayCompletionHandler) {
        
    }
    
    
    func login(parameters: ParamLogin, completionHandler: @escaping LoginGatewayCompletionHandler) {
        
    }
   
    func getUserInfor(user: String, completionHandler: @escaping UserGatewayCompletionHandler) {
        
    }
   
    func saveUser(_ user: UserEntity) {
        UserEntity.saveUser(user)
    }
    
    func deleteUser(_ userId: String) {
      UserEntity.deleteUser(userId)
    }
    
    func getUser(_ userId: String) -> UserEntity? {
       return nil
    }
    
    func getFirstUser() -> UserEntity?{
       return UserEntity.getFirstUser()
    }
    
    
    
    
}
