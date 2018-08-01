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
	
	let chartView = WeeklyChartView()
	
	override func setupView() {
		super.setupView()
		addSubViews(titleLabel, chartView)
		
		titleLabel.snp.remakeConstraints { make -> Void in
			make.top.equalTo(self.readableContentGuide).offset(16)
			make.centerX.equalTo(self)
		}
		
		chartView.snp.remakeConstraints { make -> Void in
			make.top.equalTo(titleLabel.snp.bottom).offset(18)
			make.left.right.equalTo(readableContentGuide).inset(10)
			make.bottom.equalTo(readableContentGuide)
		}
		setDummyData()
		
	}
	
	func setDummyData() {
		let dataEntries = generateRandomEntries()
		
		chartView.dataEntries = dataEntries
	}
	
	private func generateRandomEntries() -> [TempDataEntry] {
//		var result: [TempDataEntry] = []
//		for i in 0..<7 {
//			let value = Int(arc4random() % 10)
//			result.append(TempDataEntry(max: value*value, min: value, label: String(value)))
//		}
		
		/*
{"dailyTemperatures":
		[{"maximum":0,"minimum":0},
		{"maximum":39,"minimum":29},
		{"maximum":39,"minimum":29},
		{"maximum":38,"minimum":28},
		{"maximum":37,"minimum":27},
		{"maximum":36,"minimum":26},
		{"maximum":35,"minimum":26}]}*/
		let result: [TempDataEntry] = [
		TempDataEntry(max: 38, min: 27, label: ""),
		TempDataEntry(max: 39, min: 29, label: ""),
		TempDataEntry(max: 39, min: 29, label: ""),
		TempDataEntry(max: 38, min: 28, label: ""),
		TempDataEntry(max: 37, min: 27, label: ""),
		TempDataEntry(max: 36, min: 26, label: ""),
		TempDataEntry(max: 35, min: 26, label: "")
		]
		
		return result
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
