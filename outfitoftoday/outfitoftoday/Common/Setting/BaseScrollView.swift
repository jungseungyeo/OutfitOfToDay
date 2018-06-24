//
//  BaseScrollView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 24..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class BaseScrollView: UIScrollView {
    
    func setupView() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
}
