//
//  LocationManager.swift
//  outfitoftoday
//
//  Created by 이광용 on 2018. 7. 10..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import CoreLocation

final class LocationManager: NSObject {
    
    static let shared = LocationManager()
    private override init() { super.init() }
    
    private(set) var cityName: String = "강남구"
    
    var locationManager = CLLocationManager()
    
    func setup() {
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
            
            guard let city = address.first?.locality else {
                return
            }
            guard self.cityName == city else {
                self.cityName = city
                return
            }

        }
    }
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
