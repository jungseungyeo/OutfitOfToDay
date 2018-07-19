//
//  TestView1.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 25..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import SnapKit
import UIKit
import Then
import CoreLocation

class OOTClothViews: BaseView {
    
    // 현재 위치
    private let locationTitle: UILabel = ConCreateOOTLabel().instance()
        .setText(with:OOT.mainCustomString.location)
        .setTextColor(with: .setColor(49, 56, 62))
        .setFontSize(with: 19)
        .setFontType(with: OOT.mainCustomString.location)
        .setTextAlignment(with: .center)
        .setTextSpacing(spacing: -0.3)
        .ootLabel

    // 현재 시간
    private let nowTimeTitle: UILabel = ConCreateOOTLabel().instance()
        .setText(with: OOT.mainCustomString.nowTime)
        .setTextColor(with: .setColor(69, 81, 90, 0.9))
        .setFontSize(with: 12)
        .setFontType(with: OOT.mainCustomString.nowTime)
        .setTextAlignment(with: .center)
        .ootLabel

    // 현재 온도
    private let nowTemperature: UILabel = ConCreateOOTLabel().instance()
        .setText(with: OOT.mainCustomString.nowTemperature)
        .setTextColor(with: .setColor(62, 62, 62))
        .setFontSize(with: 81)
        .setTextAlignment(with: .center)
        .ootLabel
    
    // 해
    private let astalBody: UIImageView = ConCreateOOTImg().instance()
        .setUIImge(with: "sun")
        .ootImg
    
//
//    private let lowTemperature: UILabel = ConCreateOOTLabel().instance()
//        .setText(with: OOT.mainCustomString.lowTemperature)
//        .setFontType(with: OOT.mainCustomString.lowTemperature)
//        .setTextColor(with: .setColor(135, 161, 211))
//        .setFontSize(with: 19)
//        .setTextAlignment(with: .left)
//        .ootLabel
//
//    private let halfTemperature: UILabel = ConCreateOOTLabel().instance()
//        .setText(with: OOT.mainCustomString.halfTemperature)
//        .setFontType(with: OOT.mainCustomString.halfTemperature)
//        .setTextColor(with: .setColor(89, 89, 119))
//        .setFontSize(with: 19)
//        .setTextAlignment(with: .left)
//        .ootLabel
//
//    private let hightTemperature: UILabel = ConCreateOOTLabel().instance()
//        .setText(with: OOT.mainCustomString.hightTemperature)
//        .setFontType(with: OOT.mainCustomString.hightTemperature)
//        .setTextColor(with: .setColor(255, 177, 177))
//        .setFontSize(with: 19)
//        .setTextAlignment(with: .left)
//        .ootLabel
//
//    private let textField: UIImageView = ConCreateOOTImg().instance()
//        .setUIBackgoundColor(with: .white)
//        .ootImg
//
//    private let ottRecommend: UILabel = ConCreateOOTLabel().instance()
//        .setText(with: OOT.mainCustomString.Recommend)
//        .setFontType(with: OOT.mainCustomString.Recommend)
//        .setTextColor(with: .setColor(0, 0, 0, 0.8))
//        .setFontSize(with: 21)
//        .setTextAlignment(with: .left)
//        .setNuberOfLine(with: 4)
//        .ootLabel
//
//    private let weatherView = WeatherAnimationViewController().view
//
//    private let backImg = BackgoundView()
    
    override func setupView() {
        super.setupView()
        
        addSubViews(
            locationTitle,
            nowTimeTitle,
            nowTemperature,
            astalBody
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
        
//        sunShine.snp.makeConstraints { make -> Void in
//            make.top
//            
//        }
        
        
        
        

//        addSubViews(backImg,
//                    //weatherView!,
//                    locationTitle, nowTimeTitle, nowTemperature, halfTemperature, lowTemperature, hightTemperature, textField, ottRecommend)
//
//        backImg.snp.makeConstraints{ make -> Void in
//            make.top.bottom.left.right.equalTo(self)
//        }
//
//        locationTitle.snp.makeConstraints{ make -> Void in
//            make.top.equalTo(44)
//            make.centerX.equalTo(self).offset(0)
//        }
//
//        nowTimeTitle.snp.makeConstraints{ make -> Void in
//            make.top.equalTo(locationTitle.snp.bottom).offset(4)
//            make.centerX.equalTo(self).offset(0)
//        }
//
//        nowTemperature.snp.makeConstraints{ make -> Void in
//            make.top.equalTo(nowTimeTitle.snp.bottom).offset(12)
//            make.height.equalTo(95)
//            make.centerX.equalTo(self).offset(0)
//        }
//
//        halfTemperature.snp.makeConstraints{ make -> Void in
//            make.top.equalTo(nowTemperature.snp.bottom).offset(20)
//            make.centerX.equalTo(self)
//        }
//
//        lowTemperature.snp.makeConstraints{ make -> Void in
//            make.centerY.equalTo(halfTemperature.snp.centerY).offset(0)
//            make.left.equalTo(halfTemperature.snp.left).offset(14.6)
//        }
//
//        hightTemperature.snp.makeConstraints{ make -> Void in
//            make.centerY.equalTo(halfTemperature.snp.centerY).offset(0)
//            make.right.equalTo(halfTemperature.snp.left).offset(-7.9)
//        }
//
//        textField.snp.makeConstraints{ make -> Void in
//            make.top.equalTo(ratio() * 2)
//            make.bottom.equalTo(self.snp.bottom).offset(0)
//
//            make.right.left.equalTo(0)
//        }
//
//        ottRecommend.snp.makeConstraints{ make -> Void in
//            make.top.equalTo(textField.snp.top).offset(19)
//            make.left.equalTo(21)
//        }
//
        requestGetTemperature()
//        getLocation()
//    }
    }
    
    private func ratio() -> CGFloat {
        return UIScreen.main.bounds.height / 3.13
    }
    
    func addDownButton(_ downButton: UIButton) {
        addSubViews(downButton)
        downButton.snp.makeConstraints{ make -> Void in
            make.size.equalTo(24)
            make.bottom.equalTo(-20)
            make.centerX.equalTo(self)
        }
    }
    
    func addSideButton(_ sideButton: UIButton) {
        addSubViews(sideButton)
        
        sideButton.snp.makeConstraints{ make -> Void in
            make.top.equalTo(350)
            make.right.equalTo(self.snp.right).offset(-41)
            make.size.equalTo(200)
        }
    }

    
    private func upAnmation(_ downButton: UIView) {
        UIView.animate(withDuration: 0.5, delay: 1, options: [], animations: {
            downButton.center.y += 10
            }, completion: nil)
    }
    
    private func downAnimation(_ downButton: UIView) {
        
    }
    
    // 온도 정보 받아오기
    private func requestGetTemperature() {
        NetWork.shared.request(for: .temperature) { (result) in
            if let responseObject = result as? OOTTemperatureData {
                DispatchQueue.main.async {
                    self.nowTemperature.text = responseObject.current
                }
            }
        }
    }
    
    // 위치 정보 받아오기
    private func getLocation() {
        LocationManager.shared.setup()
    }
}


