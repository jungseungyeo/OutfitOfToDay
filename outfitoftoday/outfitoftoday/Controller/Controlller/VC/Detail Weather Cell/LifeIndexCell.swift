//
//  LifeIndexCell.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 7. 31..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class LifeIndexCell: DetailWeatherCell {
	
	let titleLabel = UILabel().then {
		$0.text = "생활지수"
		$0.font = .spoqaFont(ofSize: 16, weight: .bold)
		$0.textColor = .brightBlack
	}
	
	let stackView = UIStackView().then {
		$0.axis = .horizontal
		$0.distribution = .equalSpacing
	}
	
	var descriptionViews: [DescriptionView] = [
		DescriptionView(weather: nil, type: .temp),
		DescriptionView(weather: nil, type: .uv),
		DescriptionView(weather: nil, type: .discomfort)
	]
	
	override func setupView() {
		super.setupView()
		addSubViews(titleLabel, stackView)
		
		titleLabel.snp.remakeConstraints { make -> Void in
			make.top.equalTo(self.readableContentGuide).offset(16)
			make.centerX.equalTo(self)
		}
		
		stackView.snp.remakeConstraints { make -> Void in
			make.top.equalTo(titleLabel.snp.bottom).offset(20)
			make.left.right.equalTo(readableContentGuide).inset(32)
			make.bottom.equalTo(readableContentGuide)
		}


		for i in 0..<5 {
			if i == 1 || i == 3 {
				let lineView = VerticalLineView()
				stackView.addArrangedSubview(lineView)
			} else {
				let dView = descriptionViews[Int(i/2)]
				stackView.addArrangedSubview(dView)
			}
		}
	}
}

class VerticalLineView: UIView {
	private func setupView() {
		self.backgroundColor = .groupTableViewBackground
			self.snp.remakeConstraints { make -> Void in
//				make.size.equalTo(CGSize(width: 1, height: 99))
				make.width.equalTo(1)
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
