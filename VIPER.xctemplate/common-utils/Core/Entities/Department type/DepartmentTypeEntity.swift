//
//  DepartmentTypeEntity.swift
//  BaoVietOffice
//
//  Created by HOANPV on 10/29/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class DepartmentTypeEntity: Mappable {
    var id: Int = 0
    var name: String = ""
    var numberOfChildren: Int = 0
    var isSelect: Bool = false
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        numberOfChildren <- map["numberOfChildren"]
    }
    
    func copy() -> Any
    {
        let departmentNew = DepartmentTypeEntity()
        departmentNew.id = id
        departmentNew.name = name
        departmentNew.numberOfChildren = numberOfChildren
        departmentNew.isSelect = isSelect
        return departmentNew
    }
}
