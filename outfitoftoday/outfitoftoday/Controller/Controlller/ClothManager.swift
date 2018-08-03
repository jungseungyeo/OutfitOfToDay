//
//  ClothManager.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 8. 3..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class ClothManager {
    
    static func getSunglass(value: Int) -> UIImage? {
        
        switch value {
            case 0:
                return nil
            default:
                return UIImage(named: "sunglass")
        }
    }
    
    static func getMask(value: Int) -> UIImage? {
        switch value {
            case 0:
                return nil
            default:
                return UIImage(named: "mask")
        }
    }
    
    static func getFasc(value: Int) -> UIImage? {
        switch value {
            case 0:
                return nil
            case 1:
                return UIImage(named: "")
            default:
                return UIImage(named: "")
        }
    }
}
