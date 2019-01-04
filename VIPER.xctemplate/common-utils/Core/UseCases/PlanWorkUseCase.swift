//
//  PlanWorkUseCase.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 10/25/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation
typealias PlanWorkUseCaseCompletionHandler = (_ work: Result<PlanWorkEntity>) -> Void
typealias PlanDeleteUseCaseCompletionHandler = (_ work: Result<[PlanWorkEntity]>) -> Void
typealias PlanCreateUseCaseComletionHandler = (_ plan: Result<PlanDescriptionsEntity>) -> Void
typealias UpdateCreateUseCaseComletionHandler = (_ plan: Result<ResponseTaskWorkCreate>) -> Void
protocol PlanWorkUseCase{
    func getListPlanWork(paramester: ParamPlanWork,  completionHandler: @escaping PlanWorkUseCaseCompletionHandler)
    func createPlan(paramester: ParamPlanCreate,  completionHandler: @escaping PlanCreateUseCaseComletionHandler)
    func updatePlan(paramester: ParamPlanCreate,  completionHandler: @escaping PlanCreateUseCaseComletionHandler)
    func deletePlan(id:Int, completionHandler: @escaping PlanCreateUseCaseComletionHandler)
}


class PlanWorkUseCaseImplement:  PlanWorkUseCase{
    func getListPlanWork(paramester: ParamPlanWork, completionHandler: @escaping PlanWorkUseCaseCompletionHandler) {
        self.planWorkGateway.getListPlanWork(paramester: paramester) { (result) in
            completionHandler(result)
        }
    }
    func createPlan(paramester: ParamPlanCreate, completionHandler: @escaping PlanCreateUseCaseComletionHandler) {
        self.planWorkGateway.createdPlan(paramester: paramester) { (result) in
            completionHandler(result)
        }
    }
    
    func deletePlan(id:Int, completionHandler: @escaping PlanCreateUseCaseComletionHandler) {
        self.planWorkGateway.deletePlan(id: id) { (result) in
            completionHandler(result)
        }
    }
    
    func updatePlan(paramester: ParamPlanCreate, completionHandler: @escaping PlanCreateUseCaseComletionHandler) {
        self.planWorkGateway.updatedPlan(paramester: paramester) { (result) in
            completionHandler(result)
        }
    }
    let planWorkGateway: PlanWorkGateway
    
    init(planWorkGateway: PlanWorkGateway) {
        self.planWorkGateway = planWorkGateway
    }
    
}
