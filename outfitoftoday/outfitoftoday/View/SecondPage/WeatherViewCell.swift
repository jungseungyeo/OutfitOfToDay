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

class WeatherViewCell: BaseScrollView {
    
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
    
    private let hightTemperature: UILabel = ConCreateOOTLabel().instance()
        .setText(with: OOT.mainCustomString.hightTemperature)
        .setFontType(with: OOT.mainCustomString.hightTemperature)
        .setTextColor(with: .setColor(255, 177, 177))
        .setFontSize(with: 19)
        .setTextAlignment(with: .center)
        .ootLabel
    
    private let lowTemperatureText: UILabel = ConCreateOOTLabel().instance()
        .setText(with: OOT.mainCustomString.lowTemperatureText)
        .setFontType(with: OOT.mainCustomString.lowTemperatureText)
        .setTextColor(with: .setColor(69, 81, 90))
        .setFontSize(with: 15)
        .setTextAlignment(with: .center)
        .ootLabel
    
    private let lowTemperature: UILabel = ConCreateOOTLabel().instance()
        .setText(with: OOT.mainCustomString.lowTemperature)
        .setFontType(with: OOT.mainCustomString.lowTemperature)
        .setTextColor(with: .setColor(135, 161, 211))
        .setFontSize(with: 19)
        .setTextAlignment(with: .center)
        .ootLabel
    
    private let baseWeatherPage = BaseWeatherPage(OOT.mainCustomString.baseWeatherTitle)
    
    private let detailWeathterpage = BaseWeatherPage(OOT.mainCustomString.detailWeatherTitle)
    
    private let weekWeatherPage = BaseWeatherPage(OOT.mainCustomString.weekWeatherTitle)
    
    private let horizonScrollview = UIView()
    
    private let weatherGraph = WeatherGraph()
    
    private let test = BaseWeatherPage(OOT.mainCustomString.weekWeatherTitle)
    
    private let gototopButton = ConCreateOOTLabel().instance()
        .setText(with: OOT.mainCustomString.gotoTop)
        .setFontType(with: OOT.mainCustomString.gotoTop)
        .setTextColor(with: .black)
        .setFontSize(with: 50)
        .setTextAlignment(with: .center)
        .ootLabel
    
    override func setupView() {
        super.setupView()
        viewInsetDelete()
        
        self.backgroundColor = .setColor(236, 236, 236)
        
        showsVerticalScrollIndicator = false
        bounces = false
        
        addSubview(contentView)
        
        contentView.snp.makeConstraints { make -> Void in
            make.top.bottom.equalTo(self).offset(0)
            make.left.right.equalTo(self).offset(0)
        }
        
        contentView.addSubViews(locationTitle, nowTimeTitle, nowTemperature, hightTemperatureText, lowTemperatureText, hightTemperature, lowTemperature, weatherGraph, baseWeatherPage, detailWeathterpage, weekWeatherPage, horizonScrollview)
        
        locationTitle.snp.makeConstraints{ make -> Void in
            make.top.equalTo(contentView).offset(46)
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
            make.leftMargin.equalTo(46)
            make.top.equalTo(nowTimeTitle.snp.bottom).offset(35)
        }
        
        hightTemperature.snp.makeConstraints{ make -> Void in
            make.height.equalTo(28)
            make.width.equalTo(31)
            make.topMargin.equalTo(hightTemperatureText.snp.bottom).offset(2)
            make.centerX.equalTo(hightTemperatureText.snp.centerX).offset(0)
        }
        
        lowTemperature.snp.makeConstraints{ make -> Void in
            make.topMargin.equalTo(nowTimeTitle.snp.bottom).offset(59)
            make.leftMargin.equalTo(nowTemperature.snp.right).offset(41)
            
        }
        
        lowTemperatureText.snp.remakeConstraints { make -> Void in
            make.top.equalTo(nowTimeTitle.snp.bottom).offset(35)
            make.leftMargin.equalTo(nowTemperature.snp.right).offset(40)
        }
        
        horizonScrollview.snp.makeConstraints{ make -> Void in
            make.top.equalTo(nowTemperature.snp.bottom).offset(0)
            make.centerX.equalTo(self)
            
            make.height.equalTo(144)
            make.width.equalTo(338)
        }
        horizonScrollview.addSubview(weatherGraph)
        
        weatherGraph.snp.makeConstraints{ make -> Void in
            make.edges.equalTo(horizonScrollview)
        }
        
        baseWeatherPage.snp.makeConstraints{ make -> Void in
            make.top.equalTo(weatherGraph.snp.bottom).offset(47)
            make.centerX.equalTo(self)
        }
        
        baseWeatherPage.makeDustStackView(makeDustView(4))
        
        detailWeathterpage.snp.makeConstraints{ make -> Void in
            make.top.equalTo(baseWeatherPage.snp.bottom).offset(2)
            make.centerX.equalTo(self)
        }
        
        detailWeathterpage.makeDustStackView(makeDustView(4))
        
        weekWeatherPage.snp.makeConstraints{ make -> Void in
            make.top.equalTo(detailWeathterpage.snp.bottom).offset(21)
            make.centerX.equalTo(self)
        }
        
        weekWeatherPage.makeDustStackView(makeDustView(4))

        weatherGraph.scrollsToTop = true
    }
    
    func addUpBuuton(_ upButton: UIButton) {
        addSubViews(upButton)
        
        upButton.snp.makeConstraints{ make -> Void in
            make.top.equalTo(weekWeatherPage.snp.bottom).offset(90)
            make.bottom.equalTo(contentView).offset(-20)
            make.centerX.equalTo(self)
        }
        
    }
    
    private func viewInsetDelete() {
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
    
    private func makeDustView(_ count: Int) -> DustStackView {
        let dustStackView = DustStackView()
        var dustArray: [UIView] = []
        for _ in 1 ... count {
            dustArray.append(DustView())
        }
        
        dustStackView.setStacks(dustArray, dustArray.count)
        
        return dustStackView
    }
    

}
