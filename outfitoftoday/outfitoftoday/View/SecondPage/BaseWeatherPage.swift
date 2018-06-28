//
//  BaseWeatherPage.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 26..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit

class BaseWeatherPage: BaseView {
   
//    private let findDustView: UIImage = 
    
    convenience init(_ title: OOT.mainCustomString) {
        self.init()
        setupTitle(title)
    }
   
    override func setupView() {
        super.setupView()
        
        layer.cornerRadius = 3
        
        self.snp.makeConstraints{ make -> Void in
            make.height.equalTo(144)
            make.width.equalTo(338)
        }
        
    }
    
    private func setupTitle(_ title: OOT.mainCustomString) {
        
        let weatherTitle = ConCreateOOTLabel().instance()
            .setText(with: title)
            .setTextColor(with: .setColor(69, 81, 90))
            .setFontSize(with: 15)
            .setFontType(with: title)
            .setTextAlignment(with: .center)
            .setTextSpacing(spacing: -0.2)
            .ootLabel
        
        addSubViews(weatherTitle)
        
        weatherTitle.snp.makeConstraints{ make -> Void in
            make.top.equalTo(16)
            make.centerX.equalTo(self)
        }
        
    }
}
