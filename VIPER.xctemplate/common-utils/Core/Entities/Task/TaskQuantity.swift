//
//  TaskQuantity.swift
//  BaoVietOffice
//
//  Created by HOANPV on 10/31/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper

class TaskQuantity: NSObject, Mappable {
    public var value: String = ""
    public var name: String = ""
    public var tasksQuantity: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        value <- map["value"]
        name <- map["name"]
        tasksQuantity <- map["tasksQuantity"]
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
