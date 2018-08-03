//
//  DailyWeatherCell.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 7. 31..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class DailyWeatherCell: DetailWeatherCell {
	
	let titleLabel = UILabel().then {
		$0.text = "상세날씨"
		$0.font = .spoqaFont(ofSize: 16, weight: .bold)
	}
	
	let lineChartView = LineChart()
	
	override func setupView() {
		super.setupView()
		
		addSubViews(titleLabel, lineChartView)
		titleLabel.snp.remakeConstraints { make -> Void in
			make.top.equalTo(self.readableContentGuide).offset(16)
			make.centerX.equalTo(self)
		}
		
		lineChartView.snp.remakeConstraints { make -> Void in
			make.top.equalTo(titleLabel.snp.bottom).offset(18)
			make.left.right.bottom.equalTo(self)
		}

		setDummyData()
		
	}
	
	func setDummyData() {
		let dataEntries = generateRandomEntries()

		lineChartView.dataEntries = dataEntries
		lineChartView.isCurved = false
	}
	
	private func generateRandomEntries() -> [PointEntry] {
		var result: [PointEntry] = []
		for i in 0..<100 {
			let value = Int(arc4random() % 10)
			
			//            let formatter = DateFormatter()
			//            formatter.dateFormat = "d MMM"
			//            var date = Date()
			//            date.addTimeInterval(TimeInterval(24*60*60*i))
			
			result.append(PointEntry(value: value, label: String(value)))
		}
		return result
	}
}
