//
//  DetailView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 19..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class DetailView: BaseView {
    
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
        initView()
    }
    
    private func initView() {
        addSubViews(
            title,
            dataLogo,
            weahterStatus
        )
        
        // 태양, 눈, 흐림
        dataLogo.snp.makeConstraints { make -> Void in
            // 변경 예정
            make.size.equalTo(40)
            
            make.top.equalTo(7)
            make.centerX.equalTo(self).offset(0)
        }
        
        // title
        title.snp.makeConstraints { make -> Void in
            make.top.equalTo(dataLogo.snp.bottom).offset(8)
            make.centerX.equalTo(self)
        }
        
        // 태양 위치
        weahterStatus.snp.makeConstraints { make -> Void in
            make.top.equalTo(title.snp.bottom).offset(0)
            make.centerX.equalTo(self).offset(0)
        }
    }
}
