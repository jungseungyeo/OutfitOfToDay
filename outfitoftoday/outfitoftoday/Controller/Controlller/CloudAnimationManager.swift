//
//  CloundAnimationManager.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//
import UIKit

class CloudAnimationManager: NSObject {
    
    enum skyCoverages {
        case many
        case middle
        case low
        
        var count: Int {
            switch self {
                case .many:
                    return 10
                case .middle:
                    return 5
                case .low:
                    return 3
            }
        }
    }
    
    enum cloudyType: String {
        case rain
        case snow
        case none
        
        var img: UIImage? {
            switch self {
            case .rain:
                return UIImage(named: "cloud")
            case .snow:
                return UIImage(named: "cloud")
            case .none:
                return UIImage(named: "cloud")
            }
        }
    }
    
    // 구름 크기 생성
    static func getCloundSize() -> Int {
        let randomSize = Int(arc4random_uniform(UInt32(100)))
        guard randomSize > 30 else {
            return 30
        }
        return randomSize
    }
    
    // 구름 투명도
    static func getRandAlpha(cloudSize: Int) -> CGFloat {
        return CGFloat(cloudSize / 10) * 0.1
    }
    
    // 구름의 이동속도
    static func getMoveSpeed() -> Int {
        return Int((arc4random_uniform(UInt32(50))) + 1)
    }
    
    // 구름 생성 (x좌표)
    static func makeCloudXPoint() -> Int {
        let width = UIScreen.main.bounds.width - 20
        return Int(arc4random_uniform(UInt32(width / 2)))
    }
    
    // 구름 생성 (높이)
    static func makeCloudYPoint() -> Int {
        return Int((arc4random_uniform(UInt32(3))) + 1) * 20
    }
    
    // 구름 생성 시간
    static func getCreateCloudCount(skyCoverage: Int) -> Int {
        switch skyCoverage {
            case 1 ... 3:
                return skyCoverages.low.count
            case 4 ... 7:
                return skyCoverages.middle.count
            default:
                return skyCoverages.many.count
        }
    }
    
}
