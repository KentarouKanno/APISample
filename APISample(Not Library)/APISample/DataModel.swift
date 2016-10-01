//
//  DataModel.swift
//  APISample
//
//  Created by KentarOu on 2016/10/02.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation


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
    
    init(dict: NSDictionary) {
        category  = dict["category"] as! String
        city      = dict["city"] as! String
        short     = dict["short"] as! String
        tel       = dict["tel"] as! String
        pref      = dict["pref"] as! String
        geocode   = dict["geocode"] as! String
        systemid  = dict["systemid"] as! String
        address   = dict["address"] as! String
        libid     = dict["libid"] as! String
        libkey    = dict["libkey"] as! String
        post      = dict["post"] as! String
        url_pc    = dict["url_pc"] as! String
    }
}
