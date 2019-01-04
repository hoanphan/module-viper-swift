//
//  TaskWorkUserCase.swift
//  BaoVietOffice
//
//  Created by HOANPV on 10/21/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
typealias FetchWorkTaskAssigned = (_ task: Result<TaskResponseEntity>) -> Void
typealias FetchWorkTaskAssignee = (_ task: Result<TaskResponseEntity>) -> Void
typealias FetchWorkTaskPersonal = (_ task: Result<TaskResponseEntity>) -> Void
typealias DeleteWorkTask = (_ task: Result<TaskWorkEntity>) -> Void
typealias ReturnBack = (_ task: Result<TaskWorkEntity>) -> Void
typealias EvictionBack = (_ task: Result<TaskWorkEntity>) -> Void

typealias FetchUserExcuter = (_ users: Result<[UserEntity]>) -> Void
protocol TaskWorkUserCase {
    func fetchTaskAsigned(parram: ParamWorkTask, completionHandler: @escaping FetchWorkTaskAssigned)
    func fetchTaskAsignee(parram: ParamWorkTask, completionHandler: @escaping FetchWorkTaskAssigned)
    func fetchTaskPersonal(parram: ParamWorkTask, completionHandler: @escaping FetchWorkTaskAssigned)
    func fetchDeadlineTask(parram: ParamWorkTask, completionHandler: @escaping FetchWorkTaskAssigned)
    func fetchCoWorkingTasks(parram: ParamWorkTask, completionHandler: @escaping FetchWorkTaskAssigned)
    func fetchUserExcuter(completionHandler: @escaping FetchUserExcuter)
    func delete(id: String, completionHandler: @escaping DeleteWorkTask)
    func returnBack(id: Int, completionHandler: @escaping ReturnBack)
    func evictionBack(id: Int, completionHandler: @escaping EvictionBack)
}
class TaskWorkUserCaseImplment: TaskWorkUserCase{
    let taskGateway: TaskWorkGetway
    
    init(taskGateway: TaskWorkGetway) {
        self.taskGateway = taskGateway
    }
    
    func fetchTaskPersonal(parram: ParamWorkTask, completionHandler: @escaping FetchWorkTaskAssigned) {
        taskGateway.fetchTaskPersonal(parram: parram)
        {
            (result) in
            completionHandler(result)
        }
    }
    
    func fetchTaskAsigned(parram: ParamWorkTask, completionHandler: @escaping FetchWorkTaskAssigned)
    {
        taskGateway.fetchTaskAssigned(parram: parram)
        {
            (result) in
            completionHandler(result)
        }
    }
    
    func fetchTaskAsignee(parram: ParamWorkTask, completionHandler: @escaping FetchWorkTaskAssigned) {
        taskGateway.fetchTaskAssignee(parram: parram)
        {
            (result) in
            completionHandler(result)
        }
    }
    
    func delete(id: String, completionHandler: @escaping DeleteWorkTask) {
        taskGateway.deleteTask(id: id){
            (result) in
            completionHandler(result)
        }
    }
    
    func fetchUserExcuter(completionHandler: @escaping FetchUserExcuter) {
        taskGateway.fetchUserExcutor()
        {
                (result) in
                completionHandler(result)
        }
    }
    
    func fetchDeadlineTask(parram: ParamWorkTask, completionHandler: @escaping FetchWorkTaskAssigned) {
        taskGateway.fetchDealineTask(parram: parram)
        {
            (result) in
            completionHandler(result)
        }
    }
    
    func fetchCoWorkingTasks(parram: ParamWorkTask, completionHandler: @escaping FetchWorkTaskAssigned) {
        taskGateway.fetchCoWorkingTask(parram: parram)
        {
            (result) in
            completionHandler(result)
        }
    }
    
    func returnBack(id: Int, completionHandler: @escaping ReturnBack) {
        taskGateway.returnTask(id: id)
        {
            (result) in
            completionHandler(result)
        }
    }
    
    func evictionBack(id: Int, completionHandler: @escaping EvictionBack) {
        taskGateway.evictionBack(id: id)
        {
            (result) in
            completionHandler(result)
        }
    }
}
