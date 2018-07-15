//
//  OOTBackgroundData.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 15..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//
import ObjectMapper

class OOTBackgroundData: Mappable {
    
    var precipitation: String?
    var skyCoverage: Int?
    var weather: String?
    var windSpeed: Int?
    
    init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.precipitation <- map["precipitation"]
        self.skyCoverage <- map["skyCoverage"]
        self.weather <- map["weather"]
        self.windSpeed <- map["windSpeed"]
    }
}
