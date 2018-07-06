//
//  RainVC.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 4..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class WeatherAnimationViewController: BaseVC {
    
    private enum weather {
        case rain
        case snow
    }
    
    enum status {
        
        enum amount {
            case many
            case middle
            case low
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
        startSnowAnimation(at: 0.05)
    }
    
    private func mkaeView(to weatherSytle: weather) -> UIImageView {
        let weatherView = UIImageView()
        
        guard let weatherImg = UIImage(named: "snow.png") else {
            // defaulet img
            return UIImageView()
        }
        
        switch weatherSytle {
            case .rain:
                weatherView.image = weatherImg
                return weatherView
            case .snow:
                weatherView.image = weatherImg
                return weatherView
        }
    }
    
    private func startSnowAnimation(at duration: TimeInterval) {
        Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(animationTimerHandler), userInfo: nil, repeats: true)
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
        let downWeather = mkaeView(to: weather.snow)
        let (startx, endx) = getXpoint(to: status.wind.step4)
        
        self.view.addSubview(downWeather)
        
        downWeather.frame = CGRect(x: startx, y: 0, width: 10, height: 10)
        downWeather.tag = startx + endx
        UIImageView.animate(withDuration: 4.0, animations: {
            downWeather.frame = CGRect(x: endx, y: Int(UIScreen.main.bounds.height) + 10, width: 10, height: 10)
        }, completion: { finished in
            if downWeather.tag == (startx + endx) {
                downWeather.removeFromSuperview()
            }
        }
        )
    }
    
}

