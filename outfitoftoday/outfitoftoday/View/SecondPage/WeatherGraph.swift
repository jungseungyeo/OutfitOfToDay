//
//  WeatherGraph.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class WeatherGraph: BaseView {
    
    private var timeText = UILabel().then {
        $0.text = ""
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10)
    }
    
    internal let tmpImg = ConCreateOOTImg().instance()
        .setUIImge(with: "tmpScrollview")
        .ootImg.then {
            $0.frame.size = CGSize(width: $0.frame.size.width, height: 100)
    }
    
    private let scrollView = UIScrollView()
    private let wrapper = UIView()
    
    override func setupView() {
        super.setupView()
        
        self.snp.makeConstraints { make -> Void in
            make.height.equalTo(144)
            make.width.equalTo(338)
        }
        
        addSubview(scrollView)
        scrollView.addSubview(wrapper)
        wrapper.addSubview(tmpImg)
        
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(0)
            make.width.equalToSuperview()
        }
        
        wrapper.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        tmpImg.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
