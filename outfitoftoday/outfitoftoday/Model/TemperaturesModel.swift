//
//  TemperaturesModel.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 28..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

/*
 current: 현재 온도
 maximum: 오늘 최고 온도
 minimum: 오늘 최저 온도
 today: 현 시간 부터 1시간 단위의 온도
 tomorrow: 내일 온도 List
 */

struct TemperaturesModel {
    let current: String
    let maximum: String
    let minimum: String
    
    let today: [Int]
    let tomorrow: [Int]
    
    init(current: String, maximum: String, minimum: String, today: [Int], tomorrow: [Int]) {
        self.current = current
        self.maximum = maximum
        self.minimum = minimum
        
        self.today = today
        self.tomorrow = tomorrow
    }
}
