//
//  TaskExecutionGateway.swift
//  BaoVietOffice
//
//  Created by HOANPV on 11/1/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
typealias CreateTaskExcuteCompletionHandler = (_ result: Result<TaskWorkEntity>) -> Void
typealias GetRelatedUserCompletionHandler = (_ result:  Result<[UserEntity]>) -> Void
struct TaskResourceParamester{
   var childTaskId: Int
    var taskId: Int
    var directorEmail: [String]
    var executionDepartmentId: Int
    var executionUserIds: [Int]
}

protocol TaskExecutionGateway: class {
    func createExecutionResource(taskExcute: TaskResourceParamester, completeHandler: @escaping CreateTaskExcuteCompletionHandler)
    func getRelatedUser(taskId: Int, completeHandler: @escaping GetRelatedUserCompletionHandler)
}
