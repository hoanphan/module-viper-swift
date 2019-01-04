//
//  ProgressHistory.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 11/20/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation
import ObjectMapper
class ProgressHistories: NSObject, Mappable {
    var number: Int = 0
    var content:[ProgressContentEntity] = []
    var pageable: String = ""
    var numberOfElements: Int = 0
    var totalPages: Int = 0
    var size: Int = 0
    var totalElements: Int = 0
    
    var isChange: Bool = false
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        number <- map["number"]
        content <- map["content"]
        pageable <- map["pageable"]
        numberOfElements <- map["numberOfElements"]
        totalPages <- map["totalPages"]
        size <- map["size"]
        totalElements <- map["totalElements"]
        
    }
    
}
class ProgressContentEntity: NSObject, Mappable {
    var status: String = ""
    var toDate: String = ""
    var note:String = ""
    var id: Int = 0
    var fromDate: String = ""
    var createdAt: String = ""
    var progress: Int = 0
    var name: String = ""
    var updatedByUser: UserEntity?

    var isChange: Bool = false
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        toDate <- map["toDate"]
        note <- map["note"]
        id <- map["id"]
        fromDate <- map["fromDate"]
        createdAt <- map["createdAt"]
        progress <- map["progress"]
        name <- map["name"]
        updatedByUser <- map["updatedByUser"]
    }
}
class ResponseProgressHistory:NSObject, Mappable {
    var progressHistories: ProgressHistories?
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        progressHistories <- map["progressHistories"]
        
    }
}
