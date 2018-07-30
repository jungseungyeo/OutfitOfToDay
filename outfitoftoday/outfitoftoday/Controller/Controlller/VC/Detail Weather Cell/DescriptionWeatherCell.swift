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
		$0.backgroundColor = .blue
		$0.axis = .horizontal
		$0.distribution = .fill
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.spacing = 16
	}
	
	override func setupView() {
		super.setupView()
		
		addSubViews(stackView)
		
		stackView.snp.remakeConstraints { make -> Void in
			make.edges.equalTo(readableContentGuide)
		}

		
		for _ in 0..<4 {
			let dView = DescriptionView()
			stackView.addArrangedSubview(dView)
		}
	}
}

class DescriptionView: UIView {
	
	let iconImgView = UIImageView().then {
		$0.image = #imageLiteral(resourceName: "dust")
		$0.contentMode = .scaleAspectFit
	}
	
	let typeLabel = UILabel().then {
		$0.text = "미세먼지"
		$0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
	}
	
	let valueLabel = UILabel().then {
		$0.text = "좋음"
		$0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
			make.centerX.top.equalTo(self)
			make.size.equalTo(48)
		}
		
		typeLabel.snp.remakeConstraints { make -> Void in
			make.top.equalTo(iconImgView.snp.bottom).offset(8)
			make.centerX.equalTo(self)
		}
		
		valueLabel.snp.remakeConstraints { make -> Void in
			make.top.equalTo(typeLabel.snp.bottom)
			make.centerX.equalTo(self)
		}

		self.translatesAutoresizingMaskIntoConstraints = false
		self.widthAnchor.constraint(equalToConstant: 60).isActive = true
		backgroundColor = .brown
	}
}
