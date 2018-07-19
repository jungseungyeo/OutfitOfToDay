//
//  RainVC.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 4..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class WeatherAnimationViewController: BaseVC {
    
    private var wind: status.wind = .step1
    private var speed: status.speed = .nomal
    
    private var model = WeaetherModel(
                              .snow,
                              .step3,
                              .middle,
                              .slow)
    
    enum weather: String {
        case rain
        case snow
        case none
    }
    
    enum status {
        
        enum speed {
            case fast
            case nomal
            case slow
            
            var ratio: Double {
                switch self {
                case .fast:
                    return 2.0
                case .nomal:
                    return 3.0
                case .slow:
                    return 7.0
                }
            }
        }
        
        enum amount {
            case many
            case middle
            case low
            
            var ratio: Double {
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
        
        enum wind: Int {
            case step1 = 100
            case step2
            case step3
            case step4
            case step5
            case step6
            
            var ratio: Int {
                switch self {
                    case .step1:
                        return 100
                    case .step2:
                        return Int(status.wind.step1.ratio * 2)
                    case .step3:
                        return Int(status.wind.step1.ratio * 4)
                    case .step4:
                        return Int(status.wind.step1.ratio * 8)
                    case .step5:
                        return Int(status.wind.step1.ratio * 9)
                    case .step6:
                        return Int(status.wind.step1.ratio * 10)
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        setting(model)
        startSnowAnimation(to: model.amount)
    }
    
    private func setting(_ model: WeaetherModel) {
        wind = model.wind
        speed = model.speed
    }
    
    private func mkaeView(to weatherSytle: weather) -> UIImageView {
        let weatherView = UIImageView()
        
        guard let weatherImg = UIImage(named: "snow.png") else {
            // defaulet img
            return UIImageView()
        }
        
        switch weatherSytle {
            case .rain:
                weatherView.image = UIImage(named: "waterdrop.png")
                return weatherView
            case .snow:
                weatherView.image = weatherImg
                return weatherView
            case .none:
                return weatherView
        }
    }
    
    private func startSnowAnimation(to amount: status.amount) {
        
        Timer.scheduledTimer(timeInterval: amount.ratio, target: self, selector: #selector(animationTimerHandler), userInfo: nil, repeats: true)
    }
    
    private func getRandomStartX() -> Int {
        return Int(arc4random_uniform(UInt32(UIScreen.main.bounds.maxX))) * 2
    }

    
    func getXpoint(to step: status.wind) -> (Int, Int) {
        let startX = getRandomStartX()
        let endX = startX
        
        switch step {
            case .step1:
                return (startX, endX - status.wind.step1.ratio)
            case .step2:
                return (startX, endX - status.wind.step2.ratio)
            case .step3:
                return (startX, endX - status.wind.step3.ratio)
            case .step4:
                return (startX, endX - status.wind.step4.ratio)
            case .step5:
                return (startX, endX - status.wind.step5.ratio)
            case .step6:
                return (startX, endX - status.wind.step6.ratio)
        }
    }
    
    @objc func animationTimerHandler() {
        
        let weatherType = model.weatherType
        
        if weatherType == weather.none {
            return
        }
        
        let downWeather = mkaeView(to: model.weatherType)
        
        let (startx, endx) = getXpoint(to: wind)
        
        self.view.addSubview(downWeather)
        
        downWeather.frame = CGRect(x: startx, y: -10, width: 10, height: 10)
        downWeather.tag = startx + endx
        UIImageView.animate(withDuration: speed.ratio, animations: {
            downWeather.frame = CGRect(x: endx, y: Int(UIScreen.main.bounds.height) - 40, width: 10, height: 10)
        }, completion: { finished in
            if downWeather.tag == (startx + endx) {
                downWeather.removeFromSuperview()
            }
        }
        )
    }
}

extension WeatherAnimationViewController {
    public func setWeatherModel(with weatherModel: WeaetherModel) {
        self.model = weatherModel
        
    }
}

