//
//  Strings.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

enum OOTD {
    enum NETWORK: CustomStringConvertible {
        case URLPATH
        
        var description: String {
            switch self {
                case .URLPATH:
                    return "http://www.mocky.io/v2/5b21008a3000004e005c72ad"
            }
        }
    }
}
