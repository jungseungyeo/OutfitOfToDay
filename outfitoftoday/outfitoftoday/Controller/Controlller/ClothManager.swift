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
    
    static func getTop(value: Int) -> UIImage? {
        switch value {
            case 0:
                return UIImage(named: "body_0")
            case 1:
                return UIImage(named: "body_1")
            default:
                return UIImage(named: "body_2")
        }
    }
    
    static func getBottom(value: Int) -> UIImage? {
        switch value {
            case 0:
                return UIImage(named: "leg_0")
            case 1:
                return UIImage(named: "leg_1")
            default:
                return UIImage(named: "leg_1")
        }
    }
    
    static func getumbrella(value: Int) -> UIImage? {
        switch value {
            case 0:
                return nil
            case 1:
                return UIImage(named: "closeUmbrella")
            default:
                return UIImage(named: "unfoldUmbrella")
        }
    }
    
    static func getShoes(value: Int) -> UIImage? {
        switch value {
        case 0:
            return UIImage(named: "foot_0")
        case 1:
            return UIImage(named: "foot_1")
        default:
            return UIImage(named: "foot_1")
        }
    }
    
    static func getUbody(value: Int) -> UIImage? {
        switch value {
        case 0:
            return UIImage(named: "ubody_0")
        case 1:
            return UIImage(named: "ubody_1")
        default:
            return UIImage(named: "ubody_2")
        }
    }
}
