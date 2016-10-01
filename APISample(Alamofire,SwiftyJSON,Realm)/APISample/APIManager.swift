//
//  APIManager.swift
//  APISample
//
//  Created by KentarOu on 2016/10/02.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

// ----- API ------

class APIManager {
    
    class func getLibraryData(latitude: Double, longtitude: Double, handler: @escaping (Array<LibraryData>?) -> ()) {
        let parameters:Parameters = [
            "appkey"  :"529ec160506d9c49a65c1e6619a5ffa0",
            "geocode" :"\(longtitude),\(latitude)",
            "limit"   :"50",
            "format"  :"json",
            "callback":""
        ]
        
        Alamofire.request("https://api.calil.jp/library", parameters:parameters,encoding:URLEncoding.default).responseJSON { response in
            
            guard let object = response.result.value else {
                return handler(nil)
            }
            
            var libraries: Array<LibraryData> = []
            
            let json = JSON(object)
            json.forEach{ (_, json) in
                libraries.append(LibraryData(json: json))
            }
            
            handler(libraries)
        }
    }
}
