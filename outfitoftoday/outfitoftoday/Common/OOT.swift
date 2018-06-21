//
//  Strings.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//
import Foundation
import UIKit

enum OOT {
    enum NETWORK: CustomStringConvertible {
        case URLPATH
        case dusts
        case temperatures
        
        var description: String {
            switch self {
                case .URLPATH:
                    return "http://13.125.232.55:8080/"
                case .dusts:
                    return "\(NETWORK.URLPATH)dusts"
                case .temperatures:
                    return "\(NETWORK.URLPATH)temperatures"
            }
        }
    }
    
    enum ViewPage: Int {
        case count = 4
    }
    
    enum Bg {
        case page
        case profile
        
        var rawValue: UIColor {
            switch self {
            case .page:
                return UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
            case .profile:
                return UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1)
            }
        }
    }
    
    enum Main: String, CustomStringConvertible {
        case location
        case weatherTitle
        case outdoorTemperature
        case moningTemperature
        case afternoonTemperature
        case recommendationMSG
        
        var description: String {
            switch self {
                case .location:
                    return "현재위치"
                case .weatherTitle:
                    return "-23˚"
                case .outdoorTemperature:
                    return """
                비 온 후 갬,
                어제보다 14˚낮아요.
                """
                case .moningTemperature:
                    return "-18"
                case .afternoonTemperature:
                    return "-23"
                case .recommendationMSG:
                    return """
                비가 오니 외출할 때 우산은 필수!
                어제보다 좀 더 추워요.
                오늘은 긴팔, 긴바지를 추천합니다 : )
                """
            }
        }
        
    }
}
