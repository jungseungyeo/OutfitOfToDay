//
//  WeeklyChartView.swift
//  outfitoftoday
//
//  Created by Goodnews on 2018. 8. 1..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import Then

struct TempDataEntry {
	let max: Int
	let min: Int
	let label: String
}

/*
### 1일 단위 (오늘 포함 7일)
/week

```
[{
"month": int,
"day": int,
"hour": int,
"dayOfWeek": string, // MON, TUE, WED, ...
"max": int,
"min": int,
"weather": 0~9
},
...
]
*/
struct OneDayData: Codable {
	let month: Int
	let day: Int
	let hour: Int
	let dayOfWeek: String
	
	let max: Int
	let min: Int
	let weather: Int
}
// 스크롤 없는 버전의 차트

class WeeklyChartView: UIView {
	
	
	var dataEntries: [OneDayData]? {
		didSet {
			self.setNeedsLayout()
		}
	}
	
	
	let topSpace: CGFloat = 88.0
	let bottomSpace: CGFloat = 26.0
	
	let maxLayerColor = UIColor.rosyPink.cgColor
	let minLayerColor = UIColor.skyBlue.cgColor
	
	var lineGap: CGFloat {
		get {
			return self.frame.size.width / CGFloat(dataEntries?.count ?? 1)
		}
	}
	
	/// Contains the main line which represents the data
	private let dataLayer: CALayer = CALayer()

	/// Contains dataLayer and gradientLayer
	private let mainLayer: CALayer = CALayer()
	
	/// An array of CGPoint on dataLayer coordinate system that the main line will go through. These points will be calculated from dataEntries array
	private var dataPoints: [(CGPoint, CGPoint)]?

	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	convenience init() {
		self.init(frame: CGRect.zero)
		setupView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupView()
	}
	
	private func setupView() {
		mainLayer.addSublayer(dataLayer)
		self.layer.addSublayer(mainLayer)
		self.backgroundColor = .clear
	}
	
	override func layoutSubviews() {
		if let dataEntries = dataEntries {
			mainLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
			dataLayer.frame = CGRect(x: 0, y: topSpace, width: mainLayer.frame.width, height: mainLayer.frame.height - topSpace - bottomSpace)
			dataPoints = convertDataEntriesToPoints(dataEntries)
			
			clean()
			drawVerticalLines()
//			drawHorizontalLines()
			drawChart()
			drawLables()
		}
	}
	
	/**
	Convert an array of PointEntry to an array of CGPoint on dataLayer coordinate system [(min, max)]
	*/
	private func convertDataEntriesToPoints(_ dataEntries: [OneDayData]) -> [(CGPoint, CGPoint)] {
		var entries = [Int]()
		
		for data in dataEntries {
			let minTemp = data.min
			let maxTemp = data.max
			entries.append(minTemp)
			entries.append(maxTemp)
		}

		if let max = entries.max(), let min = entries.min() {
			
			var result: [(CGPoint, CGPoint)] = []
			let minMaxRange: CGFloat = CGFloat(max - min) * 1.1
			
			for i in 0..<entries.count {
				let height = dataLayer.frame.height * (1 - ((CGFloat(entries[i]) - CGFloat(min)) / minMaxRange))
				let lineGap = self.frame.size.width / CGFloat(dataEntries.count)
				
				if i%2 == 0 { // min point
					let minPoint = CGPoint(x: CGFloat(Int(i/2))*lineGap + (lineGap/2), y: height)
					result.append((minPoint, .zero))
				} else {
					let maxPoint = CGPoint(x: CGFloat(Int(i/2))*lineGap + (lineGap/2), y: height)
					result[Int(i/2)].1 = maxPoint
				}
				
			}
			return result
		}
		return []
	}
	
	/// 요일 구분 세로선을 그린다
	private func drawVerticalLines() {
		guard let entries = dataEntries else { return }
		for i in 0..<(entries.count - 1) {
			let lineLayer = CALayer().then {
				$0.backgroundColor = UIColor.groupTableViewBackground.cgColor
				
				let xValue = (CGFloat(i+1) * lineGap)
				$0.frame = CGRect(x: xValue, y: 8, width: 1, height: self.frame.size.height - 16)
			}
//			mainLayer.addSublayer(lineLayer)
			mainLayer.insertSublayer(lineLayer, at: 0)
		}
	}
	
	/**
	Draw a zigzag line connecting all points in dataPoints
	*/
	private func drawChart() {
		if let dataPoints = dataPoints,
			dataPoints.count > 0,
			let path = createPath() {
			
			let minLineLayer = CAShapeLayer()
			minLineLayer.path = path.0.cgPath
			minLineLayer.strokeColor = minLayerColor
			minLineLayer.fillColor = UIColor.clear.cgColor
			dataLayer.addSublayer(minLineLayer)
			
			let maxLineLayer = CAShapeLayer()
			maxLineLayer.path = path.1.cgPath
			maxLineLayer.strokeColor = maxLayerColor
			maxLineLayer.fillColor = UIColor.clear.cgColor
			dataLayer.addSublayer(maxLineLayer)
		}
	}
	
	/**
	Create a zigzag bezier path that connects all points in dataPoints
	*/
	private func createPath() -> (UIBezierPath, UIBezierPath)? {
		guard let dataPoints = dataPoints, dataPoints.count > 0 else {
			return nil
		}
		let minPoint = dataPoints[0].0
		let maxPoint = dataPoints[0].1
		
		let minPath = UIBezierPath()
		let maxPath = UIBezierPath()
		
		minPath.move(to: minPoint)
		maxPath.move(to: maxPoint)
		
		
		drawDot(minPoint, color: minLayerColor)
		drawDot(maxPoint)
		
		
		for i in 1..<dataPoints.count {
			let minPoint = dataPoints[i].0
			let maxPoint = dataPoints[i].1
			
			drawDot(minPoint, color: minLayerColor)
			drawDot(maxPoint)
			
			minPath.addLine(to: minPoint)
			maxPath.addLine(to: maxPoint)
			
			
		}
		return (minPath, maxPath)
	}
	
	private func drawDot(_ point: CGPoint, color: CGColor = UIColor.rosyPink.cgColor) {
		let dotLayer = CALayer().then {
			$0.backgroundColor = color
			$0.frame = CGRect(x: point.x - 4, y: point.y - 4, width: 8, height: 8)
			$0.cornerRadius = 4
		}
		
		dataLayer.addSublayer(dotLayer)
		
	}

	/**
	Create titles at the bottom for all entries showed in the chart
	*/
	private func drawLables() {
		if let dataEntries = dataEntries,
			dataEntries.count > 0 {
			for i in 0..<dataEntries.count {
				
				let xValue = lineGap*CGFloat(i)
				
				
				// draw Text: 윗쪽 시간표시
				let topTextLayer = CATextLayer().then {
					$0.frame = CGRect(x: xValue, y: 0, width: lineGap, height: 18)
					$0.foregroundColor = UIColor.gunmetal.cgColor
					$0.backgroundColor = UIColor.clear.cgColor
					$0.alignmentMode = kCAAlignmentCenter
					$0.contentsScale = UIScreen.main.scale
					$0.font = CTFontCreateWithName(UIFont.systemFont(ofSize: 0).fontName as CFString, 0, nil)
					$0.fontSize = 12
					$0.string = dataEntries[i].dayOfWeek
					
				}
				mainLayer.addSublayer(topTextLayer)
				
				// draw Image: 윗쪽 이미지
				let iconImgLayer = CALayer().then {
//					let img = #imageLiteral(resourceName: "sunny").cgImage
                    let img = WeatherImage.imgs[dataEntries[i].weather].cgImage
                    
                    // 파워 파워 파워 코딩 합시당!
                    
					$0.frame = CGRect(x: xValue, y: 26, width: lineGap, height: 28)
					$0.contents = img
					$0.contentsGravity = kCAGravityResizeAspect
				}
				mainLayer.addSublayer(iconImgLayer)
				
				if let dataPoints = dataPoints {
					// draw Text: 최고온도 text
					let maxTempTextLayer = CATextLayer().then {
						let point = dataPoints[i].1
						$0.frame = CGRect(x: xValue, y: point.y - 26, width: lineGap, height: 18)
						$0.foregroundColor = maxLayerColor
						$0.backgroundColor = UIColor.clear.cgColor
						$0.alignmentMode = kCAAlignmentCenter
						$0.contentsScale = UIScreen.main.scale
						$0.font = CTFontCreateWithName(UIFont.systemFont(ofSize: 0, weight: .light).fontName as CFString, 0, nil)
						$0.fontSize = 12
						$0.string = String(dataEntries[i].max)
						
						
					}
					dataLayer.addSublayer(maxTempTextLayer)
					
					let minTempTextLayer = CATextLayer().then {
						let point = dataPoints[i].0
						$0.frame = CGRect(x: xValue, y: point.y + 8, width: lineGap, height: 18)
						$0.foregroundColor = minLayerColor
						$0.backgroundColor = UIColor.clear.cgColor
						$0.alignmentMode = kCAAlignmentCenter
						$0.contentsScale = UIScreen.main.scale
						$0.font = CTFontCreateWithName(UIFont.systemFont(ofSize: 0, weight: .light).fontName as CFString, 0, nil)
						$0.fontSize = 12
						$0.string = String(dataEntries[i].min)
						
						
					}
					dataLayer.addSublayer(minTempTextLayer)
				}
			}
		}
	}
	
	
	private func clean() {
		mainLayer.sublayers?.forEach({
			if $0 is CATextLayer || ($0.contents) != nil {
				$0.removeFromSuperlayer()
			}
		})
		dataLayer.sublayers?.forEach({$0.removeFromSuperlayer()})
	}
}
