//
//  ReportEntity.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 10/29/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class ReportEntity: NSObject, Mappable {
    var id: Int = 0
    var completed: Int = 0
    var status: String = ""
    var note: String = ""
    var createAt: String = ""
    var fromDate: String = ""
    var toDate: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        completed <- map["completed"]
        status <- map["status"]
        note <- map["note"]
        createAt <- map["createAt"]
        fromDate <- map["fromDate"]
        toDate <- map["toDate"]
    }
    
}
