//
//  OOTDetailWeatherGraphView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 20..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class OOTDetailWeatherScrollview: BaseScrollView {
 
    private let contentView = UIView()
    
    private let tmpImg: UIImageView = ConCreateOOTImg().instance()
        .setUIImge(with: "tmpScrollview")
        .ootImg
    
    
    override func setupView() {
        super.setupView()
        
        addSubViews(
            contentView
        )
        
        contentView.snp.makeConstraints { make -> Void in
            make.top.bottom.equalTo(self).offset(0)
            make.left.right.equalTo(self).offset(0)
        }
        
        contentView.addSubViews(tmpImg)
        
        tmpImg.snp.makeConstraints { make -> Void in
            make.height.equalTo(134)
            make.width.equalTo(800)
            
            make.top.equalTo(0)
            make.left.equalTo(contentView).offset(0)
            make.right.equalTo(contentView).offset(0)
        }
        
    }
    
}
