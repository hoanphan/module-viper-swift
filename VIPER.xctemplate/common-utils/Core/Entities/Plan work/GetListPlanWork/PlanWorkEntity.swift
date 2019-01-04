//
//  File.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 10/25/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation
import ObjectMapper
class PlanWorkEntity : NSObject, Mappable {
 
    public var status: String = ""
    public var taskId: Int = 0
    public var id: Int = 0
    public var childTaskId: Int = 0
    public var createdByUserId: String = ""
    public var createdByUserName: String = ""
    public var planExecutionUserIds:[Int] = []
    public var planExecutionDepartmentIds: [Int] = []
    public var planToPlanDescriptionDTOs:[PlanDescriptionEntity] = []
    public var planExecutionUsers:[UserEntity] = []
    public var planExecutionDepartments: [ChildrenDepartment] = []
    public var planDescriptions: [PlanDescriptionsEntity] = []
    public var progressEvaluated: Bool = false
    
    public var statusCode: Int = 0
    public var detail: String = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        taskId <- map["taskId"]
        id <- map["id"]
        childTaskId <- map["childTaskId"]
        createdByUserId <- map["createdByUserId"]
        createdByUserName <- map["createdByUserName"]
        status <- map["status"]
        planToPlanDescriptionDTOs <- map["planToPlanDescriptions"]
        planExecutionDepartments <- map["planDescriptionDepartments"]
        planExecutionUsers <- map["planDescriptionUsers"]
        planDescriptions <- map["planDescriptions"]
        statusCode <- map["status"]
        detail <- map["message"]
        progressEvaluated <- map["progressEvaluated"]
    }
}
