//
//  MainView.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 13..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import SnapKit
import Then
import UIKit

class MainView: BaseView {
    
    let mainTitle = UILabel().then{
        $0.text = "OutFit Of TheDay"
        $0.font = .systemFont(ofSize: 50)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    override func setupView() {
        super.setupView()
        
        addSubViews(mainTitle)
        
        mainTitle.snp.remakeConstraints{
            $0.center.equalTo(self)
        }
    }
}
