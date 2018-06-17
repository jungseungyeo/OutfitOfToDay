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
    
    private let mainBG = UIImageView().then {
        $0.backgroundColor = OOT.Bg.page.rawValue
    }
    
    private let locationTitle = UILabel().then{
        $0.text = OOT.Main.location.description
        $0.font = .systemFont(ofSize: 20)
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
    }
    
    private let profileBG = UIImageView().then {
        $0.backgroundColor = OOT.Bg.profile.rawValue
    }
    
    private let mainWeather = UILabel().then{
        $0.text = OOT.Main.weatherTitle.description
        $0.font = .systemFont(ofSize: 96)
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 0/255, green: 88/255, blue: 255/255, alpha: 1.0)
    }
    
    private let outdoorTemperature = UILabel().then {
        $0.text = OOT.Main.outdoorTemperature.description
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
    }
    
    private let moningTemperature = UILabel().then{
        $0.text = OOT.Main.moningTemperature.description
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
    }
    
    private let divisionMoningWithAfternoon = UILabel().then {
        $0.text = "/"
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
    }
    
    private let afternoonTemperature = UILabel().then {
        $0.text = OOT.Main.afternoonTemperature.description
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 0/255, green: 88/255, blue: 255/255, alpha: 1.0)
    }
    
    private let recommendationMSG = UILabel().then {
        $0.text = OOT.Main.recommendationMSG.description
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 3
        $0.textColor = UIColor(red: 29/255, green: 29/255, blue: 29/255, alpha: 1.0)
    }
    
    override func setupView() {
        super.setupView()
        
        addSubViews(mainBG, locationTitle, profileBG, mainWeather, outdoorTemperature, moningTemperature, divisionMoningWithAfternoon, afternoonTemperature, recommendationMSG)
        
        mainBG.snp.remakeConstraints{
            $0.height.equalTo(384)
            $0.width.equalTo(self)
            $0.top.left.right.equalTo(self)
        }
        
        locationTitle.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide).offset(44)
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
