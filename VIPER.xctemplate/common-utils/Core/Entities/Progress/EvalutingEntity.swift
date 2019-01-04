
//
//  EvalutingEntity.swift
//  BaoVietOffice
//
//  Created by MinhNT-Mac on 11/8/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import Foundation
import ObjectMapper
class EvalutingEntity: NSObject, Mappable {
    var codeStatus: Int = 0
    var message: String = ""
    var status:String = ""
    var completedStatus:StatusEntity?
    var evaluated:ProgressEnumeration?
    var rate: String = ""
    var comment:String = ""
    var taskId:Int = 0
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        completedStatus <- map["completedStatus"]
        evaluated <- map["evaluated"]
        rate <- map["rate"]
        comment <- map["comment"]
        taskId <- map["taskId"]
        codeStatus <- map["status"]
        message <- map["message"]
    }
    
}
