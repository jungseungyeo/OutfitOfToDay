//
//  OOTDetailWeatherView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 20..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class OOTDetailWeatherView: BaseView {
    
    let ootDetailWeatherTitle: UILabel = ConCreateOOTLabel().instance()
        .setTextString(with: "상세날씨")
        .setFontSize(with: 16)
        .setTextColor(with: .setColor(51, 51, 51))
        .setTextAlignment(with: .center)
        .ootLabel
    
//    private let weatherGraph = WeatherGraph()
    
    override func setupView() {
        super.setupView()
        
        addSubViews(
            ootDetailWeatherTitle
//            weatherGraph
        )
        
        
        ootDetailWeatherTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(21)
            make.centerX.equalTo(self)
        }
        
//        weatherGraph.snp.makeConstraints { make -> Void in
//            make.top.equalTo(ootDetailWeatherTitle.snp.top).offset(20)
//            make.centerX.equalTo(self)
//            make.height.equalTo(134)
//        }
        
    }
}
