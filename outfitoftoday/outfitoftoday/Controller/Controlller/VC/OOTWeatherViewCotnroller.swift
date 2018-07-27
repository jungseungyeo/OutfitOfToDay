//
//  FirstViewController.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 26..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SnapKit

class OOTWeatherViewCotnroller: BaseVC {
    
    /// model
    
    private var backgroundModel: BackgroundsModel?
    private var temperaturesModel: TemperaturesModel?
    
    // 호출시기 2
    override func initAPI() {
        super.initAPI()
        temperrauresAPI()
        backgroundAPI()
    }
    
    // 호출시기 3
    override func setup() {
        super.setup()
    }
    
    // 호출시기 1
    override func viewDidLoad() {
        super.viewDidLoad()
        initAPI()
    }
}

// api
extension OOTWeatherViewCotnroller {
    private func backgroundAPI() {
        let indicator: NVActivityIndicatorView = NVIndicatiorView.instance(self)
        indicator.startAnimating()
        
        OOTWeatherService.shared.get(urlPath: .backgrounds, handler: {(json) in
            indicator.stopAnimating()
            self.backgroundModel = BackgroundsModel(
                skyCoverage: json["skyCoverage"].intValue
                ,precipitation: json["precipitation"].stringValue
                ,weather: json["weather"].stringValue
                ,windSpeed: json["windSpeed"].intValue
            )
        }, errorHandler: { (statusCode, errorMessage) in
            indicator.stopAnimating()
            let errorAlert = UIAlertController.alert("code: \(statusCode)",errorMessage: errorMessage)
            errorAlert.add("ok", handler: { (handling) in
                print(handling)
            }).show(self)
        })
    }
    
    private func temperrauresAPI() {
        let indicator: NVActivityIndicatorView = NVIndicatiorView.instance(self)
        indicator.startAnimating()
        
        OOTWeatherService.shared.get(urlPath: .temperatures, handler: {(json) in
            indicator.stopAnimating()
            self.temperaturesModel = TemperaturesModel(
                current: json["current"].stringValue
                ,maximum: json["maximum"].stringValue
                ,minimum: json["minimum"].stringValue
                ,today: json["today"].arrayValue.map({ $0.intValue})
                ,tomorrow: json["tomorrow"].arrayValue.map({ $0.intValue}))
        }, errorHandler: { (statusCode, errorMessage) in
            indicator.stopAnimating()
            let errorAlert = UIAlertController.alert("code: \(statusCode)",errorMessage: errorMessage)
            errorAlert.add("ok", handler: { (handling) in
                print(handling)
            }).show(self)
        })
    }
}
