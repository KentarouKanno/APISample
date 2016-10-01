//
//  APIManager.swift
//  APISample
//
//  Created by KentarOu on 2016/10/02.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation
import SwiftyJSON

// ----- API ------

class APIManager {
    
    class func getLibraryData(latitude: Double, longtitude: Double, handler: @escaping (Array<LibraryData>?) -> ()) {
        
        let parameters:[String: Any] = [
            "appkey"  :"529ec160506d9c49a65c1e6619a5ffa0",
            "geocode" :"\(longtitude),\(latitude)",
            "limit"   :"50",
            "format"  :"json",
            "callback":""
        ]
        
        var urlString: String = "https://api.calil.jp/library?"
        
        for duct in parameters {
            urlString = urlString + "\(duct.key)=\(duct.value)&"
        }
        
        urlString = urlString.substring(to: urlString.index(before: urlString.endIndex))
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { data, response, error in
            
            // メインスレッドで実行される
            if let _ = response, let data = data {
                
                var libraries: Array<LibraryData> = []
                
                let json = JSON(data: data)
                json.forEach{ (_, json) in
                    libraries.append(LibraryData(json: json))
                }
                
                handler(libraries)
                
            } else {
                handler(nil)
            }
        }
        
        task.resume()
        
    }
}
