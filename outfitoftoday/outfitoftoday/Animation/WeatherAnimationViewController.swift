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
                        return Int(status.wind.step1.ratio * 3)
                    case .step4:
                        return Int(status.wind.step1.ratio * 4)
                    case .step5:
                        return Int(status.wind.step1.ratio * 5)
                    case .step6:
                        return Int(status.wind.step1.ratio * 6)
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func getRandomStartX() -> Int {
        return Int(arc4random_uniform(UInt32(UIScreen.main.bounds.maxX)))
    }
    
    func isEndX(to startX: Int, from endX: Int) -> Bool{
        if startX > endX {
            return false
        }
        return true
    }
    
    func getXpoint(to step: status.wind) -> (Int, Int) {
        let startX = getRandomStartX()
        let endX = startX
        
        switch step {
            case .step1:
                return (0, 0)
            case .step2:
                return (0, 0)
            case .step3:
                return (0, 0)
            case .step4:
                return (0, 0)
            case .step5:
                return (0, 0)
            case .step6:
                return (0, 0)
        }
        
        
        return (startX, endX)
    }
    
    @objc func animationTimerHandler() {
        
    }
    
}

