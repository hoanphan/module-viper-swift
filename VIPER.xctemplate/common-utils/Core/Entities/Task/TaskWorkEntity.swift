//
//  TaskWorkEntity.swift
//  BaoVietOffice
//
//  Created by HOANPV on 10/21/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class TaskWorkEntity: NSObject, Mappable, Error {
    public var id: Int = 0
    public var parentId: Int = 0
    public var taskType: String = ""
    public var name: String = ""
    public var _description: String = ""
    public var startDate: String = ""
    public var finishDate: String = ""
    public var status: StatusEntity?
    public var taskCatalog: TaskCatalogEntity?
    public var taskProgressUpdates:FrequencyEntity?
    public var taskFrom: TaskFromEntity?
    public var remind: Bool = false
    public var needPlan:Bool = false
    public var attachmentFile: String = ""
    public var updatedAt: String = ""
    public var createdAt: String = ""
    public var childTasks: String = ""
    public var coWorkingDepartments: [ChildrenDepartment] = []
    public var executionChangeLogs: String = ""
    public var progressReports: String = ""
    public var taskToDepartments: String = ""
    public var taskToTaskAudits: String = ""
    public var purpose: String = ""
    public var weight: WeightEntity?
    public var taskToPlans: String = ""
    public var executors:[UserEntity] = []
    public var coWorkers:[UserEntity] = []
    public var createdByUser: UserEntity?
    
    public var statusReponse: Int = 0
    public var detail: String = ""
    public var message: String = ""
    
    public var planned: Bool = true
    public var planApproved: Bool = true
    public var progressEvaluated: Bool = true
    public var progressUpdated: Bool = true
    public var dividedUp: Bool = false
    public var canViewDetail: Bool = false
    
    public var assignedByUser: UserEntity?
    
    public var showForchildTask: Bool = true
    
    public var executionDepartment: ChildrenDepartment?
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        parentId <- map["parentId"]
        id <- map["id"]
        taskType <- map["taskType"]
        name <- map["name"]
        _description <- map["description"]
        startDate <- map["startDate"]
        finishDate <- map["finishDate"]
        status <- map["status"]
        taskCatalog <- map["catalog"]
        taskProgressUpdates <- map["taskProgressUpdate"]
        taskFrom <- map["taskFrom"]
        remind <- map["remind"]
        needPlan <- map["needPlan"]
        attachmentFile <- map["attachmentFile"]
        updatedAt <- map["updatedAt"]
        createdAt <- map["createdAt"]
        childTasks <- map["childTasks"]
        coWorkingDepartments <- map["coWorkingDepartments"]
        executionChangeLogs <- map["executionChangeLogs"]
        progressReports <- map["progressReports"]
        taskToDepartments <- map["taskToDepartments"]
        taskToTaskAudits  <- map["taskToTaskAudits"]
        taskToPlans <- map["taskToPlans"]
        executors <- map["executors"]
        coWorkers <- map["coWorkers"]
        executionDepartment <- map["executionDepartment"]
        statusReponse <- map["status"]
        detail <- map["detail"]
        message <- map["message"]
        planned <- map["planned"]
        planApproved <- map["planApproved"]
        progressEvaluated <- map["progressEvaluated"]
        progressUpdated <- map["progressUpdated"]
        assignedByUser <- map["assignedByUser"]
        purpose <- map["purpose"]
        weight <- map["weight"]
        createdByUser <- map["createdByUser"]
        dividedUp <- map["dividedUp"]
        parentId <- map["parentId"]
        canViewDetail <- map["canViewDetail"]
    }
    
    override func copy() -> Any {
        let new = TaskWorkEntity()
        new.parentId = parentId
        new.id  = id
        new.taskType = taskType
        new.name = name
        new._description = description
        new.startDate = startDate
        new.finishDate = finishDate
        new.status = status
        new.taskCatalog = taskCatalog
        new.taskProgressUpdates = taskProgressUpdates
        new.taskFrom = taskFrom
        new.remind = remind
        new.needPlan = needPlan
        new.attachmentFile = attachmentFile
        new.updatedAt = updatedAt
        new.createdAt = createdAt
        new.childTasks = childTasks
        new.coWorkingDepartments = coWorkingDepartments
        new.executionChangeLogs = executionChangeLogs
        new.progressReports = progressReports
        new.taskToDepartments = taskToDepartments
        new.taskToTaskAudits  = taskToTaskAudits
        new.taskToPlans = taskToPlans
        new.executors = executors
        new.coWorkers = coWorkers
        new.executionDepartment = executionDepartment
        
        new.detail = detail
        new.message = message
        new.planned = planned
        new.planApproved = planApproved
        new.progressEvaluated = progressEvaluated
        new.progressUpdated = progressUpdated
        new.assignedByUser = assignedByUser
        new.purpose = purpose
        new.weight = weight
        new.createdByUser = createdByUser
        new.dividedUp = dividedUp
        new.parentId = parentId
        return new
    }
    
    func checkSplitWork(isChildTask: Bool = false) -> Bool
    {
        let user = UserEntity.getFirstUser()
      
        if self.planned && self.needPlan
        {
            return false
        }
        
        if !self.needPlan && self.progressUpdated
        {
            return false
        }
        
        if self.parentId != 0
        {
            if user?.role != RoleUser.ROLE_EMPLOYEE
            {
                return true
            }
            return false
        }
        
        if self.executors.filter({$0.id == user!.id}).first != nil &&  !self.planned  && self.needPlan
        {
            return true
        }
        
        //Người phối hợp ở cv to không dc chia nhỏ
        if self.coWorkers.filter({$0.id == user!.id}).first != nil
        {
            return false
        }
        
     
        if self.executors.filter({$0.id == user!.id}).first != nil && !self.progressUpdated && !self.needPlan
        {
            return true
        }
        return false
    }
    
    func checkSplitChidWork() -> Bool
    {
        let user = UserEntity.getFirstUser()
        if self.planned && self.needPlan
        {
            return false
        }
        
        if !self.needPlan && self.progressUpdated
        {
            return false
        }
        return true
    }
    
    func checkTranfer(taskType: TaskType) -> Bool
    {
        //let user = UserEntity.getFirstUser()
        
        if self.dividedUp
        {
            return false
        }
//        if self.coWorkers.filter({$0.id == user?.id}).first != nil
//        {
//            return false
//        }
        if self.needPlan && self.planned
        {
            return false
        }
        if !self.needPlan && self.progressUpdated
        {
            return false
        }
        
        //            if taskType == TaskType.ASSIGNED_TASK && user?.role != RoleUser.ROLE_EMPLOYEE
        //            {
        //                return true
        //            }
        //            else if self.taskType == TaskType.PERSONAL_TASK.rawValue
        //            {
        //                return true
        //            }
        return true
    }
    
    func checkReturnWork() -> Bool
    {
        let user = UserEntity.getFirstUser()
        if self.dividedUp
        {
            return false
        }
        if self.needPlan && !self.planned
        {
            return true
//            if  self.executors.filter({$0.id == user!.id}).first != nil
//            {
//                return true
//            }
        }
        if !self.needPlan && !self.progressUpdated
        {
             return true
//            if self.executors.filter({$0.id == user!.id}).first != nil
//            {
//                return true
//            }
        }
        return false
    }
    
    func checkActionWork() -> Bool
    {
       
        if self.needPlan && !self.planned && !self.dividedUp
        {
           return true
        }
        if !self.needPlan && !self.progressUpdated && !self.dividedUp
        {
           return true
        }
        return false
    }
    
    func checkTranferChildTask(taskParent: TaskWorkEntity) -> Bool
    {
        if taskParent.executors.filter({$0.id == self.createdByUser?.id}).first != nil
        {
            if !self.dividedUp
            {
                if self.executors.first!.role != RoleUser.ROLE_EMPLOYEE
                {
                    return true
                }
            }
            
        }
        return false
    }
    
    func isChildTask() -> Bool
    {
        return self.parentId != 0
    }
    
    func isPersonalTask() -> Bool
    {
        if self.taskType == TaskType.PERSONAL_TASK.rawValue
        {
            return true
        }
        return false
    }
    
    func isUserInCoUser() -> Bool
    {
        let user:UserEntity = UserEntity.getFirstUser()!
        return self.coWorkers.filter({$0.id == user.id}).first != nil
    }
}
