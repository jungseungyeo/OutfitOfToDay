//
//  DescriptionWeatherCell.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 7. 31..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import Then
import SnapKit

class DescriptionWeatherCell: DetailWeatherCell {
	
	let stackView = UIStackView().then {
		$0.axis = .horizontal
		$0.distribution = .equalSpacing
	}
	
	var descriptionViews: [DescriptionView] = [
		DescriptionView(weather: nil, type: .dust),
		DescriptionView(weather: nil, type: .wind),
		DescriptionView(weather: nil, type: .humidity),
		DescriptionView(weather: nil, type: .rain)
	]
	override func didSetWeather() {
//		for i in 0..<4 {
//			descriptionViews[i].weather = weather
//		}
		descriptionViews.forEach { $0.weather = weather }
	}
	override func setupView() {
		super.setupView()
		
		addSubViews(stackView)
		
		stackView.snp.remakeConstraints { make -> Void in
			make.top.bottom.equalTo(readableContentGuide)
			make.centerX.equalTo(self)
			make.width.equalTo(288)
		}

		descriptionViews.forEach { (dView) in
			stackView.addArrangedSubview(dView)
		}
		
		
	}
}

