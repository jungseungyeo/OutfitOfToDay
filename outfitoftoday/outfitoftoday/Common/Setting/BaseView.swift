//
//  BaseView.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 13..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    func setupView() {
        backgroundColor = .clear
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
