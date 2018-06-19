//
//  Network.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 13..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import Alamofire
import SwiftyJSON

class NetWork {
    static func get(_ urlPath: String, parameters: [String: Any] = [:]) {
        Alamofire.request(urlPath).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
            }
        }
    }
    
    static func requestGetAPI(_ urlPath: String, parameters: [String: Any] = [:]) {
        Alamofire.request(urlPath, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: ["content-Type":"application/json"]).responseJSON{ (resposeData) -> Void in
            if ((resposeData.result.value) != nil) {
                let swiftJsonVar = JSON(resposeData.result.value!)
                
                print(swiftJsonVar)
            }
            
        }
    }
}
