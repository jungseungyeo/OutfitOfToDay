//
//  SubWeatherTitleCell.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class SubWeatherTitleCell: DetailWeatherCell {
	
	let iconImgView = UIImageView().then {
		$0.image = #imageLiteral(resourceName: "sunnyMain")
		$0.contentMode = .scaleAspectFit
	}
	
	let locationLabel = UILabel().then {
		$0.text = "ㅅㅇㅅ ㄱㄴㄱ"
		$0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
	}
	
	let timeLabel = UILabel().then {
		$0.text = "오전 00시 00분"
		$0.font = UIFont.systemFont(ofSize: 14, weight: .light)
	}
	
	let tempLabel = UILabel().then {
		$0.text = "-00 ̊"
		$0.font = UIFont.systemFont(ofSize: 72, weight: .regular)
		$0.adjustsFontSizeToFitWidth = true
	}
	
	let tempRangeLabel = UILabel().then {
		$0.text = "-00 ̊ / -00 ̊"
		$0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
		$0.adjustsFontSizeToFitWidth = true
		$0.textAlignment = .center
	}
	
	override func setupView() {
		super.setupView()
		
		addSubViews(iconImgView, locationLabel, timeLabel, tempLabel, tempRangeLabel)
		
		iconImgView.snp.remakeConstraints { make -> Void in
			make.top.right.bottom.equalTo(self.readableContentGuide).inset(20)
			make.width.equalTo(iconImgView.snp.height)
		}

		locationLabel.snp.remakeConstraints { make -> Void in
			make.top.equalTo(self.readableContentGuide).offset(16)
			make.left.equalTo(self.readableContentGuide).offset(20)
		}
		
		timeLabel.snp.remakeConstraints { make -> Void in
			make.top.equalTo(locationLabel.snp.bottom).offset(8)
			make.left.equalTo(locationLabel)
		}
		
		tempRangeLabel.snp.remakeConstraints { make -> Void in
			make.bottom.equalTo(self.readableContentGuide)
			make.left.equalTo(locationLabel).offset(14)
			
		}
		
		tempLabel.snp.remakeConstraints { make -> Void in
			make.bottom.equalTo(tempRangeLabel.snp.top).offset(-4)
			make.left.equalTo(locationLabel)
		}
	}
}
