//
//  PlanDescriptionsEntity.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 11/6/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation
import ObjectMapper
class PlanDescriptionsEntity: NSObject, Mappable {
    
    public var statusPlan: String = ""
    
    public var updatedProgressHistory: Bool = false
    public var id : Int = 0
    public var taskType: String = ""
    public var name: String = ""
    public var toDate: String = ""
    public var fromDate: String = ""
    public var progressPercentCompleted:Int = 0
    public var status:String = ""
    public var statusCode: Int = 0
    public var detail: String = ""
    public var _description: String = ""
    public var progressReportStatus: ProgressReportStatusEntity?
    
    public var executor: UserEntity?
    public var executionDepartment: ChildrenDepartment?
    public var createdByUser: UserEntity?
    
    public var planId: Int = 0
    public var updatedHistory: Bool = false
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        taskType <- map["taskType"]
        id <- map["id"]
        fromDate <- map["fromDate"]
        progressPercentCompleted <- map["progressPercentCompleted"]
        name <- map["name"]
        _description <- map["description"]
        planId <- map["planId"]
        name <- map["name"]
        progressReportStatus <- map["progressReportStatus"]
        executor <- map["executor"]
        executionDepartment <- map["executionDepartment"]
        createdByUser <- map["createdByUser"]
        toDate <- map["toDate"]
        updatedProgressHistory <- map["updatedProgressHistory"]
        statusCode <- map["status"]
        detail <- map["detail"]
        updatedHistory <- map["updatedHistory"]
    }

}
