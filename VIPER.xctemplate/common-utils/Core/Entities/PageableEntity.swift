//
//  PageableEntity.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 11/18/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class PageableEntity: NSObject, Mappable {
    var pageSize: Int = 0
    var pageNumber: Int = 0
    var offset: Int = 0
    var paged: Bool = false
    var unpaged: Bool = false
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        pageSize <- map["pageSize"]
        pageNumber <- map["pageNumber"]
        offset <- map["offset"]
        paged <- map["paged"]
        unpaged <- map["unpaged"]
    }
    

}

class SortEntity: NSObject, Mappable
{
    var sorted: Bool = false
    var unsorted: Bool = false
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        sorted <- map["sorted"]
        unsorted <- map["unsorted"]
    }
}
