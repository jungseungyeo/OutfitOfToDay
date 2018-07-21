//
//  DetailStackView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 20..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class DetailStackView: BaseStackView {
    
    private let titles: [String] = ["미세먼지", "풍량", "습도", "강수확률"]
    
    private let weatherLogoNames: [String] = ["dust", "wind", "humidity", "precipitation"]
    
    private let weatherStatus: [String] = ["보통", "약함", "0%", "44%"]
    
    private let stackViewWidth = Double((UIScreen.main.bounds.width-40) / 4)
    
    private var dustStackViews = [DetailView]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func setupView() {
        super.setupView()
    }
    
    
    func setStacks(_ stacksViews: [DetailView]) {
        self.dustStackViews = stacksViews
        spacing = UIStackView.spacingUseDefault
        distribution = .fillEqually
        drawStacks()
    }
    
    private func drawStacks() {
        for (index, oneStack) in dustStackViews.enumerated() {
            addSubview(oneStack)
            
            print(stackViewWidth)
            
            oneStack.setUpData(title: titles[index], dataLogoName: weatherLogoNames[index], weatherStatus: weatherStatus[index])
            
            oneStack.snp.makeConstraints{ make -> Void in
                make.height.equalTo(self).offset(0)
                make.width.equalTo(stackViewWidth)
                make.top.equalTo(0)
                make.left.equalTo(Double(index) * stackViewWidth)
            }

        }
    }
    
}
