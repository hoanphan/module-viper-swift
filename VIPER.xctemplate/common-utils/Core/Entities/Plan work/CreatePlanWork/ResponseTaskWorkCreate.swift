//
//  ResponseTaskWork.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 10/29/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
class ResponseTaskWorkCreate: NSObject, Mappable {
    var childTaskId: String = ""
    var createdAt: String = ""
    var createdByUserId: String = ""
    var createdByUserName: String = ""
    var id: String = ""
    var planToPlanDescriptionDTOs: [PlanDescriptionsEntity] = []
    var taskId: String = ""
    var status: String = ""
    
    var statusCode: Int = 0
    var detail: String  = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        childTaskId <- map["childTaskId"]
        createdAt <- map["createdAt"]
        createdByUserId <- map["createdByUserId"]
        createdByUserId <- map["createdByUserId"]
        createdByUserName <- map["createdByUserName"]
        id <- map["id"]
        planToPlanDescriptionDTOs <- map["planToPlanDescriptionDTOs"]
        taskId <- map["taskId"]
        status <- map["status"]
        statusCode <- map["status"]
        detail <- map["detail"]
    }
    
}
