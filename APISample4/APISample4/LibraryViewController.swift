//
//  ViewController.swift
//  APISample
//
//  Created by KentarOu on 2016/10/02.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

// ----- ViewController ------

import UIKit
import SDWebImage
import SVProgressHUD

class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    // 東京タワーの座標
    var latitude  :Double = 35.658581
    var longtitude:Double = 139.745433
    
    @IBOutlet weak var tableView: UITableView!
    var libraryDataArray: Array<LibraryData> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        SVProgressHUD.show()
        
        // API Request
        APIManager.getLibraryData(latitude: latitude, longtitude: longtitude) { (librarys: Array<LibraryData>?) in
            
            if let librarys = librarys {
                self.libraryDataArray = librarys
                self.tableView.reloadData()
                SVProgressHUD.dismiss()
            }
            
            if let data = librarys?[0] { // 配列の0番目を出力
                
                print(data.category)   // MEDIUM
                print(data.city)       // 港区
                print(data.short)      // みなと図書館
                print(data.tel)        // 03-3437-6621
                print(data.pref)       // 東京都
                print(data.geocode)    // 139.7501576,35.6598873
                print(data.systemid)   // Tokyo_Minato
                print(data.address)    // 東京都港区芝公園3-2-25
                print(data.libid)      // 104074
                print(data.libkey)     // みなと図書
                print(data.post)       // 105-0011
                print(data.url_pc)     // http://www.lib.city.minato.tokyo.jp/j/minato.cgi
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraryDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.textLabel?.text = libraryDataArray[indexPath.row].short
        let url = URL(string: "http://www.kentar0u.sakura.ne.jp/swift.png")!
        cell.imageView?.sd_setImage(with: url, placeholderImage: R.image.load())
        return cell
    }
}



