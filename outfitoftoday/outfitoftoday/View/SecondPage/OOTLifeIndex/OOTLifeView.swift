//
//  OOTLifeView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 20..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class OOTLifeView: BaseView {
    
    private let ootLifeindxeTitle: UILabel = ConCreateOOTLabel().instance()
        .setTextString(with: "생활지수")
        .setFontSize(with: 16)
        .setTextColor(with: .setColor(51, 51, 51))
        .setTextAlignment(with: .center)
        .ootLabel
    
    private let ootlifeIndexStackView = OOTLifeIndexStackView()
    
    override func setupView() {
        super.setupView()
        
        addSubViews(
            ootLifeindxeTitle,
            ootlifeIndexStackView
        )
        
        ootLifeindxeTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(21)
            make.centerX.equalTo(self)
        }
        
        ootlifeIndexStackView.snp.makeConstraints { make -> Void in
            
            make.height.equalTo(135)
            
            make.top.equalTo(ootLifeindxeTitle.snp.bottom).offset(30)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        ootlifeIndexStackView.setStacks(makeStackView())
    }
    
    private func makeStackView() -> [OOTLifeIndexView] {
        return [OOTLifeIndexView(), OOTLifeIndexView(), OOTLifeIndexView()]
    }
}
