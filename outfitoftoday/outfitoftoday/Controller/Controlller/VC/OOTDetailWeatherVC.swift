//
//  OOTDetailWeatherVC.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit

fileprivate enum DetailWeatherType: Int {
	case title = 0
	case description = 1
	case lifeIndex = 2
	case dailyChart = 3
	case weeklyChart = 4
//	case weeklyChart = 4
	
	static func count() -> Int {
		return self.weeklyChart.rawValue + 1
	}
}

fileprivate let titleCellID = "titleCellID"
fileprivate let descriptCellID = "descriptionCellID"
fileprivate let lifeIndexCellID = "lifeIndexCellID"
fileprivate let dailyChartCellID = "dailyChartCellID"
fileprivate let weeklyCellID = "weeklyCellID"

class OOTDetailWeatherVC: UIViewController {
	
	let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .clear
		return cv
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupCollectionView()
	}
	
	private func setupCollectionView() {
		view.addSubview(collectionView)
		
		collectionView.snp.remakeConstraints { make -> Void in
			make.edges.equalTo(self.view)
		}

		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(SubWeatherTitleCell.self, forCellWithReuseIdentifier: titleCellID)
		collectionView.register(DescriptionWeatherCell.self, forCellWithReuseIdentifier: descriptCellID)
		collectionView.register(LifeIndexCell.self, forCellWithReuseIdentifier: lifeIndexCellID)
		collectionView.register(DailyWeatherCell.self, forCellWithReuseIdentifier: dailyChartCellID)
		collectionView.register(WeeklyWeatherCell.self, forCellWithReuseIdentifier: weeklyCellID)
	}
}

extension OOTDetailWeatherVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		return DetailWeatherType.count()
		return DetailWeatherType.count()
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let item = DetailWeatherType(rawValue: indexPath.item) else {
			assertionFailure()
			return UICollectionViewCell()
		}
		
		switch item {
		case .title:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleCellID, for: indexPath)
			
			return cell
			
		case .description:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptCellID, for: indexPath)
			
			return cell
		case .lifeIndex:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lifeIndexCellID, for: indexPath)
			
			return cell
		case .dailyChart:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dailyChartCellID, for: indexPath)
			
			return cell
		case .weeklyChart:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: weeklyCellID, for: indexPath)
			
			return cell

		}
		
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cWidth = self.view.frame.width
		
		guard let item = DetailWeatherType(rawValue: indexPath.item) else {
			assertionFailure()
			return .zero
		}
		
		switch item {
		case .title:
			return CGSize(width: cWidth, height: 184)
		case .description:
			return CGSize(width: cWidth, height: 122)
		case .lifeIndex:
			return CGSize(width: cWidth, height: 210)
		case .dailyChart:
			return CGSize(width: cWidth, height: 210)
		case .weeklyChart:
			return CGSize(width: cWidth, height: 270)

		}
	}
}
