//
//  MainCollectionViewCell.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class MainCollectionViewCell: BaseCollectionViewCell {
    
    private let mainBG = ConCreateBuilderMainBackground().instance()
        .setUIBackgoundColor(with: OOT.Bg.page.color)
        .mainBackground
    
    private let locationTitle = ConCreateOOTLabel().instance()
        .setText(with: OOT.Main.location.description)
        .setTextColor(with: .setColor(112,112,112))
        .setNuberOfLine(with: 1)
        .setTextAlignment(with: .left)
        .ootLabel
    
    private let profileBG =  ConCreateBuilderMainBackground().instance()
        .setUIBackgoundColor(with: OOT.Bg.profile.color)
        .mainBackground

    private let mainWeather = ConCreateOOTLabel().instance()
        .setText(with: OOT.Main.weatherTitle.description)
        .setTextColor(with: .setColor( 0, 88, 255))
        .setTextAlignment(with: .left)
        .setFontSize(with: 96)
        .ootLabel
    
    private let outdoorTemperature = ConCreateOOTLabel().instance()
        .setText(with: OOT.Main.outdoorTemperature.description)
        .setTextColor(with: .setColor(83, 83, 83))
        .setTextAlignment(with: .left)
        .setFontSize(with: 16)
        .ootLabel
    
    private let moningTemperature = ConCreateOOTLabel().instance()
        .setText(with: OOT.Main.moningTemperature.description)
        .setTextColor(with: .setColor( 255, 0, 0))
        .setTextAlignment(with: .left)
        .setFontSize(with: 16)
        .ootLabel
    
    private let divisionMoningWithAfternoon = ConCreateOOTLabel().instance()
        .setText(with: "/")
        .setTextColor(with: .setColor( 112, 112, 112))
        .setTextAlignment(with: .left)
        .setFontSize(with: 20)
        .ootLabel
    
    private let afternoonTemperature = ConCreateOOTLabel().instance()
        .setText(with: OOT.Main.afternoonTemperature.description)
        .setTextColor(with: .setColor( 0, 88, 255))
        .setTextAlignment(with: .left)
        .setFontSize(with: 16)
        .ootLabel
    
    private let recommendationMSG = ConCreateOOTLabel().instance()
        .setText(with: OOT.Main.recommendationMSG.description)
        .setTextColor(with: .setColor( 29, 29, 29))
        .setTextAlignment(with: .left)
        .setFontSize(with: 16)
        .setNuberOfLine(with: 3)
        .ootLabel
    
    override func setupView() {
        super.setupView()
        
        addSubViews(mainBG, locationTitle, profileBG, mainWeather, outdoorTemperature, moningTemperature, divisionMoningWithAfternoon, afternoonTemperature, recommendationMSG)
        
        mainBG.snp.remakeConstraints{
            $0.height.equalTo(384)
            $0.width.equalTo(self)
            $0.top.equalTo(0)
        }
        
        locationTitle.snp.makeConstraints{
            $0.top.equalTo(0).offset(44)
            $0.centerX.equalTo(self)
        }
        
        profileBG.snp.makeConstraints{
            $0.height.equalTo(320)
            $0.width.equalTo(180)
            $0.top.equalTo(108)
            $0.right.equalTo(-24)
        }
        
        mainWeather.snp.makeConstraints{
            $0.height.equalTo(142)
            $0.top.equalTo(mainBG.snp.bottom).offset(16)
            $0.left.equalTo(20)
        }

        outdoorTemperature.snp.makeConstraints{
            $0.top.equalTo(profileBG.snp.bottom).offset(18)
            $0.right.equalTo(-33)
        }

        afternoonTemperature.snp.makeConstraints {
            $0.top.equalTo(outdoorTemperature.snp.bottom).offset(0)
            $0.right.equalTo(-93)
        }

        divisionMoningWithAfternoon.snp.makeConstraints {
            $0.top.equalTo(afternoonTemperature.snp.top).offset(0)
            $0.right.equalTo(afternoonTemperature.snp.left).offset(-4)
        }

        moningTemperature.snp.makeConstraints {
            $0.top.equalTo(afternoonTemperature.snp.top).offset(0)
            $0.right.equalTo(divisionMoningWithAfternoon.snp.left).offset(0)
        }

        recommendationMSG.snp.makeConstraints {
            $0.top.equalTo(moningTemperature.snp.bottom).offset(32)
            $0.centerX.equalTo(self)
        }
    }
}
