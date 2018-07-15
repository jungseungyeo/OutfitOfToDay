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

class OOTFirstView: BaseView {
    
    // 현재 위치
    private let locationTitle: UILabel = ConCreateOOTLabel().instance()
        .setTextString(with: "sadfhlksdhfklshdkflh")
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
        .setFontType(with: OOT.mainCustomString.nowTemperature)
        .setTextAlignment(with: .center)
        .setFontSize(with: 81)
        .ootLabel
    
    // 온도 기호
    private let temperatureSybol: UILabel = ConCreateOOTLabel().instance()
        .setTextString(with: "°")
        .setTextColor(with: .setColor(62, 62, 62))
        .setTextAlignment(with: .center)
        .setFontType(with: OOT.mainCustomString.nowTemperature)
        .setFontSize(with: 81)
        .ootLabel
    
    // 날씨 배경
    private let weatherBackground: UIImageView = ConCreateOOTImg().instance()
        .ootImg
    
    // 태양
    private let astalBody: UIImageView = ConCreateOOTImg().instance()
        .setUIImge(with: "sun")
        .ootImg.then {
            $0.isHidden = true
    }
    
    override func setupView() {
        super.setupView()
        
        addSubViews(
            locationTitle,
            nowTimeTitle,
            nowTemperature,
            temperatureSybol,
            
            astalBody,
            weatherBackground
            
        )
        
        // 위치
        locationTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(safeAreaLayoutGuide).offset(23)
            make.centerX.equalTo(self).offset(0)
        }
        
        // 시간
        nowTimeTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(locationTitle.snp.bottom).offset(0)
            make.centerX.equalTo(self).offset(0)
        }
        
        // 온도
        nowTemperature.snp.makeConstraints { make -> Void in
            make.top.equalTo(locationTitle.snp.bottom).offset(11)
            make.centerX.equalTo(self).offset(0)
        }
        
        temperatureSybol.snp.makeConstraints { make -> Void in
            make.top.equalTo(nowTemperature.snp.top).offset(6)
            make.left.equalTo(nowTemperature.snp.right).offset(0)
        }
        
        // 날씨 배경
        weatherBackground.snp.makeConstraints { make -> Void in
            make.height.equalTo(360)
            make.width.equalTo(335)
            
            make.top.equalTo(nowTemperature.snp.bottom).offset(0)
            make.centerX.equalTo(self).offset(0)
        }
        
        // 태양
        astalBody.snp.makeConstraints { make -> Void in
            make.size.equalTo(80)
            
            make.top.equalTo(weatherBackground.snp.top).offset(-58)
            make.left.equalTo(weatherBackground.snp.left).offset(-14)
        }
    }

}

// 위치, 시간, 온도 세팅
extension OOTFirstView {
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

// 날씨 이미지
extension OOTFirstView {
    public func setWeatherBackGround(to weatherImg: UIImage?) {
        self.weatherBackground.image = weatherImg
    }
    
    public func isHiddenAstal(to flag: Bool) {
        self.astalBody.isHidden = flag
    }
}

// 구름
extension OOTFirstView {
    public func makeCloudImg() -> UIImageView {
        let cloud = UIImageView().then {
            $0.image = UIImage(named: "cloud")
            $0.contentMode = .scaleAspectFit
        }
        return cloud
    }
    
    public func locationCloud(to cloudImg: UIImageView,size: Int, top: Int, left: Int, alpha: CGFloat) {
        weatherBackground.addSubview(cloudImg)
        cloudImg.alpha = alpha
        cloudImg.snp.makeConstraints { make -> Void in
            make.size.equalTo(size)
            
            make.top.equalTo(top)
            make.left.equalTo(left * -1)
        }
    }
    
    public func movecloud(to cloudImg: UIImageView, speed: Int) {
        UIView.animate(withDuration: TimeInterval(300), animations: {
            self.moveLeft(view: cloudImg)
        }) { (finished) in
            if finished {
                cloudImg.removeFromSuperview()
            }
        }
    }
    
    private func moveLeft(view: UIView) {
        view.center.x -= 300
    }
}
