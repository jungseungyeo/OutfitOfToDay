//
//  MainBackgroudable.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 22..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

protocol MainBackGourndable {
    var mainBackground: UIImageView { get }
    func instance() -> MainBackGourndable
    func setUIImge(with imgeName: String) -> MainBackGourndable
    func setUIBackgoundColor(with backColor: UIColor) -> MainBackGourndable
}
