//
//  Obserber.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

protocol LocationObserver {
    func updateLocation(_ notyValue: String)
}

protocol TimeObserver {
    func updateTime(_ notyValue: String)
}
