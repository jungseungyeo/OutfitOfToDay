//
//  BaseCollectionView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 27..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class BaseCollectionview: UICollectionView {
    
    func setupView() {
        
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
}
