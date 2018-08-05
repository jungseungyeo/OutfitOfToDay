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
		$0.textColor = .brightBlack
		$0.font = .spoqaFont(ofSize: 16, weight: .bold)
	}
	
	let chartView = WeeklyChartView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		getData()
	}
	
	private func getData() {
		OOTWeatherService.shared.get(urlPath: .week, handler: { (json) in				let decoder = JSONDecoder()
			
			do {
				let rawData = try json.rawData()
				let data = try decoder.decode([OneDayData].self, from: rawData)
				
				print(data)
				self.chartView.dataEntries = data
				
			} catch let err {
				debugPrint(err)
			}		}) { (code, err) in
			print("--- err Load Weekly Data:", code, err.debugDescription)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
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
		getData()
	}
}
