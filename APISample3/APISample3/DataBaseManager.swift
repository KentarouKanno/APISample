//
//  DataBaseManager.swift
//  APISample3
//
//  Created by KentarOu on 2016/10/02.
//  Copyright © 2016年 Kentarou. All rights reserved.
//


import Foundation
import RealmSwift

class DataBaseManager {
    
    let realm = try! Realm()
    
    static let shared: DataBaseManager = {
        let instance = DataBaseManager()
        // 初期値設定
        
        return instance
    }()
    
    // LibraryDataを保存
    func writeLibraryData(librarys: Array<LibraryData>) {
        
        deleteLibraryData()
        
        for library in librarys {
            try! realm.write() {
                realm.add(library)
            }
        }
    }
    
    func deleteLibraryData() {
        let libraries = readLibraryData()
        for library in libraries {
            try! realm.write() {
                realm.delete(library)
            }
        }
    }
    
    // LibraryDataを取得
    func readLibraryData() -> Array<LibraryData> {
        
        let librarys = realm.objects(LibraryData.self)
        var items: Array<LibraryData> = []
        for item in librarys {
            items.append(item)
        }
        return items
    }
}
