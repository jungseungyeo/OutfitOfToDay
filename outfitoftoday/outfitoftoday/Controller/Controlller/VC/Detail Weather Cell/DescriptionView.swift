//
//  DescriptionView.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 8. 3..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit


enum DescriptionType {
	
	case dust
	case wind
	case humidity
	case rain
	
	case temp
	case uv
	case discomfort
}

class DescriptionView: UIView {
	var weather: Weather? {
		didSet {
			valueLabel.text = weather?.dust.value?.description
		}
	}
	var type: DescriptionType? {
		didSet {
			didSetType()
		}
	}
	
	private func didSetType() {
		guard let type = type else { return }
		switch type {
		case .dust:
			iconImgView.image = #imageLiteral(resourceName: "iconDust")
			typeLabel.text = "미세먼지"
		case .wind:
			iconImgView.image = #imageLiteral(resourceName: "iconWind")
			typeLabel.text = "풍량"
		case .humidity:
			iconImgView.image = #imageLiteral(resourceName: "iconHumidity")
			typeLabel.text = "습도"
		case .rain:
			iconImgView.image = #imageLiteral(resourceName: "iconRain")
			typeLabel.text = "강수확률"
		case .temp:
			iconImgView.image = #imageLiteral(resourceName: "iconTemp")
			typeLabel.text = "체감온도"
		case .uv:
			iconImgView.image = #imageLiteral(resourceName: "iconUV")
			typeLabel.text = "자외선"
		case .discomfort:
			iconImgView.image = #imageLiteral(resourceName: "iconDiscomfort")
			typeLabel.text = "불쾌지수"
		}
	}
	
	let iconImgView = UIImageView().then {
		$0.contentMode = .scaleAspectFit
	}
	
	let typeLabel = UILabel().then {
		$0.font = .spoqaFont(ofSize: 14, weight: .regular)
		$0.textColor = .warmGrey
	}
	
	let valueLabel = UILabel().then {
		$0.textAlignment = .center
		$0.font = .spoqaFont(ofSize: 14, weight: .regular)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
	}
	
	convenience init(weather: Weather?, type: DescriptionType) {
		self.init(frame: .zero)
		
		
		self.weather = weather
		self.type = type
		
		didSetType()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupView() {
		addSubViews(iconImgView, typeLabel, valueLabel)
		
		iconImgView.snp.remakeConstraints { make -> Void in
			make.top.equalTo(self)
			make.centerX.equalTo(self)
			make.size.equalTo(48)
		}
		
		typeLabel.snp.remakeConstraints { make -> Void in
			make.centerX.equalTo(self)
			make.bottom.equalTo(valueLabel.snp.top).offset(-4)
		}
		
		valueLabel.snp.remakeConstraints { make -> Void in
			make.centerX.equalTo(self)
			make.bottom.equalTo(self)
			make.width.equalTo(self)
			make.height.equalTo(20)
		}
		
		self.snp.remakeConstraints { make -> Void in
			make.width.equalTo(60)
		}
	}
	
	func indexToValue(_ index: Int) -> String {
		guard let type = type else { return "" }
		var valueList = ["", "", ""]
		switch type {
		case .dust:
			valueList = ["나쁨", "보통", "좋음"]
		case .wind:
			valueList = ["강함", "보통", "약함"]
		case .humidity:
			valueList = ["높음", "보통", "낮음"]
		case .rain:
			valueList = ["높음", "보통", "낮음"]
		case .temp:
			valueList = ["높음", "보통", "낮음"]
		case .uv:
			valueList = ["나쁨", "보통", "좋음"]
		case .discomfort:
			valueList = ["나쁨", "보통", "좋음"]
		}
		return valueList[index]
	}
}
