//
//  SubWeatherTitleCell.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class SubWeatherTitleCell: DetailWeatherCell {
	
	
	let locationLabel = UILabel().then {
		$0.text = "ㅅㅇㅅ ㄱㄴㄱ"
		$0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
	}
	
	let timeLabel = UILabel().then {
		$0.text = "오전 00시 00분"
		$0.font = UIFont.systemFont(ofSize: 12, weight: .light)
	}
	
	let tempLabel = UILabel().then {
		$0.text = "-00 ̊"
		$0.font = UIFont.systemFont(ofSize: 72, weight: .regular)
		$0.adjustsFontSizeToFitWidth = true
	}
	
	override func setupView() {
		super.setupView()
		
		addSubViews(locationLabel, timeLabel, tempLabel)
		
	}
}
