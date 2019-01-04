

//
//  PlanApproveGateway.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 10/31/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
typealias CreateApproveCompleteHandler = (_ approve:  Result<ApproveEntity>) -> Void
typealias GetDeataiCompleteHandler = (_ approve: Result<ApproveEntity>) -> Void
protocol PlanApproveGateway{
    func createApprove(approve: ParamApprovePlan, completionHandler: @escaping CreateApproveCompleteHandler)
    func getDetailApprove(id: Int, completionHandler: @escaping GetDeataiCompleteHandler )
}
