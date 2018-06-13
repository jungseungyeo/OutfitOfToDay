//
//  MainView.swift
//  WeatherStyle
//
//  Created by Jung seoung Yeo on 2018. 6. 13..
//  Copyright © 2018년 Clover. All rights reserved.
//

import SnapKit
import Then

class MainView: BaseView {

    let mainTitle = UILabel().then{
        $0.text = "WeatherStyle"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 30)
        $0.numberOfLines = 1
    }
    
    override func setupView() {
        super.setupView()
        
        addSubviews(mainTitle)
        
        mainTitle.snp.remakeConstraints{
            $0.center.equalTo(self)
        }
    }

}
