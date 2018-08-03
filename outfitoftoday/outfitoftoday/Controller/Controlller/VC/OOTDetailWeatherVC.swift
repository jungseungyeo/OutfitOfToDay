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

struct Weather {
	var currentTime: String?
	var currentLocation: String?
	
	var currentTemp: String?
	var minTemp: String?
	var maxTemp: String?
	
	
	// MARK: dusts
	var dust = Dust()
	struct Dust {
		var pm10: (Int, String)?
		var pm25: (Int, String)?
		var message: String?
		init() {
			
		}
	}
	
	init() {
		
	}
}

class OOTDetailWeatherVC: UIViewController {
	
	let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .clear
		return cv
	}()
	
	var weather: Weather!
	
	// singleTon
	private let locationManager = LocationManager.shared
	private let timeManager = TimeManager.shared
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		setupObserver()
		setupWeather()
		setupCollectionView()
	}
	
	private func setupObserver() {
		locationManager.attachObserver(self)
		timeManager.attachObserver(self)
	}
	private func setupWeather() {
//		weather = Weather(currentTime: "", currentLocation: locationManager.getCityName()
		weather = Weather()
		weather.currentLocation = locationManager.getCityName()
		getTodayTemperature()
		getDusts()
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
		
		var cell: DetailWeatherCell!
		switch item {
		case .title:
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleCellID, for: indexPath) as! SubWeatherTitleCell
			
			
			
		case .description:
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptCellID, for: indexPath) as! DescriptionWeatherCell
			
			
		case .lifeIndex:
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: lifeIndexCellID, for: indexPath) as! LifeIndexCell
			
			
		case .dailyChart:
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: dailyChartCellID, for: indexPath) as! DailyWeatherCell
			
			
		case .weeklyChart:
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: weeklyCellID, for: indexPath) as! WeeklyWeatherCell
			
		case .goToTop:
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: gotoTopCellID, for: indexPath) as! GoToTopCell
			(cell as! GoToTopCell).goToTopButton.addTarget(self, action: #selector(didTapGoToTop), for: .touchUpInside)
			
		}
		cell.weather = weather
		return cell
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
			return CGSize(width: cWidth, height: 216)
		case .description:
			return CGSize(width: cWidth, height: 120)
		case .lifeIndex:
			return CGSize(width: cWidth, height: 186)
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

// MARK: Get Weather's Info Service
extension OOTDetailWeatherVC {
	private func getTodayTemperature() {
		
		let parameters = [
			"type": "today"
		]
		OOTWeatherService.shared.get(urlPath: .temperatures,parameters: parameters, handler: {(json) in
			self.weather.currentTemp = json[kSTRING_TEMPERATURES_API_CURRENT].stringValue
			self.weather.maxTemp = json[kSTRING_TEMPERATURES_API_MAXIMUM].stringValue
			self.weather.minTemp = json[kSTRING_TEMPERATURES_API_MINIMUM].stringValue
			
			self.collectionView.reloadData()
		}, errorHandler: { (statusCode, errorMessage) in
			
			let errorAlert: UIAlertController = .alert("code: \(statusCode)",errorMessage: errorMessage)
			errorAlert.add(kSTRING_TITLE_CONFIRM, handler: { (handling) in
				//				self.errorHandling(statusCode)
			}).show(self)
		})
	}
	
	private func getDusts() {
		OOTWeatherService.shared.get(urlPath: .dusts, handler: {(json) in
			print(json)
			let pm10Value = json[kSTRING_DUSTS_API_PM10VALUE].intValue
			let pm10Status = json[kSTRING_DUSTS_API_PM10STATUS].stringValue
			self.weather.dust.pm10 = (pm10Value, pm10Status)
			
			let pm25Value = json[kSTRING_DUSTS_API_PM25VALUE].intValue
			let pm25Status = json[kSTRING_DUSTS_API_PM25STATUS].stringValue
			self.weather.dust.pm25 = (pm25Value, pm25Status)
//			self.weather.pm10 =

			
			self.collectionView.reloadData()
		}, errorHandler: { (statusCode, errorMessage) in
			
			let errorAlert: UIAlertController = .alert("code: \(statusCode)",errorMessage: errorMessage)
			errorAlert.add(kSTRING_TITLE_CONFIRM, handler: { (handling) in
				//				self.errorHandling(statusCode)
			}).show(self)
		})
	}
	
	
}

// MARK: Observer
extension OOTDetailWeatherVC: LocationObserver, TimeObserver {
	func updateLocation(_ notyValue: String) {
		weather.currentLocation = notyValue
		collectionView.reloadData()
	}
	func updateTime(_ notyValue: String) {
		weather.currentTime = notyValue
		collectionView.reloadData()
	}
}
