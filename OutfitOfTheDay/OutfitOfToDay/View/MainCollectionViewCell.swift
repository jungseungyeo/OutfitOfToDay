//
//  MainCollectionViewCell.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class BaseCollectionViewCell: UICollectionViewCell {
    
    func setupView() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MainCollectionViewCell: BaseCollectionViewCell {
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
