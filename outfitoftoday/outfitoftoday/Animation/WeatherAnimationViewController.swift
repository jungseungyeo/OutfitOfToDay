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
    
    private enum statuc {
        
        enum amount {
            case many
            case middle
            case low
        }
        
        enum wind {
            case many
            case middle
            case low
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
    
    @objc func animationTimerHandler() {
        
        
    }
    
}
