//
//  FindDustViewCell.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 27..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit

class FindDustViewCell: BaseCollectionViewCell {
    
    private let findDustView = ConCreateOOTImg().instance()
        .setUIBackgoundColor(with: .gray)
        .ootImg
    
    override func setupView() {
        super.setupView()
        
        addSubViews(findDustView)
        
        findDustView.layer.cornerRadius = 21
        
        findDustView.snp.makeConstraints{ make -> Void in
            make.top.equalTo(16)
            make.centerX.equalTo(self)
            
            make.size.equalTo(42)
        }
    }
    
}
