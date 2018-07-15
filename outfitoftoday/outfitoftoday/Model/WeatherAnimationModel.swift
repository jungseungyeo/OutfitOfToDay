//
//  WeatherAnimationModel.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 6..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

struct WeaetherModel {
    
    let weatherType: WeatherAnimationViewController.weather     // 눈, 비
    let wind: WeatherAnimationViewController.status.wind        // 바람 쌔기
    let amount: WeatherAnimationViewController.status.amount    // 눈, 비 의 양
    let speed: WeatherAnimationViewController.status.speed      // 속도
    
    init(_ weatehrType: WeatherAnimationViewController.weather,
         _ wind: WeatherAnimationViewController.status.wind,
         _ amount:  WeatherAnimationViewController.status.amount,
         _ speed: WeatherAnimationViewController.status.speed
         ) {
        
        self.weatherType = weatehrType
        self.wind = wind
        self.amount = amount
        self.speed = speed
    }
}
