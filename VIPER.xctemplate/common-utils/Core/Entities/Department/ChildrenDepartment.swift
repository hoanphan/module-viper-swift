
//
//  ChildrenDepartment.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 10/23/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class ChildrenDepartment: NSObject, Mappable{
    public var id: Int = 0
    public var name: String = ""
    public var type: String = ""
    public var children: [ChildrenDepartment] = []
    public var executionTasks: String = ""
    public var expand: Bool = false
    public var selectable: Bool = false
    public var isShow:Bool = true
    public var isFistExpand: Bool = false
    public var isSelect: Bool = false
    public var parent: ChildrenDepartment?
    var action: (() -> ())?
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        type <- map["type"]
        children <- map["children"]
        executionTasks <- map["executionTasks"]
        selectable <- map["selectable"]
        children = children.sorted(by: {$0.id < $1.id})
        children.map({$0.parent = self})
    }
    
    override func copy() -> Any {
        let copy = ChildrenDepartment()
        copy.children = children
        copy.name = name
        copy.id = id
        copy.type = type
        copy.executionTasks = executionTasks
        copy.expand = expand
        copy.isSelect = isSelect
        copy.parent = parent
        return copy
    }
    
    public static func getListUserSelect(listUser:[UserEntity]) -> [UserEntity]
    {
        var listUserSelect:[UserEntity] = []
    //    self.listUserSelect.removeAll()
        for item in listUser
        {
            if item.isSelect
            {
                let user = item.copy() as? UserEntity
                listUserSelect.append(user!)
            }
        }
        return listUserSelect
    }
    
    public static func setShowAll(childrens: [ChildrenDepartment])
    {
        for item in childrens
        {
            item.isShow = true
            item.expand = false
            setShowAll(childrens: item.children)
        }
    }
    
    public static func setHideAll(childrens: [ChildrenDepartment])
    {
        for item in childrens
        {
            item.isShow = false
            setHideAll(childrens: item.children)
        }
    }
    
    public static func setParentShowAndExpand(item: ChildrenDepartment?)
    {
        if item != nil
        {
          
            let parent: ChildrenDepartment? = item!.parent
            parent?.expand = true
            parent?.isShow = true
            setParentShowAndExpand(item: item?.parent)
        }
    }
    
    public static func search(strSearch: String, childrens: [ChildrenDepartment], table: UITableView)
    {
        for item in childrens
        {
            if item.name.lowercased().contains( strSearch.lowercased())
            {
                item.isShow = true
                setParentShowAndExpand(item: item)
                DispatchQueue.main.async {
                    table.reloadData()
                }
            }
            DispatchQueue.main.async {
                  self.search(strSearch: strSearch, childrens: item.children, table: table)
            }
          
        }
    }
}
