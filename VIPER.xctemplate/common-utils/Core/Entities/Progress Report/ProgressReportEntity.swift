//
//  ProgressReportEntity.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 11/18/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class ProgressReportEntity: NSObject, Mappable {
    var id: Int = 0
    var planDescriptionId: Int = 0
    var planName: String = ""
    var fromDate: String = ""
    var toDate: String = ""
    var completed: Int = 0
     var completed2: Int = 0
    var status: StatusEntity?
    var note: String = ""
    
    var isChange: Bool = false
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        planDescriptionId <- map["planDescriptionId"]
        planName <- map["planName"]
        fromDate <- map["fromDate"]
        toDate <- map["toDate"]
        completed <- map["completed"]
        completed2 <- map["completed"]
        status <- map["status"]
        note <- map["note"]
    }
    
    
}

class DataProgressReportEntity : NSObject, Mappable
{
    var content: [ProgressReportEntity] = []
    var pageable: PageableEntity?
    var totalPages: Int = 0
    var numberOfElements: Int = 0
    var size: Int = 0
    var number: Int = 0
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        content <- map["content"]
        pageable <- map["pageable"]
        totalPages <- map["totalPages"]
        numberOfElements <- map["numberOfElements"]
        size <- map["size"]
        number <- map["number"]
    }
}

class ResponseProgressReportEntity: NSObject, Mappable {
    var status: Int = 0
    var detail: String = ""
    var progressReports: DataProgressReportEntity? = DataProgressReportEntity()
    var plan: PlanWorkEntity?
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        progressReports <- map["progressReports"]
        plan <- map["plan"]
        status <- map["status"]
        detail <- map["message"]
    }
}

