//
//  DustView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 28..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class DustView: BaseView {
    
    private let sampleView = ConCreateOOTImg().instance()
        .setUIBackgoundColor(with: .setColor(214, 214, 214))
        .ootImg
    
    private let sampleTitle = UILabel().then {
        $0.text = "미세먼지"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 11)
    }
    
    override func setupView() {
        super.setupView()
        
        backgroundColor = .gray
        
        addSubViews(sampleView, sampleTitle)
        
        sampleView.layer.cornerRadius = 21
        
        sampleView.snp.makeConstraints { make -> Void in
            make.top.equalTo(16)
            make.centerX.equalTo(self)
            
            make.size.equalTo(42)
        }
        
        sampleTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(sampleView.snp.bottom).offset(9)
            make.centerX.equalTo(self)
        }
    }
}
