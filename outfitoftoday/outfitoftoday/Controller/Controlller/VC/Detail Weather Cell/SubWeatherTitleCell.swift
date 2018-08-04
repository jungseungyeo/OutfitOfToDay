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
		$0.font = .spoqaFont(ofSize: 20, weight: .bold)
	}
	
	let timeLabel = UILabel().then {
		$0.text = "오전 00시 00분"
		$0.font = .spoqaFont(ofSize: 14, weight: .light)
	}
	
	let tempLabel = UILabel().then {
		$0.text = "-00 ̊"
		$0.font = .spoqaFont(ofSize: 72, weight: .regular)
		$0.adjustsFontSizeToFitWidth = true
	}
    
	let tempRangeLabel = UILabel().then {
		$0.text = "-00 ̊ / -00 ̊"
		$0.font = .spoqaFont(ofSize: 16, weight: .bold)
		$0.adjustsFontSizeToFitWidth = true
		$0.textAlignment = .center
	}
    
    private var tempHightText = UILabel().then {
        $0.text = "-00 ̊"
        $0.font = .spoqaFont(ofSize: 16, weight: .bold)
        $0.textColor = UIColor(red: 255/255, green: 92/255, blue: 92/255, alpha: 1.0)
        $0.adjustsFontSizeToFitWidth = true
        $0.textAlignment = .center
    }
    
    private var divisionText = UILabel().then {
        $0.text = "/"
        $0.font = .spoqaFont(ofSize: 16, weight: .bold)
        $0.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        $0.adjustsFontSizeToFitWidth = true
        $0.textAlignment = .center
    }
    
    private var tempLowText = UILabel().then {
        $0.text = "-00 ̊"
        $0.font = .spoqaFont(ofSize: 16, weight: .bold)
        $0.textColor = UIColor(red: 92/255, green: 173/255, blue: 255/255, alpha: 1.0)
        $0.adjustsFontSizeToFitWidth = true
        $0.textAlignment = .center
    }
	
	override func didSetWeather() {
		super.didSetWeather()
		
		timeLabel.text = weather?.currentTime
		locationLabel.text = weather?.currentLocation
		
		tempLabel.text = "\(weather?.currentTemp ?? "") ̊"
        
        tempHightText.text = "\(weather?.maxTemp ?? "") ̊"
        tempLowText.text = "\(weather?.minTemp ?? "") ̊"
        
        tempRangeLabel.text = ""
        
        iconImgView.image = WeatherImage.imgs[weather?.weatherIcon ?? 0]
        iconImgView.image = WeatherImage.imgs[1]
	}
	
	override func setupView() {
		super.setupView()
		
		addSubViews(iconImgView, locationLabel, timeLabel, tempLabel, tempRangeLabel
                ,tempHightText, tempLowText, divisionText
        )
		
		iconImgView.snp.remakeConstraints { make -> Void in
			make.top.equalTo(self.readableContentGuide).inset(49)
			make.right.equalTo(self.readableContentGuide).inset(25)
//            make.width.equalTo(iconImgView.snp.height)
//            make.bottom.equalTo(self.readableContentGuide).inset(24)
            make.size.equalTo(160)
		}

		locationLabel.snp.remakeConstraints { make -> Void in
			make.top.equalTo(self.readableContentGuide).offset(28)
			make.left.equalTo(self.readableContentGuide).offset(20)
		}
		
		timeLabel.snp.remakeConstraints { make -> Void in
			make.top.equalTo(locationLabel.snp.bottom).offset(4)
			make.left.equalTo(locationLabel)
		}
		
        tempRangeLabel.snp.remakeConstraints { make -> Void in
            make.bottom.equalTo(self.readableContentGuide)
            make.left.equalTo(locationLabel).offset(14)
        }
        
        tempHightText.snp.makeConstraints { make -> Void in
            make.bottom.equalTo(self.readableContentGuide)
            make.left.equalTo(locationLabel).offset(14)
        }
        
        tempLowText.snp.makeConstraints { make -> Void in
            make.bottom.equalTo(self.readableContentGuide)
            make.left.equalTo(tempHightText.snp.right).offset(11)
        }
        
        divisionText.snp.makeConstraints { make -> Void in
            make.bottom.equalTo(self.readableContentGuide)
            make.left.equalTo(tempHightText.snp.right).offset(0)
        }
		
		tempLabel.snp.remakeConstraints { make -> Void in
//            make.bottom.equalTo(tempRangeLabel.snp.top).offset(8)
            make.bottom.equalTo(tempHightText.snp.top).offset(8)
			make.left.equalTo(locationLabel)
		}
	}
}
