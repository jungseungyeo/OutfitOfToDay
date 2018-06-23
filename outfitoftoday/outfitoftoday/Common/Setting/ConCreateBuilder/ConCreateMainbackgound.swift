//
//  ConCreateMainbackgound.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 22..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class ConCreateBuilderMainBackground: MainBackGourndable {
    
    var mainBackground: UIImageView = UIImageView()
    
    func instance() -> MainBackGourndable {
        return self
    }
    
    func setUIImge(with imgeName: String) -> MainBackGourndable {
        self.mainBackground.image = UIImage(named: imgeName)
        return self
    }
    
    func setUIBackgoundColor(with backColor: UIColor) -> MainBackGourndable {
        self.mainBackground.backgroundColor = backColor
        return self
    }
    
}
