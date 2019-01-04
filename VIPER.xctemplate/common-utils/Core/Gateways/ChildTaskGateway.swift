//
//  ChildTaskGateway.swift
//  BaoVietOffice
//
//  Created by HOANPV on 11/2/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit

typealias GetListChildTaskCompleteHandler = (_ childTasks: Result<TaskChildResponseEntity>) -> Void
typealias GetListWeighCompleteHandler = (_ weights: Result<[WeightEntity]>) -> Void
typealias GetListProgressCompleteHandler = (_ weights: Result<[FrequencyEntity]>) -> Void
typealias CreateChildTaskCompleteHandler = (_ childTask: Result<ChildTaskEntity>) -> Void
typealias UpdateChildTaskCompleteHandler = (_ childTask: Result<ChildTaskEntity>) -> Void
typealias DeleteChildTaskCompleteHandler = (_ childTask: Result<ChildTaskEntity>) -> Void
struct CreateChildTask {
    var createdAt: String
    var executionDepartmentId: Int
    var executorId: Int
    var finishAt: String
    var id: Int
    var name: String
    var needPlan: Bool
    var parentId: Int
    var purpose: String
    var startAt: String
    var status: String
    var taskProgressUpdates: String
    var weigh: String
    
}
protocol ChildTaskGateway: class {
    func fetchChildrenTask(id: Int, startDate: String, endDate: String, complete: @escaping GetListChildTaskCompleteHandler)
    func fetchWeightTask(complete: @escaping GetListWeighCompleteHandler)
    func fetchListProgressUpdate(complete: @escaping GetListProgressCompleteHandler)
    func createChildTask(paramester: CreateChildTask,complete: @escaping  CreateChildTaskCompleteHandler)
    func deleteChildTask(id: Int, complete: @escaping DeleteChildTaskCompleteHandler)
    func updateChildTask(paramester: CreateChildTask,complete: @escaping  CreateChildTaskCompleteHandler)
}
