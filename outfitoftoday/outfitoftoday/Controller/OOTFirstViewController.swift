//
//  OOTTimeObject.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import Foundation
import Then
import UIKit

class OOTFirstViewController: BaseVC {
    
    private let ootFirstView = OOTFirstView()
    
    private let location = LocationManager.shared
    
    private let cal = Calendar.current
    
    private var clounds: [UIImageView] = []
    
    private let cloth: UIView = OOTClothView()
    
    override func setupView() {
        super.setupView()
        makeTimer()
        setTemperature()
        setBackground()
        updateView()
    }
    
    private func setTemperature() {
        requestGetTemperature()
        setupData()
        location.setup()
    }
    
    private func setBackground() {
        requestGetBackground()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func updateView() {
        view = ootFirstView
        view.addSubview(cloth)
        
        cloth.snp.makeConstraints { make -> Void in
            make.top.equalTo(ootFirstView.weatherBackground.snp.top).offset(60)
            make.right.equalTo(ootFirstView.weatherBackground.snp.right).offset(0)
        }
    }
    
    private func setupData() {
        ootFirstView.setTime(to: getNowTime())
        ootFirstView.setLotionTitle(to: location.cityName)
    }
}

// 온도
extension OOTFirstViewController {

    private func requestGetTemperature() {
        NetWork.shared.request(for: .temperature) { (result) in
            if let responseObject = result as? OOTTemperatureData {
                DispatchQueue.main.async {                    
                    self.ootFirstView.setNowTemperature(to: self.convertToTemperatureText(temperatureText: responseObject.current))
                }
            }
        }
    }
    
    private func convertToTemperatureText(temperatureText: String?) -> String {
        guard let temperature = temperatureText else {
            return "-23"
        }
        return "\(temperature)"
    }
}

// 시간
extension OOTFirstViewController {
    
    private func validHour(hour: Int) -> String {
        switch hour {
            case 0 ... 9:
                return "오전 0\(hour)시"
            case 10 ... 12:
                return "오전 \(hour)시"
            case 13 ... 19:
                let validhour = hour % 12
                return "오후 0\(validhour)"
            default:
                let validhour = hour % 12
                return "오후 \(validhour)시"
            }
    }
    
    private func validMinute(minute: Int) -> String {
        
        switch minute {
            case 0 ... 9:
                return "0\(minute)분"
            default:
                return "\(minute)분"
        }
    }
    
    private func getNowTime() -> String {
        let date = Date()
        let hour = validHour(hour: cal.component(.hour, from: date))
        let min = validMinute(minute: cal.component(.minute, from: date))
        return "\(hour) \(min)"
    }
    
    private func makeTimer() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
    }
    
    @objc private func setTime() {
        setupData()
        updateView()
    }
}

// 날씨
extension OOTFirstViewController {
    
    enum status: String {
        case sunny
        case cloudy
        case snowy
    }
    
    
    private func requestGetBackground() {
        NetWork.shared.request(for: .background) { (result) in
            if let responseObject = result as? OOTBackgroundData {
                DispatchQueue.main.async {
                    self.makeWeatherBG(to: responseObject.weather)
                    self.makeClounds(to: responseObject.skyCoverage)
                    self.setCloud()
                    self.moveClound(to: responseObject.windSpeed)
                    
                    self.dropWeather(precipitation: responseObject.precipitation, skyCoverage: responseObject.skyCoverage, windSpeed: responseObject.windSpeed)
                }
            }
        }
    }
    
    private func makeWeatherBG(to weatherStatus: String?) {
        
        guard let weatherStatus = weatherStatus else {
            return
        }
        
        guard let status = OOTFirstViewController.status(rawValue: weatherStatus) else {
            return
        }
        
        switch status {
            case .sunny:
                self.ootFirstView.setWeatherBackGround(to: UIImage(named: "BackgroundImageFine"))
                self.ootFirstView.isHiddenAstal(to: false)
                return
            case .cloudy:
                self.ootFirstView.setWeatherBackGround(to: UIImage(named: "BackgroundImageCloudy"))
                self.ootFirstView.isHiddenAstal(to: true)
                return
            case .snowy:
                self.ootFirstView.setWeatherBackGround(to: UIImage(named: "BackgroundImageSnowy"))
                self.ootFirstView.isHiddenAstal(to: true)
                return
        }
    }
}

// 구름
extension OOTFirstViewController {
    private func makeClounds(to skyConverage: Int?) {
        
        guard let skyConverage = skyConverage else {
            return
        }
        
        var cloudCound: Int = 0
        switch skyConverage {
            case 0 ... 2:
                cloudCound = 3
            case 3 ... 7:
                cloudCound = 5
            default:
                cloudCound = 10
        }
        
        for _ in 0 ..< cloudCound {
            self.clounds.append(ootFirstView.makeCloudImg())
        }
    }
    
    private func setCloud() {
        for cloud in clounds {
            let size = getRandomSize()
            ootFirstView.locationCloud(to: cloud,size: size, top: getRandomTop(), left: getRandomX(), alpha: getRandAlpha(to: size))
        }
    }
    
    private func moveClound(to windSpeed: Int?) {
        
        for cloud in clounds {
            ootFirstView.movecloud(to: cloud, speed: getRandSpeed())
        }
    }
    
    private func getRandomX() -> Int {
        return Int(arc4random_uniform(UInt32(UIScreen.main.bounds.maxX)))
    }
    
    private func getRandomTop() -> Int {
        return Int((arc4random_uniform(UInt32(3))) + 1) * 20
    }
    
    private func getRandomSize() -> Int {
        let size = Int(arc4random_uniform(UInt32(100)))
        
        if size < 30 {
            return 30
        }
        
        return size
    }
    
    private func getRandAlpha(to size: Int) -> CGFloat {
        let alpha = CGFloat(size / 10)
        return alpha * 0.1
    }
    
    private func getRandSpeed() -> Int {
        let speed = Int((arc4random_uniform(UInt32(50))) + 1)
        return speed
    }
}

// 눈 비 효과
extension OOTFirstViewController {
    private func dropWeather( precipitation: String?, skyCoverage: Int?, windSpeed: Int?) {
        
        let weatherStyle = getDropWeatherStyle(to: precipitation)
        let dropAmount = getDropAmount(to: skyCoverage)
        let weatherSpeed = getDropDownSpeed(to: windSpeed)
        let weatherWind = getDropDisSpeedto(to: windSpeed)
        
        let weatherModel = WeaetherModel(weatherStyle, weatherWind, dropAmount, weatherSpeed)
        
        let weatherController = WeatherAnimationViewController()
        weatherController.setWeatherModel(with: weatherModel)
        
        ootFirstView.weatherBackground.addSubview(weatherController.view!)
        ootFirstView.weatherBackground.clipsToBounds = true
    }
    
    // 비, 눈, 없음
    private func getDropWeatherStyle(to precipiation: String?) -> WeatherAnimationViewController.weather {
        
        guard let precipiation = precipiation else {
            return WeatherAnimationViewController.weather.none
        }
        
        guard let weatherStyle = WeatherAnimationViewController.weather(rawValue: precipiation) else {
            return WeatherAnimationViewController.weather.none
        }
        
        return weatherStyle
    }
    
    // 눈 비 양
    private func getDropAmount(to skyCoverage: Int?) -> WeatherAnimationViewController.status.amount {
        guard let skyCoverage = skyCoverage else {
            return WeatherAnimationViewController.status.amount.low
        }
        
        switch skyCoverage {
            case 0 ... 2:
                return WeatherAnimationViewController.status.amount.low
            case 3 ... 7:
                return WeatherAnimationViewController.status.amount.middle
            default:
                return WeatherAnimationViewController.status.amount.many
        }
    }
    
    // 떨어지는 속도
    private func getDropDownSpeed(to windSpeed: Int?) -> WeatherAnimationViewController.status.speed {
        guard let windSpeed = windSpeed else {
            return WeatherAnimationViewController.status.speed.slow
        }
        return WeatherAnimationViewController.status.speed.slow
    }
    
    // 거리
    private func getDropDisSpeedto(to windSpeed: Int?) -> WeatherAnimationViewController.status.wind {
        guard let windSpeed = windSpeed else {
            return WeatherAnimationViewController.status.wind.step1
        }
        
        return WeatherAnimationViewController.status.wind.step4
    }
}
