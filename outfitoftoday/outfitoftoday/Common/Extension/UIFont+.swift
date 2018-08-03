//
//  UIFont+.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 8. 3..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum spoqaType: String {
        case regular
        case bold
        case light
        
        var fontName: String {
            switch self {
            case .regular:
                return "SpoqaHanSans-Regular"
            case .bold:
                return "SpoqaHanSans-Bold"
            case .light:
                return "SpoqaHanSans-Light"
            }
        }
    }
    
    
    static func spoqaFont(ofSize: CGFloat, weight: spoqaType) -> UIFont {
        
        guard let customFont = UIFont(name: weight.fontName, size: ofSize) else {
            return .systemFont(ofSize: ofSize, weight: .regular)
        }
        return customFont
    }
}
