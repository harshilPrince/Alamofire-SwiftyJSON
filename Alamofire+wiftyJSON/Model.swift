//
//  Model.swift
//  Alamofire+wiftyJSON
//
//  Created by hp ios on 2/21/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
import SwiftyJSON

class Model
{
    var id = Int()
    var name = String()
    var username = String()
    var email = String()
    var address:UserAddress!
    var companyName:UserCompany!
    
    init(userJson:JSON) {
        
        id = userJson["id"].intValue
        self.name   =   userJson["name"].stringValue
        self.username   =   userJson["username"].stringValue
        self.email   =   userJson["email"].stringValue
        self.address = UserAddress(addressJSON: userJson["address"])
        self.companyName = UserCompany(companyJSON: userJson["company"])
    }
 }
class UserAddress
{
   var city = String()
   var zipcode = String()
    var location :LocatioGeo!
   
    init(addressJSON:JSON)
    {
        city = addressJSON["city"].stringValue
        zipcode = addressJSON["zipcode"].stringValue
        location = LocatioGeo(zipcodeJSON: addressJSON["geo"])
    }
    
}
class LocatioGeo
{
   var lat = String()
   var lon = String()
    init(zipcodeJSON:JSON)
    {
        lat = zipcodeJSON["lat"].stringValue
        lon = zipcodeJSON["lng"].stringValue
    }
    
    
}
class UserCompany
{
    var companyName = String()
    
    init(companyJSON:JSON) {
        
      companyName=companyJSON["name"].stringValue
    }
}
