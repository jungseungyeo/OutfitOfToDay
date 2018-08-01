//
//  WeeklyWeatherCell.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 7. 31..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class WeeklyWeatherCell: DetailWeatherCell {
	
	let titleLabel = UILabel().then {
		$0.text = "주간날씨"
		$0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
	}
	
	let stackView = UIStackView().then {
		$0.axis = .horizontal
		$0.distribution = .equalSpacing
	}
	
	override func setupView() {
		super.setupView()
		addSubViews(titleLabel, stackView)
		
		titleLabel.snp.remakeConstraints { make -> Void in
			make.top.equalTo(self.readableContentGuide).offset(16)
			make.centerX.equalTo(self)
		}
		
		stackView.snp.remakeConstraints { make -> Void in
			make.top.equalTo(titleLabel.snp.bottom).offset(14)
			make.left.right.equalTo(readableContentGuide).inset(10)
			make.bottom.equalTo(readableContentGuide)
		}
		
		
		for i in 0..<13 {
			if i % 2 == 0 {
				let dView = SummaryOneDayView()
				stackView.addArrangedSubview(dView)
			} else {
				let lineView = VerticalLineView()
				stackView.addArrangedSubview(lineView)
				
			}
		}
	}
}

class SummaryOneDayView: UIView {
	
	// MARK: Views
	let dayLabel = UILabel().then {
		$0.text = "ㅇ요일"
		$0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
		$0.textAlignment = .center
	}
	
	let iconImgView = UIImageView().then {
		$0.backgroundColor = .red
		$0.contentMode = .scaleAspectFit
	}
	
	let highTempLabel = UILabel().then {
		$0.textColor = .red
		$0.text = "-33"
		$0.textAlignment = .center
		$0.font = UIFont.systemFont(ofSize: 12, weight: .light)
	}
	
	let highTempPointView = UIView().then {
		$0.layer.cornerRadius = 4
		$0.backgroundColor = .red
	}
	
	let lowTempLabel = UILabel().then {
		$0.textColor = .blue
		$0.text = "-55"
		$0.textAlignment = .center
		$0.font = UIFont.systemFont(ofSize: 12, weight: .light)

	}
	
	let lowTempPointView = UIView().then {
		$0.layer.cornerRadius = 4
		$0.backgroundColor = .blue
	}
	
	
	private func setupView() {
		addSubViews(dayLabel, iconImgView, highTempLabel, highTempPointView, lowTempPointView, lowTempLabel)
		
		dayLabel.snp.remakeConstraints { make -> Void in
			make.top.left.right.equalTo(self)
		}
		
		iconImgView.snp.remakeConstraints { make -> Void in
			make.top.equalTo(dayLabel.snp.bottom).offset(12)
			make.size.equalTo(24)
			make.centerX.equalTo(self)
		}
		
		highTempPointView.snp.remakeConstraints { make -> Void in
			make.centerX.equalTo(self)
			make.top.equalTo(iconImgView.snp.bottom).offset(40)
			make.size.equalTo(8)
		}

		highTempLabel.snp.remakeConstraints { make -> Void in
			make.centerX.equalTo(self)
			make.bottom.equalTo(highTempPointView.snp.top).offset(-8)
		}
		
		lowTempPointView.snp.remakeConstraints { make -> Void in
			make.centerX.equalTo(self)
			make.top.equalTo(highTempPointView.snp.bottom).offset(24)
			make.size.equalTo(8)
		}
		
		lowTempLabel.snp.remakeConstraints { make -> Void in
			make.centerX.equalTo(self)
			make.top.equalTo(lowTempPointView.snp.bottom).offset(8)
		}


	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
