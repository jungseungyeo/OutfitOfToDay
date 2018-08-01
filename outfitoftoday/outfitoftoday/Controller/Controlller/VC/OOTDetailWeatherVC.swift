//
//  OOTDetailWeatherVC.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit

enum DetailWeatherType: Int {
	case title = 0
	case description = 1
	case lifeIndex = 2
	case dailyChart = 3
	case weeklyChart = 4
}

fileprivate let cellID = "detailWeatherCellID"
class OOTDetailWeatherVC: UIViewController {
	
	let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//		cv.backgroundColor = .vividPurple
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
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
	}
}

extension OOTDetailWeatherVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
		
		cell.backgroundColor = .green
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cWidth = self.view.frame.width
		
		return CGSize(width: cWidth, height: 300)
	}
}
