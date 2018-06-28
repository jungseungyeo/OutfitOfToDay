//
//  FindDustStackView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 28..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit

class DustStackView: BaseStackView {

    private var dustStackViews = [UIView]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func setupView() {
        super.setupView()
    }
    
    func setStacks(_ stacksViews: [UIView], _ count: Int) {
        self.dustStackViews = stacksViews
        spacing = UIStackView.spacingUseDefault
        distribution = .fillEqually
        drawStacks(count)
    }
    
    private func drawStacks(_ count: Int) {
        for (index, oneStack) in dustStackViews.enumerated() {
            addSubview(oneStack)
            
            oneStack.layer.cornerRadius = 5
            
            let width = 320 / count
        
            oneStack.snp.makeConstraints{ make -> Void in
                make.height.equalTo(self).offset(0)
                make.width.equalTo(width - 5)
                make.top.equalTo(0)
                make.left.equalTo(index * width)
            }
        }
    }

}
