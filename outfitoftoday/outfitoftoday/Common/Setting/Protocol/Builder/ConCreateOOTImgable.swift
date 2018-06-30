//
//  MainBackgroudable.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 22..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

protocol ConCreateOOTImgable {
    var ootImg: UIImageView { get }
    func instance() -> ConCreateOOTImgable
    func setUIImge(with imgeName: String) -> ConCreateOOTImgable
    func setUIBackgoundColor(with backColor: UIColor) -> ConCreateOOTImgable
}
