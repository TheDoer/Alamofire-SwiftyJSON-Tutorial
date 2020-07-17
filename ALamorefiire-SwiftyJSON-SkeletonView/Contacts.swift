//
//  Contacts.swift
//  ALamorefiire-SwiftyJSON-SkeletonView
//
//  Created by Adonis Rumbwere on 16/7/2020.
//  Copyright © 2020 Onyx Studio. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Contacts {
    
    private var _id:String!
    private var _name: String!
    private var _email: String!
    private var _address: String!
    private var _gender:String!
    private var _mobile:String!
    
    
    var id:String {
        if _id == nil {
            _id = ""
        }
        
        return _id
    }
    
    var name:String! {
        if _name == nil {
            _name = ""
        }
        
        return _name
    }
    
    var email:String {
        if _email == nil {
            _email = ""
        }
        
        return _email
    }
    var address:String {
        if _address == nil {
            _address = ""
        }
        
        return _address
    }
    
    var gender:String {
        if _gender == nil {
            _gender = ""
        }
        
        return _gender
    }
    
    var mobile:String{
        if _mobile == nil{
            _mobile = ""
        }
        
        return _mobile
    }
    
    init(contactDict: JSON) {
        self._id = contactDict["id"].stringValue
        self._name = contactDict["name"].stringValue
        self._address = contactDict["address"].stringValue
        self._email = contactDict["email"].stringValue
        self._mobile = contactDict["phone"]["mobile"].stringValue
        self._gender = contactDict["gender"].string
    }
    
   
}

