//
//  FrequencyEntity.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 11/13/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class FrequencyEntity: NSObject, Mappable{
    var id: Int = 0
    var value: String = ""
    var name: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        value <- map["value"]
        name <- map["name"]
    }
    
}
