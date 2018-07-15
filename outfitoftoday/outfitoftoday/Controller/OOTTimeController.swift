//
//  OOTTimeObject.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import Foundation

class OOTTime: BaseVC {
    
    private let ootLocationView = OOTLocationView()
    
    private let location = LocationManager.shared
    
    private let cal = Calendar.current
    
    override func setupView() {
        super.setupView()
        requestGetTemperature()
        setupData()
        location.setup()
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTimer()
    }
    
    private func updateView() {
        view = ootLocationView
    }
    
    private func setupData() {
        ootLocationView.setTime(to: getNowTime())
        ootLocationView.setLotionTitle(to: location.cityName)
    }
}

// 온도
extension OOTTime {

    private func requestGetTemperature() {
        NetWork.shared.request(for: .temperature) { (result) in
            if let responseObject = result as? OOTTemperatureData {
                DispatchQueue.main.async {
                    self.ootLocationView.setNowTemperature(to: self.convertToTemperatureText(temperatureText: responseObject.current))
                }
            }
        }
    }
    
    private func convertToTemperatureText(temperatureText: String?) -> String {
        guard let temperature = temperatureText else {
            return "-23°"
        }
        return "\(temperature)°"
    }
}

// 시간
extension OOTTime {
    
    private func validHour(hour: Int) -> String {
        switch hour {
            case 0 ... 9:
                return "오전 0\(hour)시"
            case 10 ... 12:
                return "오전 \(hour)시"
            default:
                let validhour = hour / 12
                return "오후 0\(validhour)시"
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
