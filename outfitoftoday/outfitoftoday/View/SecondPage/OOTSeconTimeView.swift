//
//  OOTSeconTimeView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 19..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import SnapKit
import UIKit
import Then

class OOTSecondTimeView: BaseScrollView {
    
    private let contentView = UIView()
    
    private let locationView: UILabel = ConCreateOOTLabel().instance()
        .setTextString(with: "서울 강남구")
        .setNuberOfLine(with: 1)
        .setTextAlignment(with: .left)
        .setFontSize(with: 16)
        .setFontType(with: OOT.mainCustomString.location)
        .setTextColor(with: .setColor( 49, 56, 62))
        .ootLabel
    
    private let nowTime: UILabel = ConCreateOOTLabel().instance()
        .setTextString(with: "오후 00시 00분")
        .setNuberOfLine(with: 1)
        .setTextAlignment(with: .left)
        .setFontType(with: OOT.mainCustomString.nowTime)
        .setFontSize(with: 12)
        .setTextColor(with: .setColor( 69, 81, 90, 0.9))
        .ootLabel
    
    private let nowTemperature: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(62, 62, 62))
        .setTextString(with: "28 ̊")
        .setFontType(with: OOT.mainCustomString.nowTemperature)
        .setTextAlignment(with: .left)
        .setFontSize(with: 72)
        .ootLabel
    
    
    private let maxTemperature: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(0, 0, 0))
        .setTextString(with: "28 ̊")
        .setTextAlignment(with: .left)
        .setFontSize(with: 14)
        .setFontType(with: OOT.mainCustomString.location)
        .setTextColor(with: .setColor(255, 92, 92))
        .ootLabel
    
    private let division: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(0, 0, 0))
        .setTextString(with: "/")
        .setTextAlignment(with: .left)
        .setFontSize(with: 14)
        .setFontType(with: OOT.mainCustomString.location)
        .setTextColor(with: .setColor(112, 112, 112))
        .ootLabel
    
    private let minTemperature: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(0, 0, 0))
        .setTextString(with: "20 ̊")
        .setTextAlignment(with: .left)
        .setFontSize(with: 14)
        .setFontType(with: OOT.mainCustomString.location)
        .setTextColor(with: .setColor(92, 176, 255))
        .ootLabel
    
    private let maxWithMinTemperature: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(0, 0, 0))
        .setTextString(with: "28 ̊ / 24 ̊")
        .setTextAlignment(with: .left)
        .setFontSize(with: 14)
        .ootLabel
    
    private let weatherStyle: UIImageView = ConCreateOOTImg().instance()
        .setUIImge(with: "sunnyMain")
        .ootImg
    
    private let detailStackView: DetailStackView = DetailStackView()
    
    private let divisionLine: UIImageView = ConCreateOOTImg().instance()
        .setUIBackgoundColor(with: .setColor(240,240,240))
        .ootImg
    
    private let detailViews: [DetailView] = []
    
    // 생활 지수
    private let ootlifeIndex: OOTLifeView = OOTLifeView()
    
    // 나누기 선
    private let varticalLine: UIImageView = ConCreateOOTImg().instance()
        .setUIBackgoundColor(with: .setColor( 239, 239, 239))
        .ootImg
    
    // 상세 페이지
    private let detailWeatherView: OOTDetailWeatherView = OOTDetailWeatherView()
    
    // 상세 날씨 그래프
    private let weatherGraph = WeatherGraph()
    
    private let vertiCalLine2: UIImageView = ConCreateOOTImg().instance()
        .setUIBackgoundColor(with: .setColor(239, 239, 239))
        .ootImg
    
    // 주간 날씨
    private let ootweekview = OOTWeekView()
    
//    private let tmpHightLow = ConCreateOOTImg().instance()
//        .setUIImge(with: "tmpHightLow")
//        .ootImg
    
    override func setupView() {
        super.setupView()
        
        self.bounces = false
        
        addSubViews(
            contentView,
            weatherGraph
        )
        
        contentView.snp.makeConstraints { make -> Void in
            make.top.bottom.equalTo(self).offset(0)
            make.left.right.equalTo(self).offset(0)
        }
        
        contentView.addSubViews(
            locationView,
            nowTime,
            nowTemperature,
            maxWithMinTemperature,
            weatherStyle,
            detailStackView,
            ootlifeIndex,
            divisionLine,
            varticalLine,
            detailWeatherView,
            ootweekview,
            vertiCalLine2,
            
            maxTemperature,
            division,
            minTemperature
            
//            ,tmpHightLow
        )
        
        
        
        // 현재 위치
        locationView.snp.makeConstraints { make -> Void in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(47)
            make.left.equalTo(self.snp.left).offset(40)
        }
        
        // 현재 시간
        nowTime.snp.makeConstraints { make -> Void in
            make.top.equalTo(locationView.snp.bottom).offset(4)
            make.left.equalTo(locationView.snp.left).offset(0)
        }
        
        // 현재 온도
        nowTemperature.snp.makeConstraints { make -> Void in
            make.top.equalTo(nowTime.snp.bottom).offset(6)
            make.left.equalTo(locationView.snp.left).offset(0)
        }
        
        // 최고 온도
//        maxWithMinTemperature.snp.makeConstraints { make -> Void in
//            make.top.equalTo(nowTime.snp.bottom).offset(102)
//            make.left.equalTo(52)
//        }
        
        maxTemperature.snp.makeConstraints { make -> Void in
            make.top.equalTo(nowTime.snp.bottom).offset(90)
            make.left.equalTo(52)
        }
        
        division.snp.makeConstraints { make -> Void in
            make.top.equalTo(nowTime.snp.bottom).offset(90)
            make.left.equalTo(maxTemperature.snp.right).offset(1)
        }
        
        minTemperature.snp.makeConstraints { make -> Void in
            make.top.equalTo(nowTime.snp.bottom).offset(90)
            make.left.equalTo(division.snp.right).offset(1)
        }
        
        // 날씨 아이콘
        weatherStyle.snp.makeConstraints { make -> Void in
            make.size.equalTo(132)
            make.top.equalTo(locationView.snp.top).offset(17)
            make.left.equalTo(nowTime.snp.right).offset(72)
        }
        
        // 상세 정보
        detailStackView.snp.makeConstraints { make -> Void in
            make.width.equalTo((UIScreen.main.bounds.width - 48)).dividedBy(1)
            make.height.equalTo(112)
            make.top.equalTo(weatherStyle.snp.bottom).offset(38)
            
            make.centerX.equalTo(self)
        }
        
        detailStackView.setStacks(makeStackView())
        
        // 생활 지수
        ootlifeIndex.snp.makeConstraints { make -> Void in
            make.width.equalTo(detailStackView.snp.width)
            make.height.equalTo(210)
            
            make.top.equalTo(detailStackView.snp.bottom).offset(23)
            make.left.equalTo(detailStackView.snp.left).offset(0)
        }
        
        // 나누기 선 (생활 지수, 상세 테이타)
        divisionLine.snp.makeConstraints { make -> Void in
            make.height.equalTo(0.5)
            make.width.equalTo(ootlifeIndex.snp.width).offset(0)
            
            make.top.equalTo(ootlifeIndex.snp.top).offset(0)
            make.left.equalTo(detailStackView.snp.left).offset(0)
        }
        
        varticalLine.snp.makeConstraints { make -> Void in
            make.height.equalTo(7)
            make.width.equalTo(self)
            
            make.top.equalTo(ootlifeIndex.snp.bottom).offset(0)
            make.left.equalTo(self)
        }
        
        // 상세 날씨
        detailWeatherView.snp.makeConstraints { make -> Void in
            make.width.equalTo(self)
            make.height.equalTo(700)
            
            make.top.equalTo(varticalLine.snp.top).offset(0)
            make.left.equalTo(self)
        }
        
        weatherGraph.snp.makeConstraints { make -> Void in
            make.top.equalTo(varticalLine.snp.bottom).offset(65)
            make.centerX.equalTo(self)
            make.height.equalTo(134)
        }

        vertiCalLine2.snp.makeConstraints { make -> Void in
            make.height.equalTo(0.5)
            make.width.equalTo(ootlifeIndex.snp.width).offset(0)
            
            make.top.equalTo(weatherGraph.tmpImg.snp.bottom).offset(30)
            make.left.equalTo(detailStackView.snp.left).offset(0)
        }
        
        // 주간 날씨
        ootweekview.snp.makeConstraints { make -> Void in
            make.top.equalTo(vertiCalLine2.snp.bottom).offset(0)
            make.centerX.equalTo(self)
            make.height.equalTo(250)
            
            make.bottom.equalTo(contentView).offset(-40)
        }
        
//        tmpHightLow.snp.makeConstraints { make -> Void in
//            make.top.equalTo(ootweekview.ootweekTitle.snp.bottom).offset(79)
//
//            make.height.equalTo(111)
//            make.left.equalTo(20)
//            make.right.equalTo(-42)
//        }
//
////        tmpHightLow.frame.size = CGSize(width: 200, height: 111)
        
    }
    
    private func makeStackView() -> [DetailView] {
        return [DetailView(), DetailView(), DetailView(), DetailView()]
    }
    
}

// 위치, 시간, 온도 세팅
extension OOTSecondTimeView {
    public func setLotionTitle(to title: String) {
        locationView.text = title
    }
    
    public func setNowTemperature(to nowTemperatureText: String?) {
        nowTemperature.text = nowTemperatureText
    }
    
    public func setMaxTemperature(to maxTemperatureText: String?) {
        maxWithMinTemperature.text = maxTemperatureText
    }
    
    public func setMinTemperature(to minTemperatureText: String?) {
        let temp = "\(maxWithMinTemperature.text!) / \(minTemperatureText!)"
        maxWithMinTemperature.text = temp
    }
}
