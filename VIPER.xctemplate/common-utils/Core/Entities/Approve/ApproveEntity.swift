
//
//  ApproveEntity.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 10/31/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class ApproveEntity: NSObject, Mappable {
    var id: Int = 0
    var status: String = ""
    var comment: String = ""
    var statusRespose: Int = 0
    var detail:String = ""
    var codeStatus: Int = 0
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        status <- map["status"]
        comment <- map["comment"]
        statusRespose <- map["status"]
        detail <- map["detail"]
        codeStatus <- map["status"]
    }
    
}
