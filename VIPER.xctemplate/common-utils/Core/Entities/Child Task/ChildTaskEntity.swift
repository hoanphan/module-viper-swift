//
//  ChildTaskEntity.swift
//  BaoVietOffice
//
//  Created by HOANPV on 11/2/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class ChildTaskEntity: NSObject, Mappable {
    
    var statusCode: Int = 0
    var message: String = ""
    
    var id: Int = 0
    var name: String = ""
    var purpose: String = ""
    var status : StatusEntity?
    var weight: WeightEntity?
    var taskProgressUpdate: FrequencyEntity?
    var startDate: String = ""
    var finishDate: String = ""
    var createdAt: String = ""
    var executors: [UserEntity] = []
    var executionDepartment: ChildrenDepartment?
    var needPlan: Bool = false
    var planned: Bool = false
    var planApproved: Bool = false
    var progressUpdated: Bool = false
    var progressEvaluated: Bool = false
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        purpose <- map["purpose"]
        status <- map["status"]
        weight <- map["weight"]
        taskProgressUpdate <- map["taskProgressUpdate"]
        startDate <- map["startDate"]
        finishDate <- map["finishDate"]
        createdAt <- map["createdAt"]
        executors <- map["executors"]
        executionDepartment <- map["executionDepartment"]
        needPlan <- map["needPlan"]
        planned <- map["planned"]
        planApproved <- map["planApproved"]
        progressUpdated <- map["progressUpdated"]
        progressEvaluated <- map["progressEvaluated"]
        statusCode <- map["status"]
        message <- map["message"]
    }
    
}

class TaskChildResponseEntity: NSObject, Mappable{
    public var tasks: TaskChildData = TaskChildData()
    public var taskStatusQuantity:[TaskQuantity] = []
    public var personalTasks: [PersonalTaskQuality] = []
    public var assignedTasks: [PersonalTaskQuality] = []
    public var childTaskDashboard: [TaskQuantity] = []
    public var status: Int = 0
    public var detail: String = ""
    public var message: String = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        tasks <- map["childTasks"]
        taskStatusQuantity <- map["taskStatusQuantity"]
        status <- map["status"]
        detail <- map["detail"]
        message <- map["message"]
        personalTasks <- map["personalTasks"]
        assignedTasks <- map["assignedTasks"]
        childTaskDashboard <- map["childTaskDashboard"]
    }
    
}

class TaskChildData: NSObject, Mappable
{
    
    public var content: [TaskWorkEntity] = []
    public var totalPages: Int = 0
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        content <- map["content"]
        totalPages <- map["totalPages"]
    }
    
}
