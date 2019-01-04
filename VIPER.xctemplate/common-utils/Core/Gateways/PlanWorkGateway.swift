//
//  PlanWorkGateway.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 10/25/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation

typealias PlanWorkGatewayCompletionHandler = (_ plan: Result<PlanWorkEntity>) -> Void
typealias PlanCreateGatewayComletionHandler = (_ plan: Result<PlanDescriptionsEntity>) -> Void
typealias PlanUpdateGatewayComletionHandler = (_ plan: Result<PlanDescriptionsEntity>) -> Void
typealias DeletePlanGateWayComletionHandler = (_ plan: Result<PlanDescriptionsEntity>) -> Void
typealias GetDescriptionCompletionHandler = (_ description: Result<PlanDescriptionsEntity>) -> Void
typealias GetHistoryPlanCompletionHandler = (_ history: Result<ResponseHistoryPlan>) -> Void
struct ParamPlanWork
{
    var taskId:Int
    var userId: String
    var page: Int
    
    init(taskId: Int, userId: String, page:Int) {
        self.taskId = taskId
        self.userId = userId
        self.page = page
    }
}
struct  ParamPlanCreate {
    var description: String
    var executionDepartmentId: Int
    var executorId: Int
    var fromDate: String
    var id: Int
    var name: String
    var planId: Int
    var remind: Bool
    var taskId: Int
    var toDate: String
}

struct ParamApprovePlan {
    var childTaskId: Int
    var comment: String
    var createdAt: String
    var id: Int
    var status: String
    var taskId: Int
}

protocol PlanWorkGateway {
    func getListPlanWork(paramester: ParamPlanWork, completionHandler: @escaping PlanWorkGatewayCompletionHandler)
    func createdPlan(paramester: ParamPlanCreate, completionHandler: @escaping PlanCreateGatewayComletionHandler)
    func updatedPlan(paramester: ParamPlanCreate, completionHandler: @escaping PlanUpdateGatewayComletionHandler)
    func deletePlan(id: Int, completionHandler: @escaping DeletePlanGateWayComletionHandler)
    func getDetail(id: Int, completionHandler: @escaping GetDescriptionCompletionHandler)
    func getHistory(id: Int, completionHndler: @escaping GetHistoryPlanCompletionHandler)
}
