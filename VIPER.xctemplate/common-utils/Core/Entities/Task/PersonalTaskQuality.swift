//
//  PersonalTaskQuality.swift
//  BaoVietOffice
//
//  Created by HOANPV on 10/31/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class PersonalTaskQuality: NSObject, Mappable {
   var name: String = ""
   var quantity: Int = 0
    var key: String = ""
   
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <-  map["name"]
        quantity <- map["taskQuantity"]
        key <- map["key"]
    }
    

}
