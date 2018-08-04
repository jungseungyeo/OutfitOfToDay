//
//  LocationView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 28..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class LocationView: BaseView {
    
    lazy var nowTemperature: UILabel = UILabel().then {
        $0.text = "28 ̊"
        $0.font = .systemFont(ofSize: 72, weight: .regular)
    }
    
    override func setup() {
        super.setup()
    }
    
}
