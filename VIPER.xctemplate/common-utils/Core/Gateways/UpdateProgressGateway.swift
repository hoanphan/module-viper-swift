//
//  UpdateProgressGateway.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 11/6/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation
typealias getListPlanUpdateProgressCompleteHandler = (_ plan:  Result<ResponseProgressReportEntity>) -> Void
typealias getProgressEnumeration = (_ Plant:  Result<ProgressEnumeration>) -> Void
typealias evalutingCompleteHandler = (_ Plant:  Result<EvalutingEntity>) -> Void
typealias getListStatusCompleteHandler = (_ listStatus: Result<[StatusEntity]>) -> Void
typealias getProgressCompleteEvalutingCompleteHandler = (_ plan:  Result<[ProgressEnumeration]>) -> Void
typealias getProgresReportStatusCompleteHandler = (_ progressEnumerations :  Result<[ProgressEnumeration]>) -> Void
typealias getProgressRateCompleteHandler = (_ valute: Result<[ProgressEnumeration]>) -> Void

typealias saveProgressUpdateCompleteHandler = (_ progressUpdates: Result<[ResponseProgressReportEntity]>) -> Void

typealias getDetailProgressUpdateCompleteHandler = (_ evaluating: Result<EvalutingEntity>) -> Void

struct EvalutingParameter{
    var comment: String = ""
    var completedStatus: ProgressEnumeration?
    var evaluated: ProgressEnumeration?
    var rate: String = ""
    var status: String = ""
    var taskId:Int = 0
}

struct ProgressReportParamester {
    var completed: Int
    var note: String
    var planDescriptionId: Int
    var status: Int
}


protocol UpdateProgressGateway{
    func getListPlan(formDate: String, taskId: Int, toDate: String, page:Int, completionHandler: @escaping getListPlanUpdateProgressCompleteHandler)
    
    func getProgressCompleteEvaluting(completionHandler: @escaping getProgressCompleteEvalutingCompleteHandler)
    
    
    func getProgressRate(completionHandler: @escaping getProgressRateCompleteHandler)
    
    func evaluting(evaluting:EvalutingParameter,completionHandler: @escaping evalutingCompleteHandler)
    
    func getStatus(completionHandler: @escaping getListStatusCompleteHandler)
    
    func getProgresReportStatus(completionHandler: @escaping getProgresReportStatusCompleteHandler)
    
    func saveProgressUpdate(list: [ProgressReportParamester], completionHandler: @escaping saveProgressUpdateCompleteHandler)
    
    func getDetailEvaluating(id: Int, completioHandler: @escaping getDetailProgressUpdateCompleteHandler)

}
