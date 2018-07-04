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
    
    private let graph: UIView = UIView()
    
    override func setupView() {
        super.setupView()
        
        graph.backgroundColor = .red
        
        self.snp.makeConstraints { make -> Void in
            make.height.equalTo(144)
            make.width.equalTo(344)
        }
        
        addSubViews(graph)
        
        graph.snp.makeConstraints { make -> Void in
            make.top.bottom.left.right.equalTo(self)
        }
        
    }
    
}
