//
//  OOTSecondViewController.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 19..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import Foundation
import SnapKit

class OOTSecondViewController: BaseVC {
    
    private let secondView = OOTSecondTimeView()
    
    private let location = LocationManager.shared
    
    private let cal = Calendar.current
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func setupView() {
        super.setupView()
        view = secondView
        requestGetTemperature()
        makeTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupData() {
        secondView.setLotionTitle(to: location.cityName)
//        secondView.setTime(to: getNowTime())
    }
    
}

// 시간
extension OOTSecondViewController {
        
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
//            updateView()
        }
}

// 온도
extension OOTSecondViewController {
    
    private func requestGetTemperature() {
        NetWork.shared.request(for: .temperature) { (result) in
            if let responseObject = result as? OOTTemperatureData {
                DispatchQueue.main.async {
                    self.secondView.setNowTemperature(to: self.convertToTemperatureText(temperatureText: responseObject.current))
                    self.secondView.setMaxTemperature(to: self.convertToTemperatureText(temperatureText: responseObject.maximum))
                    self.secondView.setMinTemperature(to: self.convertToTemperatureText(temperatureText: responseObject.minimum))
                }
            }
        }
    }
    
    private func convertToTemperatureText(temperatureText: String?) -> String {
        guard let temperature = temperatureText else {
            return "-23 ̊"
        }
        return "\(temperature) ̊"
    }
}

