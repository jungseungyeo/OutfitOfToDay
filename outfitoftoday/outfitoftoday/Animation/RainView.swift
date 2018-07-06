//
//  RainView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 4..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class RainView: BaseView {
    
    // 비 객체 생성
    private let rainView = ConCreateOOTImg().instance()
        .setUIImge(with: "snow.png")
        .ootImg
    
    override func setupView() {
        super.setupView()
        
        addSubViews(rainView)
        
        
        
    }
}
