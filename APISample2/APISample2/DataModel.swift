//
//  DataModel.swift
//  APISample
//
//  Created by KentarOu on 2016/10/02.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation
import SwiftyJSON

// ----- Model ------

struct LibraryData {
    
    var category: String!
    var city    : String!
    var short   : String!
    var tel     : String!
    var pref    : String!
    var geocode : String!
    var systemid: String!
    var address : String!
    var libid   : String!
    var libkey  : String!
    var post    : String!
    var url_pc  : String!
    
    init(json: JSON) {
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
