//
//  OOTTemperatureData.swift
//  outfitoftoday
//
//  Created by 이광용 on 2018. 7. 10..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import ObjectMapper

class OOTTemperatureData: Mappable {

    var current: String?
    var maximum: String?
    var minimum: String?
    
    init() { }
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        current   <-  map["current"]
        maximum   <-  map["maximum"]
        minimum   <-  map["minimum"]
    }
}
