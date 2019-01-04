//
//  UserEntity.swift
//  FoxLive
//
//  Created by HOANDHTB on 10/4/18.
//  Copyright © 2018 HOANDHTB. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper
class UserEntity: Object, Mappable {
 
    @objc dynamic var id: Int = 0
    @objc dynamic var login: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var token_key:String = ""
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var activated: Bool = true
    @objc dynamic var langKey: String = ""
    @objc dynamic var createdBy: String = ""
    @objc dynamic var createdDate: String = ""
    @objc dynamic var lastModifiedBy: String = ""
    @objc dynamic var lastModifiedDate: String  = ""
    @objc dynamic var role: String  = ""
    
    @objc dynamic var fullname: String = ""
     var message: String?
    var status: Int = 0
    @objc dynamic var authorities: String = ""
    var isSelect: Bool = false
    var department: ChildrenDepartment = ChildrenDepartment()
    var division: ChildrenDepartment = ChildrenDepartment()
    var agency: ChildrenDepartment = ChildrenDepartment()
    var roleEntity: RoleEntity?
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
   
    
    
    func mapping(map: Map) {
        id <- map["id"]
        login <- map["login"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        email <- map["email"]
        imageUrl <- map["imageUrl"]
        activated <- map["activated"]
        langKey <- map["langKey"]
        createdBy <- map["createdBy"]
        createdDate <- map["createdDate"]
        lastModifiedBy <- map["lastModifiedBy"]
        lastModifiedDate <- map["lastModifiedDate"]
        role <- map["authority"]
        roleEntity <- map["role"]
        status <- map["status"]
        message <- map["role"]
        department <- map["department"]
        division <- map["division"]
        agency <- map["agency"]
        fullname <- map["fullName"]
        if roleEntity != nil
        {
        authorities = roleEntity!.key
        }
    }
    
    override func copy() -> Any {
        let userNew = UserEntity()
        userNew.id = id
        userNew.login = login
        userNew.firstName = firstName
        userNew.lastName = lastName
        userNew.email = email
        userNew.imageUrl = imageUrl
        userNew.activated = activated
        userNew.langKey = langKey
        userNew.createdBy = createdBy
        userNew.createdDate = createdDate
        userNew.lastModifiedBy = lastModifiedBy
        userNew.role = role
        userNew.status = status
        userNew.message = message
        userNew.fullname = fullname
        userNew.token_key = token_key
        return userNew
    }
    
    
   public static func resetSelectListUser(list: [UserEntity])
    {
        for item in list
        {
            item.isSelect = false
        }
    }
    
   public static func setSelectListUser(listUsers: [UserEntity], listUserSelect: [UserEntity])
    {
        self.resetSelectListUser(list: listUsers)
        for item in listUserSelect
        {
            let user = listUsers.filter({$0.id == item.id}).first
            user?.isSelect = true
        }
    }
    
    public static func getListSelectUser(listUser: [UserEntity]) -> [UserEntity]
    {
        var listUserSelect:[UserEntity] = []
        for item in listUser.filter({$0.isSelect}) {
            listUserSelect.append(item.copy() as! UserEntity)
        }
        return listUserSelect
    }
    
}
extension UserEntity {
    
    class func saveUserWithTokenKey(from oldUser:UserEntity?, to newUser: UserEntity){
        if let oldUser = oldUser{
            do {
                 let realm = RealmConnectorManager.connectDefault()
                try realm!.write {
                    newUser.token_key = oldUser.token_key
                    realm?.add(newUser, update: true)
                }
            } catch let error as NSError {
                Log.debug(message: error.description)
            }
        }else{
            saveUser(newUser)
        }
    }
    
    class func saveUser(_ user: UserEntity) {
        let token_key:String? = UserEntity.getFirstUser()?.token_key
        do {
            let realm = RealmConnectorManager.connectDefault()
            try realm!.write {
                if token_key != nil{
                    user.token_key = token_key!
                    realm?.add(user, update: true)
                }
                else
                {
                    realm?.add(user, update: false)
                }
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
    
    class func deleteUser(_ userId: String) {
        do {
             let realm = RealmConnectorManager.connectDefault()
            guard let user = realm?.object(ofType: UserEntity.self, forPrimaryKey: userId) else { return }
            try realm!.write {
                realm?.delete(user)
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
    
    class func getUser(_ userId: String) -> UserEntity? {
        do {
            let realm = RealmConnectorManager.connectDefault()
            return realm?.object(ofType: UserEntity.self, forPrimaryKey: userId)
        } catch let error as NSError {
            Log.debug(message: error.description)
            return nil
        }
    }
    
    class func getFirstUser() -> UserEntity?{
        do{
             let realm = RealmConnectorManager.connectDefault()
            let user = realm?.objects(UserEntity.self).first
            if user != nil
            {
                return user!.copy() as! UserEntity
            }
            return nil
        }catch let error as NSError {
            Log.debug(message: error.description)
            return nil
        }
    }
    
    class func deleteAllUser() {
        do {
              let realm = RealmConnectorManager.connectDefault()
            let users = realm?.objects(UserEntity.self)
            try realm?.write {
                realm?.delete(users!)
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
}



