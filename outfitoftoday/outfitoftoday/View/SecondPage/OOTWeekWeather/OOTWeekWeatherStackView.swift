//
//  OOTWeekWeatherStackView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 21..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class OOTWeekWeatherStackView: BaseStackView {
    
    private let weekToName: [String] = ["토요일", "일요일","월요일", "화요일", "수요일", "목요일", "금요일"]
    
    private let weekToImgName: [String] = ["sunny", "sunny", "suncloudy", "suncloudy", "suncloudy", "suncloudy", "suncloudy"]
    
//    private let stackViewWidth = Double((UIScreen.main.bounds.width * 335/375) / 7)

    private let stackViewWidth = Double((UIScreen.main.bounds.width) / 7)
    
    private var weekStackViews = [OOTWeekWeatherView]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func setupView() {
        super.setupView()
    }
    
    
    public func setStacks(_ stacksViews: [OOTWeekWeatherView]) {
        self.weekStackViews = stacksViews
        spacing = UIStackView.spacingUseDefault
        distribution = .fillEqually
        drawStacks()
    }
    
    private func drawStacks() {
        
        let tmp: Double = -1
        
        for (index, oneStack) in weekStackViews.enumerated() {
            addSubview(oneStack)
            
            print(stackViewWidth)
            
            oneStack.setUpData(dayName: weekToName[index], weatherStatusName: weekToImgName[index])
            
            oneStack.snp.makeConstraints{ make -> Void in
                make.height.equalTo(self).offset(0)
                make.width.equalTo(stackViewWidth)
                make.top.equalTo(0)
                make.left.equalTo(self).offset((tmp + Double(index)) * stackViewWidth + 20)
            }
        }
    }
    
}
