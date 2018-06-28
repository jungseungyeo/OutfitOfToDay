//
//  BaseStackView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 28..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class BaseStackView: UIStackView {
    
    func setupView() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
}
