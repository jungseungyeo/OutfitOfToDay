//
//  Test2.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 25..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class WeatherViewCell: BaseView {
    
    override func setupView() {
        super.setupView()
        self.backgroundColor = .red
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        isUserInteractionEnabled = true
    }
    
    @objc func tap() {
        print(789789)
    }
}
