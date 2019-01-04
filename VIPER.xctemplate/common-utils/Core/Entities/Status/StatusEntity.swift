//
//  StatusEntity.swift
//  BaoVietOffice
//
//  Created by nava on 11/9/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class StatusEntity: NSObject, Mappable {
    public var id: Int = 0
    public var value: String = ""
    public var name: String = ""
    public var tasks: String = ""
    
    required convenience init?(map: Map) {
      self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        value <- map["value"]
        name <- map["name"]
        tasks <- map["tasks"]
    }
    
}
