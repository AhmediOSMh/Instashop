//
//  User.swift
//  InstaShop
//
//  Created by Ahmed Mh on 28/10/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//



import Foundation
import ObjectMapper


class User : NSObject, NSCoding, Mappable{
    
    var email : String?
    var fullName : String?
    var iD : String?
    var password : String?
    var phone : String?
    var profile : String?
    var token : AnyObject?
    var userName : String?
    var gender : String?
    var exist : Int?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return User()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        email <- map["Email"]
        fullName <- map["FullName"]
        iD <- map["ID"]
        password <- map["Password"]
        phone <- map["Phone"]
        profile <- map["Profile"]
        token <- map["Token"]
        userName <- map["UserName"]
        gender <- map["gender"]
        exist <- map["Exist"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        email = aDecoder.decodeObject(forKey: "Email") as? String
        fullName = aDecoder.decodeObject(forKey: "FullName") as? String
        iD = aDecoder.decodeObject(forKey: "ID") as? String
        password = aDecoder.decodeObject(forKey: "Password") as? String
        phone = aDecoder.decodeObject(forKey: "Phone") as? String
        profile = aDecoder.decodeObject(forKey: "Profile") as? String
        token = aDecoder.decodeObject(forKey: "Token") as? AnyObject
        userName = aDecoder.decodeObject(forKey: "UserName") as? String
        gender = aDecoder.decodeObject(forKey: "gender") as? String
        exist = aDecoder.decodeObject(forKey: "Exist") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if email != nil{
            aCoder.encode(email, forKey: "Email")
        }
        if fullName != nil{
            aCoder.encode(fullName, forKey: "FullName")
        }
        if iD != nil{
            aCoder.encode(iD, forKey: "ID")
        }
        if password != nil{
            aCoder.encode(password, forKey: "Password")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "Phone")
        }
        if profile != nil{
            aCoder.encode(profile, forKey: "Profile")
        }
        if token != nil{
            aCoder.encode(token, forKey: "Token")
        }
        if userName != nil{
            aCoder.encode(userName, forKey: "UserName")
        }
        if gender != nil{
            aCoder.encode(gender, forKey: "gender")
        }
        if exist != nil{
            aCoder.encode(exist, forKey: "Exist")
        }
        
    }
    
}
