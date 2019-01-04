//
//  RoleEntity.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 11/23/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class RoleEntity: NSObject, Mappable{
   
    public var id: Int = 0
    public var name: String = ""
    public var key: String = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        key <- map["key"]
    }
    
}
