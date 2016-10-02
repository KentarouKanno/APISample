//
//  Reachability.swift
//  APISample3
//
//  Created by KentarOu on 2016/10/02.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation


class ReachabilityManager {
    
    let reachability: Reachability = Reachability.forInternetConnection()
    
    static let shared: ReachabilityManager = {
        let instance = ReachabilityManager()
        
        return instance
    }()
    
    func checkHasNetworkConnection() -> Bool {
        let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
        return networkStatus != 0
    }
}
