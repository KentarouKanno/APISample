//
//  KeychainManager.swift
//  APISample
//
//  Created by KentarOu on 2016/10/02.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation
import KeychainAccess

class KeychainManager {
    
    let keychain = Keychain(service: "APISample")
    
    enum KeychainAccessKey: String {
        case appkey = "appkey"
    }
    
    static let shared: KeychainManager = {
        let instance = KeychainManager()
        // init
        
        return instance
    }()
    
    var appkey: String? {
        get { return keychain[KeychainAccessKey.appkey.rawValue] }
        set { keychain[KeychainAccessKey.appkey.rawValue] = newValue }
    }
    
   
    // getter, setterの方が分かりやすいか？
    func setAppkey(id: String) {
        keychain[KeychainAccessKey.appkey.rawValue] = id
    }
    
    func getAppkey() -> String? {
        return keychain[KeychainAccessKey.appkey.rawValue]
    }
}
