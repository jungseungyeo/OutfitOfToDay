//
//  CloudAnimationView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class CloundAnimationView: BaseView {
    
    lazy private var cloundIMG = UIImageView().then {
        $0.image = UIImage(named: "cloud")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setup() {
        super.setup()
    }
    
}
