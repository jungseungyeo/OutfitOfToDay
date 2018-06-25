//
//  MainCell.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 25..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import SnapKit
import UIKit

class MainCell: BaseCollectionViewCell {
    
    override func setupView() {
        super.setupView()
        self.backgroundColor = .white
    }
    
    func addView(_ addView: UIView) {
        addSubview(addView)
        
        addView.snp.makeConstraints {
            $0.top.left.bottom.right.equalTo(self)
        }
    }
    
}
