//
//  BackgroundView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 24..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class BackgoundView: BaseView {
    
    private let backgound: UIImageView = ConCreateOOTImg().instance()
        .setUIImge(with: "MainBack")
        .ootImg
    
    
    override func setupView() {
        super.setupView()
        
        addSubViews(backgound)
        
        backgound.snp.remakeConstraints { make -> Void in
            make.size.equalTo(self)
        }

    }
}
