//
//  OOTDustData.swift
//  outfitoftoday
//
<<<<<<< HEAD
//  Created by Jung seoung Yeo on 2018. 6. 26..
=======
//  Created by 이광용 on 2018. 6. 23..
>>>>>>> c10ed2f78c8636f795f6189c52129e9c3eb6f42a
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
