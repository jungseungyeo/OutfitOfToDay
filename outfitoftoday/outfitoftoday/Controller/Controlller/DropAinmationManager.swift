//
//  DropAinmation.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//
import Foundation
import UIKit

class DropAnimationManager: NSObject {
    
    var dropView: DropAnimationView?
    
    enum weatherType: String {
        case rain
        case snow
        case none
        
        var img: UIImage? {
            switch self {
            case .rain:
                return UIImage(named: "rainiCon")
            case .snow:
                return UIImage(named: "snowiCon")
            case .none:
                return nil
            }
        }
    }
    
    enum amount: String {
        case many
        case middle
        case low
        
        var createTime: Double {
            switch self {
                case .many:
                    return 0.01
                case .middle:
                    return 0.05
                case .low:
                    return 0.1
            }
        }
    }
    
    enum dropSeep: String {
        case rain
        case snow
        
        var seep: Double {
            switch self {
                case .rain:
                    return 5.0
                case .snow:
                    return 7.0
            }
        }
    }
    
    static func getCreateAmountTime(skyCoverage: Int) -> Double {
        switch skyCoverage {
            case 1 ... 3:
                return amount.low.createTime
            case 4 ... 8:
                return amount.middle.createTime
            default:
                return amount.many.createTime
        }
    }
    
    static func getStartX() -> Int {
        return Int(arc4random_uniform(UInt32(UIScreen.main.bounds.maxX))) * 2
    }
    
    static func getEndX(startX: Int) -> Int {
        return (startX - 400)
    }
    
    internal func startAnimation(animationVC: UIViewController, dropSeep: Double) {
        
//        animationVC.view.addSubViews(<#T##views: UIView...##UIView#>)
    }
}
