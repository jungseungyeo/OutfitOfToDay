//
//  DropAnimationView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class DropAnimationView: BaseView {
    
    internal var backgroundsModel: BackgroundsModel? {
        didSet {
            guard let backgroundModel = backgroundsModel else {
                return
            }
            
            guard let dropWeatherIMG = DropAnimationManager.weatherType.init(rawValue: backgroundModel.precipitation)?.img else {
                return
            }
            dropWeather.image = dropWeatherIMG
        }
    }
    
    lazy private var dropWeather = UIImageView().then {
        $0.image = UIImage(named: "rain")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setup() {
        super.setup()
    }
    
    private func initUI() {
        addSubViews(dropWeather)
        
        dropWeather.snp.makeConstraints { make -> Void in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
}
