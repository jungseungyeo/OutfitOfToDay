//
//  LocationManager.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 28..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import CoreLocation

class LocationManager: NSObject{
    
    static let shared = LocationManager()
    private var locationManager = CLLocationManager()
    private var observers: [LocationObserver] = [LocationObserver]()
    
    private var city: String = String()
    
    private var observerValue: String {
        set {
            city = newValue
            notifyObserver()
        }
        get {
            return city
        }
    }
    
    private override init(){ super.init() }
    
    internal func requestForLocation(){
        //Code Process
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func convertToAddressWith(coordinate: CLLocation) {
        let geoCoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        geoCoder.reverseGeocodeLocation(coordinate, preferredLocale: locale) { (placemarks, error) in

            guard let address: [CLPlacemark] = placemarks else {
                return
            }
            
            guard let cityName = address.first?.administrativeArea else {
                return
            }
            
            guard let cityVillage = address.first?.locality else {
                return
            }
            
            self.observerValue = "\(cityName) \(cityVillage)"
        }
    }
}

extension LocationManager {
//    private func validCityName
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard manager.location?.coordinate != nil else {
            return
        }
        
        guard let coordinate = manager.location else {
            return
        }
        
        convertToAddressWith(coordinate: coordinate)
    }
}

extension LocationManager {
    
    internal func attachObserver(_ observer: LocationObserver) {
        observers.append(observer)
    }
    
    private func notifyObserver() {
        for observer in observers {
            observer.updateLocation(city)
        }
    }
}
