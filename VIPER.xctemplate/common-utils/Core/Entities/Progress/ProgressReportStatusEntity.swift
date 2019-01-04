//
//  ProgressReportStatusEntity.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 11/15/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation
import ObjectMapper
class ProgressReportStatusEntity: NSObject, Mappable {
    var id: String? = ""
    var value: String? = ""
    var progressReports: String? = ""
    var name: String? = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        value <- map["value"]
        progressReports <- map["progressReports"]
        name <- map["name"]
        
    }
    
}
