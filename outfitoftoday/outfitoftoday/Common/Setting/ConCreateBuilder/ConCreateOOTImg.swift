//
//  ConCreateMainbackgound.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 22..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class ConCreateOOTImg: ConCreateOOTImgable {
    
    var ootImg: UIImageView = UIImageView()
    
    func instance() -> ConCreateOOTImgable {
        return self
    }
    
    func setUIImge(with imgeName: String) -> ConCreateOOTImgable {
        self.ootImg.image = UIImage(named: imgeName)
        self.ootImg.contentMode = .scaleAspectFill
        return self
    }
    
    func setUIBackgoundColor(with backColor: UIColor) -> ConCreateOOTImgable {
        self.ootImg.backgroundColor = backColor
        return self
    }
    
}
