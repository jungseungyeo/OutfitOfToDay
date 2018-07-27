//
//  BackgroundsModel.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 27..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

/**
 skyCoverage: 구름의 양 (1 ~ 12)
 precipitation: 눈, 비, 없음 (snow, rain, none)
 weather: 맑음, 흐림, 눈 (sunny, snowy)
 windSpeed: 바람 속도 ( 0, 1) // 현재 0, 1로만 보내줌
 */

struct BackgroundsModel: Codable {
    let skyCoverage: Int
    let precipitation: String
    let weather: String
    let windSpeed: Int
    
    init(skyCoverage: Int, precipitation: String, weather: String, windSpeed: Int) {
        self.skyCoverage = skyCoverage
        self.precipitation = precipitation
        self.weather = weather
        self.windSpeed = windSpeed
    }
}
