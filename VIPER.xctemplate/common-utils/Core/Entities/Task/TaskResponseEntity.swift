//
//  TaskResponseEntity.swift
//  BaoVietOffice
//
//  Created by HOANPV on 11/1/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class TaskResponseEntity: NSObject, Mappable{
    public var tasks: TaskData = TaskData()
    public var taskStatusQuantity:[TaskQuantity] = []
    public var personalTasks: [PersonalTaskQuality] = []
    public var assignedTasks: [PersonalTaskQuality] = []
    public var status: Int = 0
    public var detail: String = ""
    public var message: String = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
     func mapping(map: Map) {
        tasks <- map["tasks"]
        taskStatusQuantity <- map["assigneeTaskDashboard"]
        status <- map["status"]
        detail <- map["detail"]
        message <- map["message"]
        personalTasks <- map["panelDashboard"]
        assignedTasks <- map["panelDashboard"]
    }
    
}

class TaskData: NSObject, Mappable
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

