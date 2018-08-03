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
	
	override func setupView() {
		super.setupView()
		
		addSubViews(stackView)
		
		stackView.snp.remakeConstraints { make -> Void in
			make.top.bottom.equalTo(readableContentGuide)
			make.centerX.equalTo(self)
			make.width.equalTo(288)
		}

		
		let types: [DescriptionType] = [.dust, .wind, .humidity, .rain]
		for i in 0..<4 {
			let dView = DescriptionView()
			dView.type = types[i]
			stackView.addArrangedSubview(dView)
		}
	}
}

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
	
	var type: DescriptionType? {
		didSet {
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
	}
	
	let iconImgView = UIImageView().then {
		$0.image = #imageLiteral(resourceName: "iconDust")
		$0.contentMode = .scaleAspectFit
	}
	
	let typeLabel = UILabel().then {
		$0.text = "미세먼지"
		$0.font = .spoqaFont(ofSize: 14, weight: .regular)
	}
	
	let valueLabel = UILabel().then {
		$0.text = "좋음"
		$0.font = .spoqaFont(ofSize: 14, weight: .regular)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
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
		}

		self.snp.remakeConstraints { make -> Void in
			make.width.equalTo(60)
		}

	}
}
