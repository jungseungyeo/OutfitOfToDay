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
	case goToTop = 5
//	case weeklyChart = 4
	
	static func count() -> Int {
		return self.goToTop.rawValue + 1
	}
}

fileprivate let titleCellID = "titleCellID"
fileprivate let descriptCellID = "descriptionCellID"
fileprivate let lifeIndexCellID = "lifeIndexCellID"
fileprivate let dailyChartCellID = "dailyChartCellID"
fileprivate let weeklyCellID = "weeklyCellID"
fileprivate let gotoTopCellID = "goToTopCellID"

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
		collectionView.register(GoToTopCell.self, forCellWithReuseIdentifier: gotoTopCellID)

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

		case .goToTop:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gotoTopCellID, for: indexPath) as! GoToTopCell
			cell.goToTopButton.addTarget(self, action: #selector(didTapGoToTop), for: .touchUpInside)
			return cell
		}
		
	}
	
	@objc func didTapGoToTop() {
		self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
		
		let pageViewController = self.parent as! OOTPageViewController
		pageViewController.goToTop()
		
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cWidth = self.view.frame.width
		
		guard let item = DetailWeatherType(rawValue: indexPath.item) else {
			assertionFailure()
			return .zero
		}
		
		switch item {
		case .title:
			return CGSize(width: cWidth, height: 200)
		case .description:
			return CGSize(width: cWidth, height: 116)
		case .lifeIndex:
			return CGSize(width: cWidth, height: 172)
		case .dailyChart:
			return CGSize(width: cWidth, height: 210)
		case .weeklyChart:
			return CGSize(width: cWidth, height: 230)

		case .goToTop:
			return CGSize(width: cWidth, height: 34)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 24
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsetsMake(4, 0, 40, 0)
	}
}
