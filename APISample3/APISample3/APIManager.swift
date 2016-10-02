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
import RealmSwift


// ----- API ------

class APIManager {
    
    class func getLibraryData(latitude: Double, longtitude: Double, handler: @escaping (Array<LibraryData>?) -> ()) {
        
        
        if !ReachabilityManager.shared.checkHasNetworkConnection() {
            print("Not Connect")
            handler(DataBaseManager.shared.readLibraryData())
            return
        }
        
        let parameters:Parameters = [
            "appkey"  :KeychainManager.shared.appkey,
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
            
            // JSONをパース
            let json = JSON(object)
            json.forEach{ (_, json) in
                let library = LibraryData(json: json)
                libraries.append(library)
            }
            
            // DataBaseに保存
            DataBaseManager.shared.writeLibraryData(librarys: libraries)
            handler(libraries)
        }
    }
}
