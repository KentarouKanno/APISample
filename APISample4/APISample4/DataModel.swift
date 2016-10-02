//
//  DataModel.swift
//  APISample
//
//  Created by KentarOu on 2016/10/02.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

// ----- DataBase Model ------

class LibraryData: Object {
    
    dynamic var category: String!
    dynamic var city    : String!
    dynamic var short   : String!
    dynamic var tel     : String!
    dynamic var pref    : String!
    dynamic var geocode : String!
    dynamic var systemid: String!
    dynamic var address : String!
    dynamic var libid   : String!
    dynamic var libkey  : String!
    dynamic var post    : String!
    dynamic var url_pc  : String!
    
    convenience init(json: JSON) {
        self.init()
        category  = json["category"].string
        city      = json["city"].string
        short     = json["short"].string
        tel       = json["tel"].string
        pref      = json["pref"].string
        geocode   = json["geocode"].string
        systemid  = json["systemid"].string
        address   = json["address"].string
        libid     = json["libid"].string
        libkey    = json["libkey"].string
        post      = json["post"].string
        url_pc    = json["url_pc"].string
    }
}
