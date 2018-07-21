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
        .setTextString(with: "서울 강남구")
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
        .setFontSize(with: 65)
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
    private(set) var weatherBackground: UIImageView = ConCreateOOTImg().instance()
        .ootImg
    
    // 태양
    private let astalBody: UIImageView = ConCreateOOTImg().instance()
        .setUIImge(with: "sun")
        .ootImg.then {
            $0.isHidden = true
    }
    
    // 추천 멘트
    private let ootComment: UILabel = ConCreateOOTLabel().instance()
        .setTextString(with: """
                                시원한 빗속을
                                천천히 걸어보아요
                                """)
        .setNuberOfLine(with: 2)
        .setTextAlignment(with: .left)
        .setTextColor(with: .setColor(0, 0, 0, 0.8))
        .setFontSize(with: 20)
        .ootLabel
    
    override func setupView() {
        super.setupView()
        
        addSubViews(
            // 위치, 시간, 온도, 온도기호
            locationTitle,
            nowTimeTitle,
            nowTemperature,
            temperatureSybol,
            
            // 태양, 배경
            astalBody,
            weatherBackground,
            
            // 코멘트
            ootComment
        )
        
        // 위치
        locationTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.centerX.equalTo(self).offset(0)
        }
        
        // 시간
        nowTimeTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(locationTitle.snp.bottom).offset(4)
            make.centerX.equalTo(self).offset(0)
        }
        
        // 온도
        nowTemperature.snp.makeConstraints { make -> Void in
            make.top.equalTo(nowTimeTitle.snp.bottom).offset(4)
            make.centerX.equalTo(self).offset(0)
        }
        
        // 온동 기호
        temperatureSybol.snp.makeConstraints { make -> Void in
            make.top.equalTo(nowTemperature.snp.top).offset(6)
            make.left.equalTo(nowTemperature.snp.right).offset(0)
        }
        
        // 날씨 배경
        weatherBackground.snp.makeConstraints { make -> Void in
            make.top.equalTo(nowTemperature.snp.bottom).offset(16)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(weatherBackground.snp.width).offset(70/63)
        }
        
        weatherBackground.layer.cornerRadius = 3
        weatherBackground.layer.shadowColor = UIColor.gray.cgColor
        weatherBackground.layer.shadowOpacity = 1
        weatherBackground.layer.shadowOffset = CGSize(width: 10, height: 10)
        weatherBackground.layer.shadowRadius = 10
        weatherBackground.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        weatherBackground.layer.shouldRasterize = true
        
        // 태양
        astalBody.snp.makeConstraints { make -> Void in
            make.top.equalTo(weatherBackground.snp.top).offset(-88)
            make.left.equalTo(weatherBackground.snp.left).offset(-4)
            make.width.equalTo(104)
            make.height.equalTo(astalBody.snp.width).offset(0)
        }
        
        // 코멘트
        ootComment.snp.makeConstraints { make -> Void in
            make.top.equalTo(weatherBackground.snp.bottom).offset(40)
            make.left.equalTo(weatherBackground.snp.left).offset(0)
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
    
    // 사이즈 변경 필요
    public func locationCloud(to cloudImg: UIImageView,size: Int, top: Int, left: Int, alpha: CGFloat) {
        weatherBackground.addSubview(cloudImg)
        cloudImg.alpha = alpha
        cloudImg.snp.makeConstraints { make -> Void in
            make.size.equalTo(size)
            
            make.top.equalTo(top)
            make.left.equalTo(left * -1)
        }
    }
    
    // 구름
    public func movecloud(to cloudImg: UIImageView, speed: Int) {
        UIView.animate(withDuration: TimeInterval(speed), animations: {
            self.moveLeft(view: cloudImg)
        }) { (finished) in
            if finished {
                cloudImg.removeFromSuperview()
            }
        }
    }
    
    private func moveLeft(view: UIView) {
        view.center.x -= 500
    }
}
