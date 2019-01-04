//
//  PlanDescriptionEntity.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 10/29/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
class PlanDescriptionEntity: NSObject, Mappable {
    var id: Int = 0
    var fromDate: String = ""
    var name:String = ""
    var toDate:String = ""
    var _description: String = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        toDate <- map["toDate"]
        fromDate <- map["fromDate"]
        _description <- map["description"]
    }
}
