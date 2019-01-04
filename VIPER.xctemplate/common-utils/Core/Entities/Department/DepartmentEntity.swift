//
//  DepartmentEntity.swift
//  BaoVietOffice
//
//  Created by HOANDHTB on 10/23/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit
import ObjectMapper
class DepartmentEntity: NSObject, Mappable{
    public var id: Int?
    public var name: String? = ""
    public var type: String = ""
    public var children: [ChildrenDepartment]  = []
    public var height: Float = 0
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        children <- map["children"]
        type <- map["type"]
        children = children.sorted(by: {$0.id < $1.id})
    }
    
    override func copy() -> Any {
        let copy = DepartmentEntity()
        copy.children = children
        copy.name = name
        copy.id = id
        copy.type = type
        return copy
    }
    
    public static func resetAll(arrChildrenDepartment: [ChildrenDepartment])
    {
        for item in arrChildrenDepartment
        {
            item.isSelect = false
            item.expand = false
            resetAll(arrChildrenDepartment: item.children)
        }
    }
    
    public static func resetSelectAll(arrChildrenDepartment: [ChildrenDepartment])
    {
        for item in arrChildrenDepartment
        {
            item.isSelect = false
            resetAll(arrChildrenDepartment: item.children)
        }
    }
    
    
   public static func setRadioSelect(arrSelect: [ChildrenDepartment], arrDepartment:[ChildrenDepartment])
    {
        self.resetAll(arrChildrenDepartment: arrDepartment)
        for item in arrSelect
        {
            self.setMultilSelect(childrenDepartmentSelect: item, arrDepartment: arrDepartment)
        }
        
    }
    
    private static func setMultilSelect(childrenDepartmentSelect: ChildrenDepartment, arrDepartment:[ChildrenDepartment]) {
        for item in arrDepartment
        {
            if item.id == childrenDepartmentSelect.id
            {
                item.isSelect = true
                item.selectable = true
                setExpandChildDepartment(item: item)
                break
            }
            self.setMultilSelect(childrenDepartmentSelect: childrenDepartmentSelect, arrDepartment: item.children)
        }
        
    }
    
    private static func setExpandChildDepartment(item: ChildrenDepartment)
    {
        var childrend: ChildrenDepartment? = item
        
        while childrend?.parent != nil {
            childrend?.parent?.expand = true
            childrend = childrend?.parent
        }
    }
    
    public static func setMultilSelectCheckbox(arrSelect: [ChildrenDepartment], arrDepartment:[ChildrenDepartment])
    {
        self.resetAll(arrChildrenDepartment: arrDepartment)
        for item in arrSelect
        {
            self.setMultilSelect(childrenDepartmentSelect: item, arrDepartment: arrDepartment)
        }
    }
    
    func getHeight(children: [ChildrenDepartment])
    {
        for item in children
        {
            if item.expand && item.isShow
            {
                self.height += 40
                getHeight(children: item.children)
            }
            else
            {
                if item.isShow
                {
                    self.height += 40
                }
            }
        }
    }
    
    //Lấy ra danh sách phòng ban được chọn
    public static func getListChildDepartmentSelect(listDepartment: [ChildrenDepartment], listChildDepartment: inout [ChildrenDepartment])
    {
     
        for item in listDepartment
        {
            if item.isSelect
            {
                let childDepartment = item.copy() as! ChildrenDepartment
                listChildDepartment.append(childDepartment)
            }
            getListChildDepartmentSelect(listDepartment: item.children, listChildDepartment: &listChildDepartment)
        }
    }
    
}
