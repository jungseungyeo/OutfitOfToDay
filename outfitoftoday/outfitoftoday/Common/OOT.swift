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
    enum NETWORK {
        case URLPATH
        case dusts
        case temperatures
    }
    
    enum ViewPage: Int {
        case count = 4
    }
    
    enum Bg {
        case page
        case profile
        
        var color: UIColor {
            switch self {
            case .page:
                return UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
            case .profile:
                return UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1)
            }
        }
    }

    enum mainCustomString {
        case location           // 현재 위치
        case nowTime            // 현재 날짜
        case nowTemperature     // 현재 온도
        case lowTemperature     // 오늘 최저 온도 숫자
        case hightTemperature   // 오늘 최고 온도 숫자
        case hightTemperatureText   // 오늘 최고 온도 Text
        case lowTemperatureText
        case halfTemperature
        case Recommend
        
        case baseWeatherTitle
        case detailWeatherTitle
        case weekWeatherTitle
        
        case gotoTop
        case time00
        
        case finddust
        }
}

// MAKR : 첫번째 화면 글자 및 폰트 저장

extension OOT.mainCustomString: CustomStringConvertible {
    var description: String {
        switch self {
            case .location:
                return "서울 강남구"
            case .nowTime:
                return "오후 00시 00 분"
            case .nowTemperature:
                return "-23˚"
            case .lowTemperature:
                return "28˚"
            case .hightTemperature:
                return "16˚"
            case .hightTemperatureText:
                return "최고"
            case .lowTemperatureText:
                return "최저"
            case .halfTemperature:
                return "/"
            case .Recommend:
                return
            """
            비가 오니 외출할 때 우산은
            필수! 어제보다 좀 더 추워요.
            오늘은 긴팔, 긴바지를
            추천합니다 :)
            """
            case .baseWeatherTitle:
                return "기본날씨"
            case .detailWeatherTitle:
                return "상세날씨"
            case .weekWeatherTitle:
                return "주간날씨"
            case .gotoTop:
                return "GO TO TOP"
            case .time00:
                return "00"
            case .finddust:
                return "미세먼지"
        }
    }
    
    var fontType: String {
        switch self {
            case .location:
                return "HelveticaNeue-Bold"
            case .nowTime:
                return "SpoqaHanSans-Light"
            case .nowTemperature:
                return "SpoqaHanSans-Bold"
            case .lowTemperature:
                return "SpoqaHanSans-Bold"
            case .hightTemperature:
                return "SpoqaHanSans-Bold"
            case .hightTemperatureText:
                return "SpoqaHanSans-Regular"
            case .lowTemperatureText:
                return "SpoqaHanSans-Regular"
            case .halfTemperature:
                return "SF Pro Display-Regular"
            case .Recommend:
                return "SpoqaHanSans-Light"
            case .baseWeatherTitle:
                return "SpoqaHanSans-Regular"
            case .detailWeatherTitle:
                return "SpoqaHanSans-Regular"
            case .weekWeatherTitle:
                return "SpoqaHanSans-Regular"
            case .gotoTop:
                return "SpoqaHanSans-Regular"
            case .time00:
                return "SpoqaHanSans-Regular"
            case .finddust:
                return "SpoqaHanSans-Regular"
        }
    }
}

// MARK : Network url
extension OOT.NETWORK: CustomStringConvertible {
    var description: String {
        switch self {
            case .URLPATH:
                return "http://13.125.232.55:8080/"
            case .dusts:
                return "\(OOT.NETWORK.URLPATH)dusts"
            case .temperatures:
                return "\(OOT.NETWORK.URLPATH)temperatures"
        }
    }
}

