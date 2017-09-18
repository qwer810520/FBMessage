//
//  ParentViewController.swift
//  fbmessenger
//
//  Created by 楷岷 張 on 2017/9/17.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import SDWebImage

class ParentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func stringToURL(str: String) -> URL {
        return URL(string: str)!
    }
    
}
