//
//  TSAPIWorkTargetType.swift
//  VIPER-demo
//
//  Created by HOANDHTB on 1/2/19.
//  Copyright © 2019 Tootle. All rights reserved.
//

import UIKit

extension WORK_TSAPI:TargetType {

    var baseURL: URL {
        return URL(string: Config.rootUrl)!
    }
    
    var path: String {
        switch self {
        case .authenticate:
            return "/api/authenticate"
        case .getUserInfor(let user):
            return "/api/users/\(user!)"
        case .getUser:
            return "/api/account"
        //MARK Task
        case .getTaskAsigned:
            return "/api/assigned-tasks"
        case .getTaskAsignee:
            return "/api/assignee-tasks"
        case .getTaskPersonal:
            return "/api/personal-tasks"
        case .getTaskDeadline:
            return "/api/on-deadline-tasks"
        case .getCoWorkingTask:
            return "/api/co-working-tasks"
        case .returnBack(let id):
            return "/api/tasks/return-back/\(id)"
        case .evictionBack(let id):
            return "/api/tasks/eviction-back/\(id)"
        //+
        case .getListDepartment:
            return "/api/departments"
        case .getTaskType:
            return "/api/tasks-type"
        case .getListPlan:
            return "/api/plan/get-by-task-id"
        case .getTaskFrom:
            return "/api/tasks-from"
        case .getTaskStatus:
            return "/api/tasks-status"
        case .getTasksUpdateProgess:
            return "/api/tasks-update-progess"
        case .createTask:
            return "/api/tasks"
        case .updateTask:
            return "/api/tasks"
        case .getTaskCatalog:
            return "/api/tasks-catalog"
        case .getDetailTask(let id):
            return "/api/tasks/\(id!)"
        case .deleteTask(let id):
            return "/api/tasks/\(id)"
        case .getTaskExcuter:
            return "/api/task-executors"
        case .getSecretaryUsers:
            return "/api/tasks/secretary-for-users"
        //+ Tranfer task
        case .getChangeableUsers(let departmentId, let id):
            return "/api/tasks/\(id!)/changeable-users/\(departmentId!)"
        case .getRelatedUser(let idTask):
            return "/api/task-execution/\(idTask!)/related-users"
        //MARK Department
        case .getListDepartmentFollowId(let id):
            return "/api/departments/\(id)"
        case .departmentsByType:
            return "/api/departments-by-type"
        case .getUsersDepartment(let ids):
            return "/api/departments-user/\(ids!)"
        case .getListDeparmentChildren(let id):
            return "/api/departments-children/\(id!)"
        case .createReport(let report):
            return "/api/task/\(report!.id)/report"
        case .getListReport(let planId, _, _):
            return "/api/progress-report/\(planId!)/plan-description-history"
        case .getAssignedDepartment:
            return "/api/tasks/assigned-by-departments"
        //MARK: Plan
        case .createPlan:
            return "/api/plan"
        case .getDetailPlan:
            return "/api/plan/get-plan-description-by-id"
        case .updatePlan:
            return "/api/plan/update-plan-description"
        case .deletePlan(let id):
            return "/api/plan/\(id!)"
        case .createApprovePlan(let paramester):
            return "/api/plan/\(paramester!.id)"
        case .getDetailApproval(let id):
            return "/api/plan/\(id!)/approval"
        case .getHistoryPlan(let id):
            return "/api/plan/\(id!)/history"
        case .getDeparmentPlan(let id):
            return "/api/tasks/\(id!)/execution-departments"
        case .getUserExcuterPlan(let departmentId, let id):
            return "/api/tasks/\(departmentId!)/plannable-users/\(id!)"
        //MARK: task excution
        case .createTaskExcution(let taskExcution):
            if taskExcution!.childTaskId != 0
            {
                return "/api/task-execution?childTaskId=\(taskExcution!.childTaskId)&taskId=\(taskExcution!.taskId)"
            }
            return "/api/task-execution?taskId=\(taskExcution!.taskId)"
        //MARK child task
        case .getListChildTask(let id, _ , _):
            return "/api/child-task-by-parent/\(id!)"
        case .getListWeight:
            return "/api/tasks/weight"
        case .getListProgessUpdateChildTask:
            return "/api/child-task/list-progress-update"
        case .createChildTask:
            return "/api/child-task/create"
        case .deleteChildTask(let id):
            return "/api/child-task/\(id!)"
        case .updateChildTask(let data):
            return "/api/child-task/\(data!.id)"
        case .getUserChildTask( let id , let idDepartment):
            return "/api/tasks/\(id!)/divide-task-to-users/\(idDepartment!)"
        case .getDepartmentChildTask(let id):
            return "/api/tasks/\(id!)/execution-departments"
        //MARK updateProgress
        case .getListUpdateProgress:
            return"/api/progress-report"
        case .getStatusProgressReport:
            return "/api/progress-report-status"
        case .getProgressCompleteEvaluting:
            return "/api/progress-complete-evaluating"
        case .getProgressRate:
            return "/api/progress-rate"
        case .evaluting:
            return "/api/progress-evaluate"
        case .getProgressReportStatus:
            return "/api/progress-report-status"
        case .saveProgressReport:
            return "/api/progress-report"
        case .getDetailEvaluating(let id):
            return "/api/progress-evaluating-by-task-id/\(id!)"
        case .getListReportPlan(let id, _, _):
            return "/api/progress-report/\(id!)/plan-history"
        default:
            return ""
        }
    }
    
    
    
    
    var method: Moya.Method {
        switch self {
        case .authenticate, .createTask, .createReport, .createPlan, .createTaskExcution, .createChildTask, .evaluting, .saveProgressReport:
            return .post
            
        case .updateTask, .updatePlan, .createApprovePlan, .updateChildTask, .returnBack, .evictionBack:
            return .put
        case .getUserInfor,.getTaskAsigned, .getListDepartment, .getTaskType, .getTaskFrom, .getTaskStatus, .getTasksUpdateProgess, .getTaskCatalog,.getListPlan, .getDetailTask, .departmentsByType, .getListDepartmentFollowId, .getUsersDepartment, .getListReport, .getTaskExcuter, .getListChildTask, .getListWeight, .getListProgessUpdateChildTask, .getUser, .getListDeparmentChildren, .getListUpdateProgress,.getStatusProgressReport, .getDetailPlan, .getDetailApproval, .getHistoryPlan, .getProgressRate, .getProgressCompleteEvaluting, .getSecretaryUsers, .getDetailEvaluating, .getDeparmentPlan, .getChangeableUsers, .getAssignedDepartment, .getUserChildTask, .getListReportPlan, .getDepartmentChildTask, .getRelatedUser, .getTaskDeadline, .getCoWorkingTask:
            return .get
        case .deleteTask, .deletePlan, .deleteChildTask:
            return .delete
        default:
            return .get
        }
    }
    
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .authenticate, .createTask, .updateTask, .createReport, .createPlan, .createApprovePlan, .updatePlan, .createTaskExcution, .createChildTask, .evaluting, .updateChildTask:
            return JSONEncoding.default
        case .getUserInfor, .getListDepartment, .getTaskType,.getTaskFrom, .getTaskStatus, .getTasksUpdateProgess, .getTaskCatalog,.getListPlan, .getDetailTask, .deleteTask, .departmentsByType, .getListDepartmentFollowId, .getUsersDepartment, .getListReport, .deletePlan, .getTaskAsigned, .getTaskExcuter, .getListChildTask, .getListWeight, .getListProgessUpdateChildTask, .getUser, .getListDeparmentChildren, .getListUpdateProgress, .getDetailPlan, .getDetailApproval, .getHistoryPlan, .getProgressRate, .getProgressCompleteEvaluting, .deleteChildTask, .getSecretaryUsers, .getDetailEvaluating, .getDeparmentPlan, .getChangeableUsers, .getAssignedDepartment, .getUserChildTask, .getListReportPlan,.getDepartmentChildTask, .getRelatedUser, .getTaskDeadline, .getCoWorkingTask, .returnBack, .evictionBack:
            return URLEncoding.default
        case .saveProgressReport:
            return JSONArrayEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    
    var sampleData: Data {
        switch self {
        default:
            guard let url = Bundle.main.url(forResource: "Demo", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    public var parameters: [String : Any]? {
        switch self {
        case .authenticate(let username, let password):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["username"] = username
                parameter["password"] = password
                parameter["rememberMe"] = "true"
                return parameter
            }
            return paramester
        case .createTask(let createTask), .updateTask(let createTask):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["assignedByUserId"] = createTask?.assignedByUserId
                parameter["attachmentFile"] = createTask?.attachmentFile
                parameter["coWorkers"] = createTask?.coWorkers
                parameter["coWorkingDepartments"] = createTask?.coWorkingDepartments
                parameter["description"] = createTask?.description
                parameter["executionDepartment"] = createTask?.executionDepartment
                if createTask?.executionDepartment == 0
                {
                    parameter["executionDepartment"] = ""
                }
                else
                {
                    parameter["executionDepartment"] = createTask?.executionDepartment
                }
                parameter["executors"] = createTask?.executors
                
                parameter["finishDate"] = createTask?.finishDate != "" ? createTask?.finishDate : NSNull()
                parameter["name"] = createTask?.name
                parameter["needPlan"] = createTask!.needPlan
                parameter["remind"] = createTask!.remind
                parameter["startDate"] = createTask?.startDate
                parameter["status"] = createTask?.status
                parameter["taskCatalogId"] = createTask?.taskCatalog
                parameter["taskFromId"] = createTask?.taskFrom
                if createTask?.taskProgressUpdates != ""
                {
                    parameter["taskProgressUpdateId"] = createTask?.taskProgressUpdates
                }
                else
                {
                    parameter["taskProgressUpdateId"] =  ""
                }
                parameter["taskType"] = createTask?.taskType
                parameter["id"] = createTask?.id
                return parameter
            }
            return paramester
        case .createPlan(let createPlan), .updatePlan(let createPlan):
            var paramester: [String:Any] = [:]
            paramester["description"] = createPlan.description
            paramester["executionDepartmentId"] = createPlan.executionDepartmentId
            paramester["fromDate"] = createPlan.fromDate
            paramester["id"] = createPlan.id
            paramester["name"] = createPlan.name
            paramester["planId"] = createPlan.planId
            paramester["remind"] = createPlan.remind
            paramester["taskId"] = createPlan.taskId
            paramester["toDate"] = createPlan.toDate
            paramester["executorId"] = createPlan.executorId
            return paramester
            
        case .getTaskAsigned(let filter):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["sort.sorted"] = "true"
                parameter["paged"] = "true"
                if filter.departmentId != 0
                {
                    parameter["departmentId"] = filter.departmentId
                }
                if !filter.toDate.isEmpty {
                    parameter["toDate"] = filter.toDate
                    
                }
                if !filter.fromDate.isEmpty
                {
                    parameter["fromDate"] = filter.fromDate
                }
                parameter["page"] = filter.page
                parameter["size"] = 20
                parameter["sort"] = "id,desc"
                return parameter
            }
            return paramester
        case .getTaskDeadline(let filter):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["sort.sorted"] = "true"
                parameter["paged"] = "true"
                if filter.departmentId != 0
                {
                    parameter["departmentId"] = filter.departmentId
                }
                if !filter.toDate.isEmpty {
                    parameter["toDate"] = filter.toDate
                    
                }
                if !filter.fromDate.isEmpty
                {
                    parameter["fromDate"] = filter.fromDate
                }
                parameter["page"] = filter.page
                parameter["size"] = 20
                parameter["sort"] = "startDate,desc"
                parameter["taskType"] = filter.taskType.rawValue
                return parameter
            }
            return paramester
            
        case .getCoWorkingTask(let filter):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["sort.sorted"] = "true"
                parameter["paged"] = "true"
                if filter.departmentId != 0
                {
                    parameter["departmentId"] = filter.departmentId
                }
                if !filter.toDate.isEmpty {
                    parameter["toDate"] = filter.toDate
                    
                }
                if !filter.fromDate.isEmpty
                {
                    parameter["fromDate"] = filter.fromDate
                }
                parameter["page"] = filter.page
                parameter["size"] = 20
                parameter["sort"] = "startDate,desc"
                parameter["taskType"] = filter.taskType.rawValue
                return parameter
            }
            return paramester
        case .getTaskAsignee(let filter):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["sort.sorted"] = "true"
                parameter["paged"] = "true"
                if filter.departmentId != 0
                {
                    parameter["departmentId"] = filter.departmentId
                }
                if !filter.toDate.isEmpty {
                    parameter["toDate"] = filter.toDate
                    parameter["fromDate"] = filter.fromDate
                }
                if filter.taskStatus != .NIL
                {
                    parameter["taskStatus"] = filter.taskStatus.rawValue
                }
                
                parameter["page"] = filter.page
                parameter["size"] = 20
                parameter["sort"] = "id,desc"
                return parameter
            }
            return paramester
        case .getTaskPersonal(let filter):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["sort.sorted"] = "true"
                parameter["paged"] = "true"
                if filter.executorId != 0
                {
                    parameter["executorId"] = filter.executorId
                }
                if !filter.toDate.isEmpty {
                    parameter["toDate"] = filter.toDate
                    
                }
                if !filter.fromDate.isEmpty
                {
                    parameter["fromDate"] = filter.fromDate
                }
                parameter["page"] = filter.page
                parameter["size"] = 20
                parameter["sort"] = "id,desc"
                return parameter
            }
            return paramester
        case .getListPlan(let taskId, let userId, let page):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["taskId"] = taskId
                parameter["paged"] = "true"
                parameter["page"] = page
                parameter["size"] = 20
                parameter["sort"] = "id"
                return parameter
            }
            return paramester
        case .departmentsByType(let type):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["departmentType"] = type
                return parameter
            }
            return paramester
        case .getUsersDepartment(let ids):
            return [:]
        case .createReport(let report):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["childTaskId"] = report?.childTaskId
                parameter["createdByUserId"] = report?.createdByUserId
                parameter["fromDate"] = report?.fromDate
                parameter["note"] = report?.note
                parameter["taskId"] = report?.taskId
                parameter["toDate"]  = report?.toDate
                return parameter
            }
            return paramester
        case .createApprovePlan(let aprove):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["childTaskId"] = aprove?.childTaskId
                parameter["comment"]  = aprove?.comment
                parameter["createdAt"] = aprove?.createdAt
                parameter["id"]  = aprove?.id
                parameter["status"] = aprove?.status
                parameter["taskId"]  = aprove?.taskId
                return parameter
            }
            return paramester
        case .createTaskExcution(let create):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["directorEmails"] = create!.directorEmail
                parameter["executionDepartmentId"]  = create!.executionDepartmentId
                parameter["executorId"] = create!.executionUserIds[0]
                return parameter
            }
            return paramester
            
        case .createChildTask( let create), .updateChildTask( let create):
            var parameter:[String: Any] = [:]
            parameter["createdAt"] = create!.createdAt
            parameter["executionDepartmentId"]  = create!.executionDepartmentId
            parameter["executorId"] = create!.executorId
            if create?.finishAt == ""
            {
                parameter["finishDate"] = NSNull()
            }
            else
            {
                parameter["finishDate"] = create?.finishAt
            }
            
            parameter["id"] = create?.id
            parameter["name"] = create?.name
            parameter["needPlan"] = create!.needPlan
            parameter["parentId"] = create?.parentId
            parameter["purpose"] = create?.purpose
            parameter["startDate"] = create?.createdAt
            parameter["status"] = create?.status
            parameter["taskProgressUpdates"] = create?.taskProgressUpdates
            if create?.weigh == ""
            {
                parameter["weight"] = NSNull()
            }
            else
            {
                parameter["weight"] = create?.weigh
            }
            return parameter
        case .getListUpdateProgress(let taskId, let fromDate, let toDate, let page):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["fromDate"] = fromDate
                parameter["taskId"]  = taskId
                parameter["toDate"] = toDate
                parameter["paged"]  = "true"
                parameter["page"] = page
                parameter["size"] = 20
                return parameter
            }
            return paramester
        case .evaluting(let evaluteParram):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["comment"] = evaluteParram?.comment
                if evaluteParram?.completedStatus != nil
                {
                    parameter["completedStatusId"]  = evaluteParram?.completedStatus?.id
                }
                else
                {
                    parameter["completedStatusId"] = 0
                }
                if evaluteParram?.evaluated != nil
                {
                    parameter["evaluatedId"] = evaluteParram?.evaluated?.id
                }
                else
                {
                    parameter["evaluatedId"] = 0
                }
                parameter["rate"] = evaluteParram?.rate
                parameter["status"] = evaluteParram?.status
                parameter["taskId"] = evaluteParram?.taskId
                return parameter
            }
            return paramester
        case .getDetailPlan(let id):
            var parameter:[String:Any] = [:]
            parameter["planDescriptionId"] = id
            return parameter
            
        case .saveProgressReport(let arr):
            var parameter:[Any] = []
            for item in arr
            {
                var subParameter: [String: Any] = [:]
                subParameter["completed"] = item.completed
                subParameter["note"] = item.note
                subParameter["planDescriptionId"] = item.planDescriptionId
                subParameter["status"] = item.status
                parameter.append(subParameter)
            }
            return ["jsonArray":parameter]
        case .getListReport(_,let fromDate, let toDate):
            var parameter:[String:Any] = [:]
            parameter["fromDate"] = fromDate
            parameter["toDate"] = toDate
            parameter["sort.sorted"] = "true"
            parameter["sort"] = "createdAt,desc"
            return parameter
        case .getListReportPlan( _ ,let fromDate, let toDate):
            
            var parameter:[String:Any] = [:]
            parameter["fromDate"] = fromDate
            parameter["toDate"] = toDate
            parameter["sort.sorted"] = "true"
            parameter["sort"] = "createdAt,desc"
            return parameter
        case .getAssignedDepartment(let fromDate, let toDate):
            var parameter:[String:Any] = [:]
            if !fromDate!.isEmpty
            {
                parameter["fromDate"] = fromDate
            }
            if !toDate!.isEmpty
            {
                parameter["toDate"] = toDate
            }
            return parameter
        case .getListChildTask(_, let fromDate, let toDate):
            var parameter:[String:Any] = [:]
            if !fromDate!.isEmpty
            {
                parameter["fromDate"] = fromDate
            }
            if !toDate!.isEmpty
            {
                parameter["toDate"] = toDate
            }
            return parameter
        case .getUserInfor, . getListDepartment, .getTaskType, .getTaskFrom, .getTaskStatus, .getTasksUpdateProgess, .getTaskCatalog, .getDetailTask, .deleteTask, .getListDepartmentFollowId, .deletePlan, .getTaskExcuter,  .getListWeight, .getListProgessUpdateChildTask, .getUser, .getListDeparmentChildren, .getDetailApproval, .getHistoryPlan, .getStatusProgressReport, .getProgressRate, .getProgressCompleteEvaluting, .deleteChildTask, .getSecretaryUsers, .getDetailEvaluating, .getDeparmentPlan, .getUserExcuterPlan, .getChangeableUsers, .getUserChildTask, .getDepartmentChildTask, .getRelatedUser, .returnBack, .evictionBack:
            return [:]
        default:
            return [:]
        }
    }
    
    var task: Moya.Task {
        return .requestParameters(parameters: self.parameters! , encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        let user = UserEntity.getFirstUser()
        switch self {
        case .authenticate:
            return ["Content-Type": "application/json"]
            
        case .getUserInfor:
            return ["Authorization": "Bearer \(CacheLogin.token)"]
            
        case  .getListDepartment,.getTaskAsigned,.getTaskAsignee , .getTaskPersonal, .getTaskType, .getTaskFrom, .getTaskStatus, .getTasksUpdateProgess, .getTaskCatalog, .getListPlan, .getDetailTask, .deleteTask, .departmentsByType, .getListDepartmentFollowId, .getUsersDepartment, .getListReport, .deletePlan, .getTaskExcuter, .getListChildTask, .getListWeight, .getListProgessUpdateChildTask, .getUser, .getListDeparmentChildren, .getListUpdateProgress, .getDetailPlan, .getDetailApproval, .getHistoryPlan, .getStatusProgressReport, .getProgressRate, .getProgressCompleteEvaluting, .deleteChildTask, .updateChildTask, .getSecretaryUsers, .getDetailEvaluating, .getDeparmentPlan, .getUserExcuterPlan, .getChangeableUsers, .getAssignedDepartment, .getUserChildTask, .getListReportPlan,.getDepartmentChildTask, .getRelatedUser, .getTaskDeadline, .getCoWorkingTask:
            let header = ["Authorization": "Bearer \(user!.token_key)", "Accept": "application/json"]
            return header
        case .createTask, .updateTask, .createReport, .createPlan, .createApprovePlan, .updatePlan, .createTaskExcution, .createChildTask, .evaluting, .saveProgressReport, .returnBack, .evictionBack:
            return ["Content-Type": "application/json", "Authorization": "Bearer \(user!.token_key)"]
        default:
            return [:]
        }
        
    }

}
