//
//  ProgressEnumerationEntity.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 11/7/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation
import ObjectMapper
class ProgressEnumeration: NSObject, Mappable {
    var id:Int = 0
    var value:String = ""
    var name:String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        value <- map["value"]
        name <- map["name"]
    }
    
}
