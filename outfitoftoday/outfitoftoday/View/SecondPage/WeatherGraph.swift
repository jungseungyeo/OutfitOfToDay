//
//  WeatherGraph.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit

class WeatherGraph: BaseView {
    
    private var timeText = UILabel().then {
        $0.text = ""
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10)
    }
    
    private let scrollView = UIScrollView()
    private let wrapper = UIView()
    
    
    override func setupView() {
        super.setupView()
        
        self.snp.makeConstraints { make -> Void in
            make.height.equalTo(144)
            make.width.equalTo(338)
        }
        makeTimeText()
        addSubview(scrollView)
        
        scrollView.addSubview(wrapper)
        wrapper.addSubview(timeText)
        
        scrollView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(100)
            make.width.equalToSuperview()
        }
        
        wrapper.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        timeText.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private func makeTimeText() {
        
        for index in 0 ... 24 {
            var text = ""
            if index == 0 {
                text = timeText.text! + "0\(index)시"
                timeText.text = text
            }else {
                 text = timeText.text! + "\(index)시"
                timeText.text = text
            }
            
            if 24 != index {
                text = timeText.text! + "       "
                timeText.text = text
                
            }
        }
    }
    
}
