//
//  OOTLifeIndexStackView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 20..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class OOTLifeIndexStackView: BaseStackView {
    
    private let titles: [String] = ["체감온도", "자외선", "불쾌지수"]
    
    private let weatherLogoNames: [String] = ["temper", "lifeSun", "discomfortIndex"]
    
    private let weatherStatus: [String] = ["좋음", "보통", "나쁨"]
    
    private let stackViewWidth = Double((UIScreen.main.bounds.width - 80) / 3)
    
    private let verticalBarOne: UIImageView = ConCreateOOTImg().instance()
        .setUIBackgoundColor(with: .setColor(240,240,240))
        .ootImg
    
    private let verticalBarTwo: UIImageView = ConCreateOOTImg().instance()
        .setUIBackgoundColor(with: .setColor(240,240,240))
        .ootImg
    
    private var dustStackViews = [OOTLifeIndexView]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func setupView() {
        super.setupView()
    }
    
    
    public func setStacks(_ stacksViews: [OOTLifeIndexView]) {
        self.dustStackViews = stacksViews
        spacing = UIStackView.spacingUseDefault
        distribution = .fillEqually
        drawStacks()
    }
    
    private func drawStacks() {
        for (index, oneStack) in dustStackViews.enumerated() {
            addSubview(oneStack)
            
            oneStack.setUpData(title: titles[index], dataLogoName: weatherLogoNames[index], weatherStatus: weatherStatus[index])
            
            oneStack.snp.makeConstraints{ make -> Void in
                make.height.equalTo(self).offset(0)
                make.width.equalTo(stackViewWidth)
                make.top.equalTo(0)
                make.left.equalTo(Double(index) * stackViewWidth)
            }
            
            if index == 0 {
                addSubview(verticalBarOne)
                
                verticalBarOne.snp.makeConstraints { make -> Void in
                    make.width.equalTo(1)
                    make.height.equalTo(99)
                    
                    make.top.equalTo(oneStack.snp.top).offset(0)
                    make.left.equalTo(oneStack.snp.right).offset(0)
                }
                
            }else if index == 2{
                addSubview(verticalBarTwo)
                
                verticalBarTwo.snp.makeConstraints { make -> Void in
                    make.width.equalTo(1)
                    make.height.equalTo(99)
                    
                    make.top.equalTo(oneStack.snp.top).offset(0)
                    make.left.equalTo(oneStack.snp.left).offset(0)
                }
            }
        }
    }
}
