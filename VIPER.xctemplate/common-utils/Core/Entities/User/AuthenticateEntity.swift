//
//  AuthenticateEntity.swift
//  BaoVietOffice
//
//  Created by HOANPV on 10/17/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class AuthenticateEntity: Mappable, Error{
    var message: String = ""
    var idToken: String = ""
    var status: Int = 0
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        idToken <- map["id_token"]
        message <- map["message"]
        status <- map["status"]
    }
}
