//
//  BaseView.swift
//  WeatherStyle
//
//  Created by Jung seoung Yeo on 2018. 6. 13..
//  Copyright © 2018년 Clover. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    func setupView() {
        backgroundColor = .white
    }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
