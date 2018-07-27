//
//  BaseView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 27..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    internal func setup() {
    }
    
}
