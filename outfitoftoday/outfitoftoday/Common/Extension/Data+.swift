//
//  Data+.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 27..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//
import Foundation

extension Data {
    internal func convertString() -> String {
        return String(data: self, encoding: .utf8)!
    }
}
