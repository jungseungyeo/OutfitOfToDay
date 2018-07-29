//
//  LocationView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 28..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class LocationTimeView: BaseView {
    
    public var temperatures: TemperaturesModel? {
        didSet {
            guard let temperatureCurrent = temperatures?.current else {
                return
            }
            nowTemperature.text = "\(temperatureCurrent) ̊"
        }
    }
    
    public var locationText: String? {
        didSet {
            location.text = locationText
        }
    }
    
    public var nowTimeText: String? {
        didSet {
            nowTime.text = nowTimeText
        }
    }
    
    lazy private var nowTemperature: UILabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 72, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    lazy private var location: UILabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    lazy private var nowTime: UILabel = UILabel().then {
        $0.text = ""
        $0.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    lazy private var sumAndMoon: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "sun")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setup() {
        super.setup()
        initUI()

    }
    
    private func initUI() {
        addSubViews(
            nowTemperature
            ,location
            ,nowTime
            ,sumAndMoon
        )
        
        nowTemperature.snp.makeConstraints { make -> Void in
            make.center.equalToSuperview()
        }
        
        location.snp.makeConstraints { make -> Void in
            make.top.equalTo(nowTemperature.snp.top).offset(39)
            make.right.equalToSuperview().offset(-2)
        }
        
        nowTime.snp.makeConstraints { make -> Void in
            make.top.equalTo(location.snp.bottom).offset(3)
            make.left.equalTo(location).offset(0)
        }
        
        sumAndMoon.snp.makeConstraints { make -> Void in
            make.size.equalTo(70)
            make.top.equalTo(20)
            make.left.equalToSuperview()
        }
        
    }
}

