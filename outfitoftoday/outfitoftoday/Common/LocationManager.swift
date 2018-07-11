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
    
    var locationManager = CLLocationManager()
    
    func setup() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    var updateLocationSuccessClosure: ((String, String) -> ())?
    
    func convertToAddressWith(coordinate: CLLocation) {
        let geoCoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        geoCoder.reverseGeocodeLocation(coordinate, preferredLocale: locale) { (placemarks, error) in
            if let address: [CLPlacemark] = placemarks {
                if let locality = address.first?.locality, let subLocality = address.first?.subLocality {
                    self.updateLocationSuccessClosure?(locality, subLocality)
                }
            }
        }
        locationManager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coor = manager.location?.coordinate{
            print("latitude" + String(coor.latitude) + "/ longitude" + String(coor.longitude))
            convertToAddressWith(coordinate: manager.location!)
        }
    }
}
