//
//  CommandManager.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 8. 4..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

class CommandManager {
    
    private let commands: [String] = [kSTRING_COMMEND_0, kSTRING_COMMEND_1, kSTRING_COMMEND_3,kSTRING_COMMEND_4,kSTRING_COMMEND_8,kSTRING_COMMEND_5,kSTRING_COMMEND_8, kSTRING_COMMEND_11, kSTRING_COMMEND_12, kSTRING_COMMEND_9]
    
    public  var weatherIconModel: WeatherIconModel? {
        didSet {
            guard let weatherIconModel = weatherIconModel else {
                return
            }
            
            commandText = commands[weatherIconModel.iconWeather]
            commandText = commands[1]
        }
    }
    
    public var commandText: String = ""
}
