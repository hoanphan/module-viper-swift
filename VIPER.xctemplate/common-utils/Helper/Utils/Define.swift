//
//  Define.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
struct SegueIdentifier {
    //Explore
    static let goPlayLitsController = "goPlayLitsController"
    static let goToWorkStoryboard = "goToWorkStoryboard"
    static let goToCalendar = "goToCalendar"
    static let backHome = "backHome"
    
    //Work
    static let goToWorkOwn = "goToWorkOwn"
    static let goToWorkAssign = "goToWorkAssign"
    static let goToWorkAssigned = "goToWorkAssigned"
    static let backWorkMain = "backWorkMain"
    
    static let updateWorkAssign = "updateWorkAssign"
    static let goToRootMainWork = "goToRootMainWork"
    
    static let backWorkDetailMain = "backWorkDetailMain"
    static let goToMainDetailWork = "goToMainDetailWork"
    static let showDetailWork = "showDetailWork"
    static let showWorkTranfer = "showWorkTranfer"
    static let showUpdateProgress = "showUpdateProgress"
    
    static let showPlanWork = "showPlanWork"
    static let backDialogNeedPlan = "backDialogNeedPlan"
    static let goToHandlePlan = "goToHandlePlan"
    static let goToHandleAccept = "goToHandleAccept"
    static let backNeedPlan = "backNeedPlan"
    static let showHistoryPlan = "showHistoryPlan"
    static let backUpdatePlan = "backUpdatePlan"
    
    static let goToWorkReport = "goToWorkReport"
    static let showReportWorkHistory = "showReportWorkHistory"
    static let backToReportWork = "backToReportWork"
    static let showPlanWorkStaff = "showPlanWorkStaff"
    static let goToListPlan = "goToListPlan"
    static let backPlanWork = "backPlanWork"
    static let showDialogEvalueting = "showDialogEvalueting"
    static let showReportHistory = "showReportHistory"
    
    static let showSplitWork = "showSplitWork"
    static let detailSplitWork = "detailSplitWork"
    //Schedule work
    static let showTaskSchedule = "showTaskSchedule"
    static let backMainCalendar = "backMainCalendar"
    static let showUpdateProgressDetail = "showUpdateProgressDetail"
}

struct ControllerIdentifier {
    //Login
    static let loginController = "loginController"
    
    static let sideMenu = "SideMenu"
    
    //Work
    static let historyReport = "HistoryReport"
    static let historyPlanController = "historyPlanController"
    static let detailSegment = "detailSegment"
    static let splitWorkController = "splitWorkController"
    static let transferWorkController = "transferWorkController"
    static let acceptWorkController = "acceptWorkController"
    static let updatePlanController = "updatePlanController"
    //+ split work
    static let listChildWorkController = "listChildWorkController"
    static let splitSegment = "splitSegment"
}
struct DateFormat {
    static let yyyyssDash = "yyyy-MM-dd'T'HH:mm:ss"
    static let ddmmSlash = "dd/MM/yyyy HH:mm"
    static let ddMMyyyy = "dd/MM/yyyy"
    static let MMyyyy = "MM/yyyy"
    static let yyyyMMdd = "yyyy/MM/dd"
    static let yyyymsDash = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let yyyymsZDash = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static let HHmm = "HH:mm"
    static let slashddmmyy = "HH:mm dd/MM/yyyy"
    static let yyyymdHmsZ = "yyyy-MM-dd HH:mm:ss ZZZ"
    static let yyyyMdHms = "yyyy/MM/dd HH:mm:ss"
    static let ddMMMMyyyy = "dd MMMM','yyyy"
    static let yyyyMMddHHmmss = "yyyyMMddHHmmss"
}

enum notificationName: String {
    //Login
    case logout = "logout"
    //Main
    case goToWork = "goToWork"
    case goToSetting = "goToSetting"
    
    //Word
    case detailWork = "detailWork"
    case tapDepartment = "tapDepartment"
    case reloadDataDepartment = "reloadDataDepartment"
    case showDialogNeedPlan = "showDialogNeedPlan"
    case reloadAllDataWork = "reloadAllDataWork"
    case changeStateWork = "changeStateWork"
    //segment main work
    case tapAssignWork = "tapAssignWork"
    case tapAssignedWork = "tapAssignedWork"
    case tapPersonalWork = "tapPersonalWork"
    //+ Work total direct
    case updateWork = "updateWork"
    case copyWork =  "copyWork"
    case createPlan = "createPlan"
    case updatePlan = "updatePlan"
    case splitWork = "splitWork"
    case transferWork = "transferWork"
    case detailPlan = "detailPlan"
    case createAccept = "createAccept"
    //+ Work staff
     case goToReportWork = "goToReportWork"
    case  goToPlanWorkStaff = "goToPlanWorkStaff"
    
    //+ child task
    case goToDetailChildTask = "goToDetailChildTask"
    case goToDetailChildTaskInBigTask = "goToDetailChildTaskInBigTask" 
    //+Plan
    case reloadTbPlan = "reloadTbPlan"
    case showHistoryReport = "showHistoryReport"
    case goToUpdateProgressDetail = "goToUpdateProgressDetail"
    case approvePlan = "approvePlan"
    //  UpdateProgress
    case popUpdateProgress = "popUpdateProgress"
    case backReloadUpdateProgress = "backReloadUpdateProgress"
    case reloadUpdateProgress = "reloadUpdateProgress"
    case listUpdateProgress = "listUpdateProgress"
    case evaluating = "evaluating"
    //split task
    case reloadChildTask = "reloadChildTask"
    case tapDetailSplit = "tapDetailSplit"
    //Tranfer word
    case successTranfer = "successTranfer"
    var notification: NSNotification.Name{
        return Notification.Name(rawValue: self.rawValue)
    }
}



struct CodeResponse  {
    public static var success: Int = 0
    public static var failure: Int = 400
}

class Role
{
    public static var type: Int = 0
    public static var tranfer: Bool = true
}
class CacheLogin{
    public static var token:String = ""
}

enum ActionType: String{
    case add = "add"
    case update = "update"
    case view = "view"
    case copy = "copy"
    case delete = "delete"
}

struct RoleUser
{
   public static let GENERAL_DIRECTOR = "GENERAL_DIRECTOR"
     public static let ROLE_EMPLOYEE = "EMPLOYEE"
    public static let ROLE_DIRECTOR = "DIRECTOR"
    
}

struct ActionLoadData
{
    public static let beginCallApi: Int = 0
    public static let afterCallApi: Int = 1
    public static let pullToRefesh: Int = 2
}

enum TaskType: String
{
    case PERSONAL_TASK = "PERSONAL_TASK"
    case ASSIGNEE_TASK = "ASSIGNEE_TASK"
    case ASSIGNED_TASK = "ASSIGNED_TASK"
    case DEADLINE_TASK = "DEADLINE_TASK"
    case CO_WORKING_TASK = "CO_WORKING_TASK"
}

enum TaskStatus: String
{
    case  NIL = ""
    case SUSPEND = "SUSPEND"
    case HOLD = "HOLD"
    case BEHIND_SCHEDULE = "BEHIND_SCHEDULE"
    case TO_DO = "TO_DO"
    case DONE = "DONE"
    case PROCESSING = "PROCESSING"
}


enum DashboardStatus: String
{
    case ASSIGNEE_TASK = "ASSIGNEE_TASK"
    case ASSIGNED_TASK = "ASSIGNED_TASK"
    case ON_DEADLINE_TASK = "ON_DEADLINE_TASK"
    case CO_WORKING_TASK = "CO_WORKING_TASK"
    case PERSONAL_TASK = "PERSONAL_TASK"
}
enum PlanStatus : String
{
    case WAITING_FOR_APPROVED = "WAITING_FOR_APPROVED"
    case UNAPPROVED = "UNAPPROVED"
    case APPROVED = "APPROVED"
}

class parramSendApp
{
    public static var typeTask: TaskType = TaskType.ASSIGNED_TASK
    public static var task: TaskWorkEntity?
    public static var plan: PlanDescriptionsEntity?
    public static var indexSegmentType: Int = 0
    public static var needPlan:Bool = false
    public static var fromDate:Date?
    public static var planDescriptionId:Int = 0
    public static var toDate:Date?
}

