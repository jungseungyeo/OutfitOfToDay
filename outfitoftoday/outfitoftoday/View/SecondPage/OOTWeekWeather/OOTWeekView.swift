//
//  OOTWeekView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 21..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class OOTWeekView: BaseView {
    
    internal let ootweekTitle: UILabel = ConCreateOOTLabel().instance()
        .setTextString(with: "주간날씨")
        .setFontSize(with: 16)
        .setFontType(with: OOT.mainCustomString.location)
        .setTextColor(with: .setColor(51, 51, 51))
        .setTextAlignment(with: .center)
        .ootLabel
    
    private let ootweekStackView = OOTWeekWeatherStackView()

    private let tmpHightLow = ConCreateOOTImg().instance()
        .setUIImge(with: "tmpHightLow")
        .ootImg

    override func setupView() {
         super.setupView()
        
        addSubViews(
                ootweekTitle,
                ootweekStackView,
                tmpHightLow
            )
        
        ootweekTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(21)
            make.centerX.equalTo(self)
        }
        
        ootweekStackView.snp.makeConstraints { make -> Void in
            make.top.equalTo(ootweekTitle.snp.bottom).offset(18)
            make.left.equalTo(self).offset(0)
            make.right.equalTo(self).offset(0)
            make.height.equalTo(172)
        }
        
        ootweekStackView.setStacks(makeWeekView())
        
        tmpHightLow.snp.makeConstraints { make -> Void in
            make.top.equalTo(ootweekTitle.snp.bottom).offset(79)

            make.height.equalTo(111)
            make.width.equalTo(305)
            
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
    
    private func makeWeekView() -> [OOTWeekWeatherView]{
        return [OOTWeekWeatherView(),OOTWeekWeatherView(),OOTWeekWeatherView(),OOTWeekWeatherView(),OOTWeekWeatherView(),OOTWeekWeatherView(),OOTWeekWeatherView()]
    }
}
