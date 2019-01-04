//
//  HistoryPlan.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 11/17/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class HistoryPlan: NSObject, Mappable {
    var id: Int = 0
    var name: String = ""
    var executor: UserEntity?
    var createByUser: UserEntity?
    var approvedByUser: UserEntity?
    var fromDate: String = ""
    var toDate: String = ""
    var approvedAt: String = ""
    var createdAt: String = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        executor <- map["executor"]
        createByUser <- map["createByUser"]
        approvedByUser <- map["approvedByUser"]
        fromDate <- map["fromDate"]
        toDate <- map["toDate"]
        approvedAt <- map["approvedAt"]
        createdAt <- map["createdAt"]
    }
}

class DataHistoryPlan: NSObject, Mappable {
    var content: [HistoryPlan] = []
    var totalPages: Int = 0
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        content <- map["content"]
        totalPages <- map["totalPages"]
    }
}

class ResponseHistoryPlan: NSObject, Mappable
{
    var status: Int = 0
    var detail: String = ""
    var planHistories: DataHistoryPlan?
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        planHistories <- map["planHistories"]
        status <- map["status"]
        detail <- map["detail"]
    }
}
