//
//  ReportGateway.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 10/29/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit

typealias CreateReportCompletionHandler = (_ report: Result<ReportEntity> ) -> Void
typealias GetListReportCompletionHandler = (_ report: Result<ResponseProgressHistory> ) -> Void
struct CreateReport {
    var id: Int
    var childTaskId: Int
    var createdByUserId: Int
    var fromDate: String
    var note: String
    var taskId: Int
    var toDate: String
}

protocol  ReportGateway {
    func createReport(paramester: CreateReport, completeHandler: @escaping CreateReportCompletionHandler)
    func getHistoryReportSubPlan(planId:Int, fromDate: String, toDate: String, completeHandler: @escaping GetListReportCompletionHandler)
    func getHistoryReportPlan(plan: Int, fromDate: String, toDate: String, completeHandler: @escaping GetListReportCompletionHandler)
}
