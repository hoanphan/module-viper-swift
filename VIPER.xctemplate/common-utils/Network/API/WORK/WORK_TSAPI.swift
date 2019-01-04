//
//  WORK_TSAPI.swift
//  VIPER-demo
//
//  Created by HOANDHTB on 1/2/19.
//  Copyright © 2019 Tootle. All rights reserved.
//

import UIKit

enum WORK_TSAPI {
        //MARK: user
        case authenticate(String?, String?)
        case getUserInfor(String?)
        case getUser()
        //MARK: task
        // case getTask(ParamWorkTask)
        case getTaskType()
        case getTaskFrom()
        case getTaskStatus()
        case getTasksUpdateProgess()
        case getTaskCatalog()
        case createTask(ParamCreateWorkTask?)
        case updateTask(ParamCreateWorkTask?)
        case getDetailTask(String?)
        case deleteTask(String)
        case departmentsByType(String?)
        case returnBack(Int)
        case evictionBack(Int)
        //    case getTaskQuanlityByStatus()
        //    case getPersonalTaskQuanlity()
        //+ get list task
        case getTaskAsigned(ParamWorkTask)
        case getTaskAsignee(ParamWorkTask)
        case getTaskPersonal(ParamWorkTask)
        case getTaskDeadline(ParamWorkTask)
        case getCoWorkingTask(ParamWorkTask)
        
        case getTaskExcuter()
        case getSecretaryUsers()
        case getAssignedDepartment(String?, String?)
        //+ Tranfer Task
        case getChangeableUsers(Int?, Int?)
        case getRelatedUser(Int?)
        //MARK: report
        case createReport(CreateReport?)
        case getListReport(Int?, String?, String?)
        case getHistory(Int?, String?, String)
        case getListReportPlan(Int?, String?, String)
        //MARK: department
        case getListDepartment()
        case getListDepartmentFollowId(String)
        case getUsersDepartment(String?)
        case getListDeparmentChildren(String?)
        //MARK: plan
        case getListPlan(Int?, String?, Int?)
        case createPlan(ParamPlanCreate)
        case updatePlan(ParamPlanCreate)
        case deletePlan(Int?)
        case getDetailPlan(Int?)
        case getDetailApproval(Int?)
        case getHistoryPlan(Int?)
        case getDeparmentPlan(Int?)
        case getUserExcuterPlan(Int?, Int?)
        //MARK approve
        case createApprovePlan(ParamApprovePlan?)
        //MARK excute task
        case createTaskExcution(TaskResourceParamester?)
        //MARK: child task
        case getListChildTask(Int?, String?, String?)
        case getListWeight()
        case getListProgessUpdateChildTask()
        case createChildTask(CreateChildTask?)
        case updateChildTask(CreateChildTask?)
        case deleteChildTask(Int?)
        case getUserChildTask(Int?, Int?)
        case getDepartmentChildTask(Int?)
        //MARK: update progress
        case getListUpdateProgress(Int, String, String,Int)
        case getStatusProgressReport()
        case getProgressCompleteEvaluting()
        case getProgressRate()
        case evaluting(EvalutingParameter?)
        case getProgressReportStatus()
        case saveProgressReport([ProgressReportParamester])
        case getDetailEvaluating(Int?)
        
}
