
//
//  DepartmentGateway.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 10/23/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit

typealias HandleGetDepartmentComplete = (_ department: Result<ChildrenDepartment>) -> Void
typealias HandleGetDepartmentTypeComplete =  (_ department: Result<[DepartmentTypeEntity]>) -> Void
typealias HandleGetDepartmentUserComplete = (_ users: Result<[UserEntity]>) -> Void

typealias HandleGetChildrendDepartmentUserComplete  =   (_ department: Result<[DepartmentTypeEntity]>) -> Void

typealias HandleGetChildrendDepartmentPlanComplete =  (_ department: Result<[ChildrenDepartment]>) -> Void
typealias HandleGetUserInPlan = (_ users:  Result<[UserEntity]>) -> Void

protocol DepartmentGateway {
    
    func getListDepartment(complete: @escaping HandleGetDepartmentComplete )
    
    func getTypeDepartment(type: String, complete: @escaping HandleGetDepartmentTypeComplete)
    
    func getDetailDepartment(id: String, complete: @escaping HandleGetDepartmentComplete )
    
    func getUsersDepartment(ids: String, complete: @escaping HandleGetDepartmentUserComplete)
    
    func getChildrenDepartment(id: Int, complete: @escaping HandleGetChildrendDepartmentUserComplete)
    
    func getPlanDepartment(id: Int, complete: @escaping HandleGetChildrendDepartmentPlanComplete)
    
    func getListUserInPlan(id: Int, idDepatment: Int,complete: @escaping HandleGetUserInPlan)
    
    func getUserTranferWork(idDepartment: Int, id: Int, complete: @escaping HandleGetDepartmentUserComplete)
    
    func getDepartmentAssigned(startDate: String, endDate: String, complete: @escaping HandleGetChildrendDepartmentPlanComplete )
    
    func getListUserInChildTask(id: Int, idDepatment: Int,complete: @escaping HandleGetUserInPlan)
    
    func getListDepartmentChildrend(id: Int, complete: @escaping HandleGetChildrendDepartmentPlanComplete)
}
