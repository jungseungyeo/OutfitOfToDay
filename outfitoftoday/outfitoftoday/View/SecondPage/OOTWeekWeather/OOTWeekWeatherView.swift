//
//  OOTWeekWeatherView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 21..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class OOTWeekWeatherView: BaseView {
    
    private let weekToDayName: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(184, 184, 184))
        .setFontSize(with: 12)
        .setTextString(with: "")
        .setTextAlignment(with: .center)
        .ootLabel
    
    private let weekToDayImg: UIImageView = ConCreateOOTImg().instance()
        .ootImg.then {
            $0.contentMode = .scaleAspectFit
    }
    
    private let grap: UIImageView = ConCreateOOTImg().instance()
        .setUIBackgoundColor(with: .clear)
        .ootImg
    
    public func setUpData(dayName: String, weatherStatusName: String) {
        self.weekToDayName.text = dayName
        self.weekToDayImg.image = UIImage(named: weatherStatusName)
        setupUI()
    }
    
    private func setupUI() {
        addSubViews(
            weekToDayName,
            weekToDayImg,
            grap
        )
        
        weekToDayName.snp.makeConstraints { make -> Void in
            make.top.equalTo(0)
            make.centerX.equalTo(self)
        }
        
        weekToDayImg.snp.makeConstraints { make -> Void in
            make.size.equalTo(24)
            make.top.equalTo(weekToDayName).offset(11)
            make.centerX.equalTo(self)
        }
        
        grap.snp.makeConstraints { make -> Void in
            make.width.equalTo(46)
            make.height.equalTo(122)
            
            make.top.equalTo(weekToDayImg.snp.bottom).offset(0)
            make.centerX.equalTo(self)
        }
        
    }
}
