//
//  TimeManager.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import Foundation

class TimeManager {
    
    static let shared: TimeManager = TimeManager()
    private init() { start() }
    
    private var time = Timer()
    private var observers: [TimeObserver] = []
    
    private var nowTime = ""
    
    private var observerValue: String {
        set{
            nowTime = newValue
            notifyObserver()
        }
        get {
            return nowTime
        }
    }
    
    private func start() {
        stop()
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime(sender:)), userInfo: [], repeats: true)
    }
    
    internal func stop() {
        time.invalidate()
    }
    
    @objc private func updateTime(sender: Timer) {
        observerValue = makeTimeFormat()
    }
    
    private func makeTimeFormat() -> String {
        let date = Date()
        let cal = Calendar.current
        let hour = cal.component(.hour, from: date)
        let minute = cal.component(.minute, from: date)
        
        return ("\(makeHoruFormat(hour: hour)) \(makeMinuteFormat(minute: minute))")
    }
    
    private func makeHoruFormat(hour: Int) -> String {
        switch hour {
            case 0 ... 9:
                return "오전 0\(hour)시"
            case 10 ... 12:
                return "오전 \(hour)시"
            case 13 ... 19:
                let validhour = hour % 12
                return "오후 0\(validhour)시"
            default:
                let validhour = hour % 12
                return "오후 \(validhour)시"
        }
    }
    
    private func makeMinuteFormat(minute: Int) -> String {
        switch minute {
            case 0 ... 9:
                return "0\(minute)분"
            default:
                return "\(minute)분"
        }
    }
}

extension TimeManager {
    internal func attachObserver(_ observer: TimeObserver) {
        observers.append(observer)
    }
    
    private func notifyObserver() {
        for observer in observers {
            observer.updateTime(nowTime)
        }
    }
}
