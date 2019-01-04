//
//  WeightEntity.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 11/20/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class WeightEntity: NSObject, Mappable {
    public var id: Int = 0
    public var value: String = ""
    public var name: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        value <- map["value"]
        name <- map["name"]
    }
    
}
