//
//  ViewController.swift
//  APISample4
//
//  Created by KentarOu on 2016/10/02.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit
import VTAcknowledgementsViewController
import Rswift

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.image = R.image.image1()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    @IBAction func pushLibraryInfoVC(_ sender: UIButton) {
        
        if let acknowledgementesVC = VTAcknowledgementsViewController.acknowledgementsViewController() {
            acknowledgementesVC.title = "謝辞"
            navigationController?.pushViewController(acknowledgementesVC, animated: true)
        }
    }
}
