
//
//  TaskGetway.swift
//  BaoVietOffice
//
//  Created by HOANPV on 10/21/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit

typealias GetTaskGatewayCompletionHandler =  (_ user: ResultHeader<[TaskWorkEntity], HTTPURLResponse>) -> Void
typealias GetTaskAssignedCompletionHandler = (_ task: Result<TaskResponseEntity> ) -> Void
typealias GetTaskAssigneedCompletionHandler = (_ task: Result<TaskResponseEntity>) -> Void
typealias GetTaskPersonalCompletionHandler =  (_ task: Result<TaskResponseEntity>) -> Void
typealias GetTaskExecutorCompletionHandler = (_ task: Result<[UserEntity]>) -> Void
typealias ReturnTaskCompleteHandler = (_ task: Result<TaskWorkEntity>) -> Void
typealias EvictionBackCompleteHandler =  (_ task: Result<TaskWorkEntity>) -> Void

typealias GetTaskCatalogTaskCompeleteHandler = (_ catalogTask: Result<[TaskCatalogEntity]>) -> Void
typealias GetTaskFromCompleteHandler = (_ taskFrom: Result<[TaskFromEntity]>) -> Void
typealias GetTaskStatusCompleteHandler = (_ taskStatus: Result<[StatusEntity]>) -> Void
typealias GetTaskUpdateProgessCompleteHandler = (_ taskUpdateProgess: Result<[FrequencyEntity]>) -> Void
typealias CreateTaskCompleteHandler = (_ taskCreate:Result<TaskWorkEntity>) -> Void
typealias UpdateTaskCompleteHandler = (_ updateTask:Result<TaskWorkEntity>) -> Void
typealias GetDetailTaksCompleteHandler = (_ task: Result<TaskWorkEntity>) -> Void
typealias DeleteTaksCompleteHandler = (_ task: Result<TaskWorkEntity>) -> Void
typealias GetTaskTypeCompleteHandler = (_ task: Result<TaskQuantity>) -> Void
typealias GetSecretaryForUsers = (_ users: Result<[UserEntity]>) -> Void


struct ParamWorkTask
{
    var departmentId: Int
    var executorId: Int
    var fromDate: String
    var taskType: TaskType = .ASSIGNEE_TASK
    var taskStatus: TaskStatus = .NIL
    var toDate: String
    var page: Int
}

struct ParamCreateWorkTask {
    var attachmentFile: String
    var coWorkers: [Int]
    var coWorkingDepartments: [Int]
    var description: String
    var executionDepartment: Int
    var executors: [Int]
    var finishDate: String
    var id: Int
    var name: String
    var needPlan: Bool
    var remind: Bool
    var startDate: String
    var status: String
    var taskCatalog: String
    var taskFrom: String
    var taskProgressUpdates: String
    var taskType: String
    var assignedByUserId: Int
}
protocol TaskWorkGetway {
    func fetchTaskAssigned(parram: ParamWorkTask, completionHandler: @escaping GetTaskAssignedCompletionHandler)
    func fetchTaskAssignee(parram: ParamWorkTask, completionHandler: @escaping GetTaskAssignedCompletionHandler)
    func fetchTaskPersonal(parram: ParamWorkTask, completionHandler: @escaping GetTaskAssignedCompletionHandler)
    
    func fetchDealineTask(parram: ParamWorkTask, completionHandler: @escaping GetTaskAssignedCompletionHandler)
    func fetchCoWorkingTask(parram: ParamWorkTask, completionHandler: @escaping GetTaskAssignedCompletionHandler)
    
    func fetchUserExcutor(completionHandler: @escaping GetTaskExecutorCompletionHandler)
    func returnTask(id: Int, completionHandler: @escaping ReturnTaskCompleteHandler)
    func evictionBack(id: Int, completionHandler: @escaping ReturnTaskCompleteHandler)
    
    func fetchCatalogTask(completionHandler: @escaping GetTaskCatalogTaskCompeleteHandler)
    func fetchTaskFrom(completionHandler: @escaping GetTaskFromCompleteHandler)
    func fetchTaskStatus(completionHanler: @escaping GetTaskStatusCompleteHandler)
    func fetchTaskUpdateProgess(completionHandler: @escaping GetTaskUpdateProgessCompleteHandler)
    func createTask(parram: ParamCreateWorkTask,completionHandler: @escaping CreateTaskCompleteHandler)
    func updateTask(parram: ParamCreateWorkTask, completionHandler: @escaping UpdateTaskCompleteHandler)
    func getDetailTask(id: String, completionHandler: @escaping GetDetailTaksCompleteHandler)
    func deleteTask(id: String, completionHandler: @escaping DeleteTaksCompleteHandler)
    func fetchSecretaryUser(completionHandler: @escaping GetSecretaryForUsers)
}
