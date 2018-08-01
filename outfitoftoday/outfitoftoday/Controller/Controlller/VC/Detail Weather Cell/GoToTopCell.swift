//
//  GoToTopCell.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 8. 1..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class GoToTopCell: DetailWeatherCell {
	
	let goToTopButton = UIButton().then {
		$0.setImage(#imageLiteral(resourceName: "iconButtonTop"), for: .normal)
	}
	
	override func setupView() {
		addSubview(goToTopButton)
		
		goToTopButton.snp.remakeConstraints { make -> Void in
			make.edges.equalTo(self)
		}

	}
}
