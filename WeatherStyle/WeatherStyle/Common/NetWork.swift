//
//  NetWork.swift
//  WeatherStyle
//
//  Created by Jung seoung Yeo on 2018. 6. 13..
//  Copyright © 2018년 Clover. All rights reserved.
//

import Foundation
import Alamofire

class Network{
    
    // Test function
    static func get(_ urlPath: String, parameters: [String: Any] = [:]) {
        Alamofire.request(urlPath).response { response in // method defaults to `.get`
            
            print("resposen weahterstyle : \(response)")
        }
    }

}
