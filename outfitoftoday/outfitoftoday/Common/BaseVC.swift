//
//  BaseVC.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 27..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    internal func initAPI() {
        
    }
    
    // 2
    internal func setup() {
    }
    
    // 3
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // 4
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
