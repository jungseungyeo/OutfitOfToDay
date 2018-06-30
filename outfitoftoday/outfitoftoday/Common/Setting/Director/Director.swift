//
//  Director.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 22..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class Director {
    static func createMainbackground(builder: ConCreateOOTImgable) -> UIImageView {
        let build = builder.instance()
        build.setUIBackgoundColor(with: OOT.Bg.page.color)
        return build.ootImg
    }
}
