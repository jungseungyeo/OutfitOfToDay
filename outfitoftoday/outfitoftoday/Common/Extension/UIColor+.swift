//
//  UIColor+.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 17..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

extension UIColor {
    static func setColor(_ red: CGFloat, _ green: CGFloat, _ bule: CGFloat, _ alpha: CGFloat = 1) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: bule/255, alpha: alpha)
    }
}
