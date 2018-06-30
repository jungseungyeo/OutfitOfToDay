//
//  WeekDustView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 29..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit

class WeekDustView: BaseView {
    
    private let todayTitle = UILabel().then {
        $0.text = "오늘"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10)
    }
    
    private let sampleView = ConCreateOOTImg().instance()
        .setUIBackgoundColor(with: .setColor(214, 214, 214))
        .ootImg
    
    private let sampleTitle = UILabel().then {
        $0.text = "00 / 00"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10)
    }
    
    override func setupView() {
        super.setupView()
        
        backgroundColor = .gray
        
        addSubViews(todayTitle, sampleView, sampleTitle)
        
        sampleView.layer.cornerRadius = 12
        
        todayTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(11)
            make.centerX.equalTo(self)
        }
        
        sampleView.snp.makeConstraints { make -> Void in
            make.top.equalTo(todayTitle.snp.bottom).offset(9)
            make.centerX.equalTo(self)
            
            make.size.equalTo(24)
        }
        
        sampleTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(sampleView.snp.bottom).offset(9)
            make.centerX.equalTo(self)
        }
    }
}
