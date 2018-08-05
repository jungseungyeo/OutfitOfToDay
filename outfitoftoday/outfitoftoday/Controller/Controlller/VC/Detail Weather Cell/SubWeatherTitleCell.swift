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
	
	override func didSetWeather() {
		super.didSetWeather()
		
		timeLabel.text = weather?.currentTime
		locationLabel.text = weather?.currentLocation
		
		tempLabel.text = "\(weather?.currentTemp ?? "") ̊"
        
		
        tempRangeLabel.attributedText = tempRangeString()
        
        iconImgView.image = WeatherImage.imgs[weather?.weatherIcon ?? 0]
        iconImgView.image = WeatherImage.imgs[1]
	}
	
	private func tempRangeString() -> NSMutableAttributedString {
		let result = NSMutableAttributedString(string: "")
		
		guard let minTemp = weather?.minTemp else { return result }
		let minString = NSMutableAttributedString(string: minTemp + " ̊", attributes: [
			NSAttributedStringKey.font: tempRangeLabel.font,
			NSAttributedStringKey.foregroundColor: UIColor.skyBlue])
		
		guard let maxTemp = weather?.maxTemp else { return result }
		let maxString = NSMutableAttributedString(string: maxTemp + " ̊", attributes: [
			NSAttributedStringKey.font: tempRangeLabel.font,
			NSAttributedStringKey.foregroundColor: UIColor.rosyPink])
		
		let slashString = NSMutableAttributedString(string: " / ", attributes: [
			NSAttributedStringKey.font: tempRangeLabel.font,
			NSAttributedStringKey.foregroundColor: UIColor.warmGrey])
		
		result.append(maxString)
		result.append(slashString)
		result.append(minString)
		
		return result
	}
	
	override func setupView() {
		super.setupView()
		
		addSubViews(iconImgView, locationLabel, timeLabel, tempLabel, tempRangeLabel)
		
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
		
		tempLabel.snp.remakeConstraints { make -> Void in
            make.bottom.equalTo(tempRangeLabel.snp.top).offset(8)
			make.left.equalTo(locationLabel)
		}
	}
}
