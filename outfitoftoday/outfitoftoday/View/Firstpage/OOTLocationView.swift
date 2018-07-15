//
//  OOTLocationView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Then

class OOTLocationView: BaseView {
    
    // 현재 위치
    private let locationTitle: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(49, 56, 62))
        .setFontSize(with: 19)
        .setFontType(with: OOT.mainCustomString.location)
        .setTextAlignment(with: .center)
        .setTextSpacing(spacing: -0.3)
        .ootLabel
    
    // 현재 시간
    private var nowTimeTitle: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(69, 81, 90, 0.9))
        .setFontSize(with: 12)
        .setFontType(with: OOT.mainCustomString.nowTime)
        .setTextAlignment(with: .center)
        .ootLabel
    
    // 현재 온도
    private let nowTemperature: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(62, 62, 62))
        .setFontSize(with: 81)
        .setTextAlignment(with: .center)
        .ootLabel
    
    override func setupView() {
        super.setupView()
        
        addSubViews(
            locationTitle,
            nowTimeTitle,
            nowTemperature
        )
        
        locationTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(safeAreaLayoutGuide).offset(23)
            make.centerX.equalTo(self).offset(0)
        }
        
        nowTimeTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(locationTitle.snp.bottom).offset(0)
            make.centerX.equalTo(self).offset(0)
        }
        
        nowTemperature.snp.makeConstraints { make -> Void in
            make.top.equalTo(locationTitle.snp.bottom).offset(11)
            make.centerX.equalTo(self).offset(0)
        }
    }
    
    public func setLotionTitle(to title: String) {
        locationTitle.text = title
    }
    
    public func setTime(to timeText: String) {
        nowTimeTitle.text = timeText
    }
    
    public func setNowTemperature(to nowTemperatureText: String?) {
        nowTemperature.text = nowTemperatureText
    }

}
