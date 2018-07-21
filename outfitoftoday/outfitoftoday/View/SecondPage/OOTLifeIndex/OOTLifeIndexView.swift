//
//  OOTLifeIndexView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 20..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class OOTLifeIndexView: BaseView {
    
    lazy private var title: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(184, 184, 184))
        .setFontSize(with: 12)
        .setTextString(with: "")
        .setTextAlignment(with: .center)
        .ootLabel
    
    lazy private var dataLogo: UIImageView = ConCreateOOTImg().instance()
        .ootImg.then {
            $0.contentMode = .scaleAspectFit
    }
    
    lazy private var weahterStatus: UILabel = ConCreateOOTLabel().instance()
        .setTextColor(with: .setColor(184, 184, 184))
        .setFontSize(with: 14)
        .setTextString(with: "")
        .setTextAlignment(with: .center)
        .ootLabel
    
    public func setUpData(title: String, dataLogoName: String, weatherStatus: String) {
        self.title.text = title
        self.dataLogo.image = UIImage(named: dataLogoName)
        self.weahterStatus.text = weatherStatus
        
        switch self.weahterStatus.text {
        case "좋음":
            self.weahterStatus.textColor = .setColor(92, 176, 255)
        case "보통":
            self.weahterStatus.textColor = .setColor(112, 112, 112)
        case "나쁨", "높음":
            self.weahterStatus.textColor = .setColor(238, 88, 94, 0.9)
        default:
            break
        }
        
        initView()
    }
    
    private func initView() {
        addSubViews(
            title,
            dataLogo,
            weahterStatus
        )
        
        dataLogo.snp.makeConstraints { make -> Void in
            make.size.equalTo(48)
            make.top.equalTo(0)
            make.centerX.equalTo(self)
        }
        
        // title
        title.snp.makeConstraints { make -> Void in
            make.top.equalTo(dataLogo.snp.bottom).offset(13)
            make.centerX.equalTo(self)
        }
        
        // 태양 위치
        weahterStatus.snp.makeConstraints { make -> Void in
            make.top.equalTo(title.snp.bottom).offset(0)
            make.centerX.equalTo(self)
        }
    }
}
