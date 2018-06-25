//
//  OOTDustData.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 26..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import ObjectMapper

class OOTDustData: Mappable {
    
    var pm10Value: Int?
    var pm25Value: Int?
    var pm10Status: String?
    var pm25Status: String?
    var message: String?
    
    init() { }
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        pm10Value   <-  map["pm10Value"]
        pm25Value   <-  map["pm25Value"]
        pm10Status  <-  map["pm10Status"]
        pm25Status  <-  map["pm25Status"]
        message     <-  map["message"]
    }
}
