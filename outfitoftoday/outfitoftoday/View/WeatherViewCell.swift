//
//  Test2.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 25..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class WeatherViewCell: BaseView {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let locationTitle: UILabel = ConCreateOOTLabel().instance()
        .setText(with:OOT.mainCustomString.location)
        .setTextColor(with: .setColor(49, 56, 62))
        .setFontSize(with: 19)
        .setFontType(with: OOT.mainCustomString.location)
        .setTextAlignment(with: .center)
        .setTextSpacing(spacing: -0.3)
        .ootLabel
    
    private let nowTimeTitle: UILabel = ConCreateOOTLabel().instance()
        .setText(with: OOT.mainCustomString.nowTime)
        .setTextColor(with: .setColor(69, 81, 90, 0.9))
        .setFontSize(with: 12)
        .setFontType(with: OOT.mainCustomString.nowTime)
        .setTextAlignment(with: .center)
        .ootLabel
    
    private let nowTemperature: UILabel = ConCreateOOTLabel().instance()
        .setText(with: OOT.mainCustomString.nowTemperature)
        .setTextColor(with: .setColor(255, 255, 255))
        .setFontSize(with: 81)
        .setTextAlignment(with: .left)
        .ootLabel
    
    private let hightTemperatureText: UILabel = ConCreateOOTLabel().instance()
        .setText(with: OOT.mainCustomString.hightTemperatureText)
        .setFontType(with: OOT.mainCustomString.hightTemperatureText)
        .setTextColor(with: .setColor(69, 81, 90))
        .setFontSize(with: 15)
        .setTextAlignment(with: .center)
        .ootLabel
    
    private let lowTemperatureText: UILabel = ConCreateOOTLabel().instance()
        .setText(with: OOT.mainCustomString.lowTemperatureText)
        .setFontType(with: OOT.mainCustomString.hightTemperatureText)
        .setTextColor(with: .setColor(69, 81, 90))
        .setFontSize(with: 15)
        .setTextAlignment(with: .center)
        .ootLabel
    
    override func setupView() {
        super.setupView()
        self.backgroundColor = .setColor(236, 236, 236)
        addSubview(scrollView)
       
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(self)
        }
        
        scrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints { make -> Void in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(self)
        }
        
        contentView.addSubViews(locationTitle, nowTimeTitle, nowTemperature, hightTemperatureText, lowTemperatureText)
        
        locationTitle.snp.makeConstraints{ make -> Void in
            make.top.equalTo(44)
            make.centerX.equalTo(self).offset(0)
        }
        
        nowTimeTitle.snp.makeConstraints{ make -> Void in
            make.top.equalTo(locationTitle.snp.bottom).offset(4)
            make.centerX.equalTo(self).offset(0)
        }
        
        nowTemperature.snp.makeConstraints{ make -> Void in
            make.top.equalTo(nowTimeTitle.snp.bottom).offset(12)
            make.height.equalTo(95)
            make.centerX.equalTo(self).offset(0)
        }
        
        hightTemperatureText.snp.makeConstraints { make -> Void in
            make.left.equalTo(46)
            make.top.equalTo(nowTimeTitle.snp.bottom).offset(35)
        }
        
        lowTemperatureText.snp.makeConstraints { make -> Void in
            make.right.equalTo(-44)
            make.top.equalTo(nowTimeTitle.snp.bottom).offset(35)
        }
        
        
        
        
//        label2.snp_makeConstraints { (make) in
//            make.left.right.equalTo(contentView).inset(20) // left/right padding 20pt
//            make.top.equalTo(label1.snp_bottom).offset(20) // below label1 with margin 20pt
//            make.bottom.equalTo(contentView).offset(-20) // attached to the bottom of the contentview with padding 20pt
//        }
    }

}
