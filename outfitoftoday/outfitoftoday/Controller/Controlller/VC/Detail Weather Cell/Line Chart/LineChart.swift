//
//  LineChart.swift
//  LineChart
//
//  Created by Nguyen Vu Nhat Minh on 25/8/17.
//  Copyright © 2017 Nguyen Vu Nhat Minh. All rights reserved.
//

import UIKit
import Then
import SnapKit


struct OneHourData: Codable {
	let month: Int
	let day: Int
	let hour: Int
	let dayOfWeek: String
	
	let temperature: Int
	let weather: Int
}

//
// 출처 : https://github.com/nhatminh12369/LineChart
//
struct PointEntry {
    let value: Int
    let label: String
}

extension PointEntry: Comparable {
    static func <(lhs: PointEntry, rhs: PointEntry) -> Bool {
        return lhs.value < rhs.value
    }
    static func ==(lhs: PointEntry, rhs: PointEntry) -> Bool {
        return lhs.value == rhs.value
    }
}

class LineChart: UIView {
    
    /// gap between each point
    let lineGap: CGFloat = 56.0
    
    /// preseved space at top of the chart
    let topSpace: CGFloat = 54.0 + 20
    
    /// preserved space at bottom of the chart to show labels along the Y axis
    let bottomSpace: CGFloat = 40.0 + 20
    
    /// The top most horizontal line in the chart will be 10% higher than the highest value in the chart
    let topHorizontalLine: CGFloat = 110.0 / 100.0
    
    var isCurved: Bool = false
    
    var dataEntries: [OneHourData]? {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    /// Contains the main line which represents the data
    private let dataLayer: CALayer = CALayer()
    
    /// To show the gradient below the main line
    private let gradientLayer: CAGradientLayer = CAGradientLayer()
    
    /// Contains dataLayer and gradientLayer
    private let mainLayer: CALayer = CALayer()
    
    /// Contains mainLayer and label for each data entry
    private let scrollView: UIScrollView = UIScrollView()
    
    /// Contains horizontal lines
    private let gridLayer: CALayer = CALayer()
    
    /// An array of CGPoint on dataLayer coordinate system that the main line will go through. These points will be calculated from dataEntries array
    private var dataPoints: [CGPoint]?
    
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
        scrollView.layer.addSublayer(mainLayer)
		
		gradientLayer.isHidden = true
		gridLayer.isHidden = true
		
        gradientLayer.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7).cgColor, UIColor.clear.cgColor]
        scrollView.layer.addSublayer(gradientLayer)
        self.layer.addSublayer(gridLayer)
        self.addSubview(scrollView)
        self.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        if let dataEntries = dataEntries {
            scrollView.contentSize = CGSize(width: CGFloat(dataEntries.count) * lineGap, height: self.frame.size.height)
            mainLayer.frame = CGRect(x: 0, y: 0, width: CGFloat(dataEntries.count) * lineGap, height: self.frame.size.height)
            dataLayer.frame = CGRect(x: 0, y: topSpace, width: mainLayer.frame.width, height: mainLayer.frame.height - topSpace - bottomSpace)
            gradientLayer.frame = dataLayer.frame
            dataPoints = convertDataEntriesToPoints(entries: dataEntries)
            gridLayer.frame = CGRect(x: 0, y: topSpace, width: self.frame.width, height: mainLayer.frame.height - topSpace - bottomSpace)
            
            clean()
//            drawHorizontalLines()
            if isCurved {
                drawCurvedChart()
            } else {
                drawChart()
            }
            maskGradientLayer()
            drawLables()
        }
    }
    
    /**
     Convert an array of PointEntry to an array of CGPoint on dataLayer coordinate system
     */
    private func convertDataEntriesToPoints(entries: [OneHourData]) -> [CGPoint] {
		var entries = [Int]()
		guard let dataEntries = dataEntries else { return [] }
		for data in dataEntries {
			let temp = data.temperature
			entries.append(temp)
			
		}
		
		if let max = entries.max(),
			let min = entries.min() {
            
            var result: [CGPoint] = []
            let minMaxRange: CGFloat = CGFloat(max - min) * topHorizontalLine
            
            for i in 0..<entries.count {
                let height = dataLayer.frame.height * (1 - ((CGFloat(entries[i]) - CGFloat(min)) / minMaxRange))
                let point = CGPoint(x: CGFloat(i)*lineGap + 40, y: height)
                result.append(point)
            }
            return result
        }
        return []
    }
    
    /**
     Draw a zigzag line connecting all points in dataPoints
     */
    private func drawChart() {
        if let dataPoints = dataPoints,
            dataPoints.count > 0,
            let path = createPath() {
            
            let lineLayer = CAShapeLayer()
            lineLayer.path = path.cgPath
			lineLayer.strokeColor = #colorLiteral(red: 0.7215686275, green: 0.7215686275, blue: 0.7215686275, alpha: 1).cgColor
			lineLayer.fillColor = UIColor.clear.cgColor
            dataLayer.addSublayer(lineLayer)
        }
    }
    
    /**
     Create a zigzag bezier path that connects all points in dataPoints
     */
    private func createPath() -> UIBezierPath? {
        guard let dataPoints = dataPoints, dataPoints.count > 0 else {
            return nil
        }
		let point = dataPoints[0]
        let path = UIBezierPath()
        path.move(to: point)
		
		let dotLayer = CALayer().then {
			$0.backgroundColor = #colorLiteral(red: 0.9348803163, green: 0.3433670402, blue: 0.3681144118, alpha: 1).cgColor
			$0.frame = CGRect(x: point.x - 4, y: point.y - 4, width: 8, height: 8)
			$0.cornerRadius = 4
		}
		
		dataLayer.addSublayer(dotLayer)
		
        for i in 1..<dataPoints.count {
			let point = dataPoints[i]
            path.addLine(to: point)
			
			let dotLayer = CALayer().then {
				$0.backgroundColor = #colorLiteral(red: 0.7215686275, green: 0.7215686275, blue: 0.7215686275, alpha: 1).cgColor
				$0.frame = CGRect(x: point.x - 4, y: point.y - 4, width: 8, height: 8)
				$0.cornerRadius = 4
			}
			
			dataLayer.addSublayer(dotLayer)
        }
        return path
    }
    
    /**
     Draw a curved line connecting all points in dataPoints
     */
    private func drawCurvedChart() {
        guard let dataPoints = dataPoints, dataPoints.count > 0 else {
            return
        }
        if let path = CurveAlgorithm.shared.createCurvedPath(dataPoints) {
            let lineLayer = CAShapeLayer()
            lineLayer.path = path.cgPath
            lineLayer.strokeColor = #colorLiteral(red: 0.7215686275, green: 0.7215686275, blue: 0.7215686275, alpha: 1).cgColor
			lineLayer.fillColor = UIColor.clear.cgColor
            dataLayer.addSublayer(lineLayer)
        }
    }
    
    /**
     Create a gradient layer below the line that connecting all dataPoints
     */
    private func maskGradientLayer() {
        if let dataPoints = dataPoints,
            dataPoints.count > 0 {
            
            let path = UIBezierPath()
            path.move(to: CGPoint(x: dataPoints[0].x, y: dataLayer.frame.height))
            path.addLine(to: dataPoints[0])
            if isCurved,
                let curvedPath = CurveAlgorithm.shared.createCurvedPath(dataPoints) {
                path.append(curvedPath)
            } else if let straightPath = createPath() {
                path.append(straightPath)
            }
            path.addLine(to: CGPoint(x: dataPoints[dataPoints.count-1].x, y: dataLayer.frame.height))
            path.addLine(to: CGPoint(x: dataPoints[0].x, y: dataLayer.frame.height))
            
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            maskLayer.fillColor = UIColor.white.cgColor
            maskLayer.strokeColor = UIColor.clear.cgColor
            maskLayer.lineWidth = 0.0
            
            gradientLayer.mask = maskLayer
        }
    }
    
    /**
     Create titles at the bottom for all entries showed in the chart
     */
    private func drawLables() {
        if let dataEntries = dataEntries,
            dataEntries.count > 0 {
            for i in 0..<dataEntries.count {
				
				let xValue = lineGap*CGFloat(i) - lineGap / 2 + 40
				
				// draw Text: 아랫쪽 온도표시
                let textLayer = CATextLayer()
                textLayer.frame = CGRect(x: xValue, y: mainLayer.frame.size.height - bottomSpace/2 - 8, width: lineGap, height: 16)
                textLayer.foregroundColor = UIColor.gunmetal.cgColor
                textLayer.backgroundColor = UIColor.clear.cgColor
                textLayer.alignmentMode = kCAAlignmentCenter
                textLayer.contentsScale = UIScreen.main.scale
                textLayer.font = CTFontCreateWithName(UIFont.spoqaFont(ofSize: 0).fontName as CFString, 0, nil)
                textLayer.fontSize = 12
                textLayer.string = dataEntries[i].temperature.description + " ̊"
                mainLayer.addSublayer(textLayer)
				
				
				// draw Text: 윗쪽 시간표시
				let topTextLayer = CATextLayer().then {
					$0.frame = CGRect(x: xValue, y: 0, width: lineGap, height: 18)
					$0.foregroundColor = UIColor.gunmetal.cgColor
					$0.backgroundColor = UIColor.clear.cgColor
					$0.alignmentMode = kCAAlignmentCenter
					$0.contentsScale = UIScreen.main.scale
					$0.font = CTFontCreateWithName(UIFont.spoqaFont(ofSize: 0).fontName as CFString, 0, nil)
					$0.fontSize = 12
					$0.string = dataEntries[i].hour.description + "시"
                    
                    // 파워 하드코딩
                    if i == 0 {
                        $0.string = "3시"
                    } else if i == 1 {
                        $0.string = "6시"
                    } else if i == 2 {
                        $0.string = "9시"
                    } else if i == 3 {
                        $0.string = "12시"
                    } else if i == 4 {
                        $0.string = "3시"
                    } else if i == 5 {
                        $0.string = "6시"
                    } else if i == 6 {
                        $0.string = "9시"
                    } else if i == 7 {
                        $0.string = "12시"
                    }
					
				}
				mainLayer.addSublayer(topTextLayer)
				
				// draw Image: 윗쪽 이미지
				let iconImgLayer = CALayer().then {
//                    var img = WeatherImage.imgs[dataEntries[i].weather].cgImage
                    
                    // 파워 파워 파워 하드 코딩 합시당!
                    var img:CGImage? = nil
                    // 파워 하드코딩
                    if i == 0 {
                        img = WeatherImage.imgs[3].cgImage
                    } else if i == 1 {
                        img = WeatherImage.imgs[3].cgImage
                    } else if i == 2 {
                        img = WeatherImage.imgs[3].cgImage
                    } else if i == 3 {
                        img = WeatherImage.imgs[2].cgImage
                    } else if i == 4 {
                        img = WeatherImage.imgs[1].cgImage
                    } else if i == 5 {
                        img = WeatherImage.imgs[1].cgImage
                    } else if i == 6 {
                        img = WeatherImage.imgs[1].cgImage
                    } else if i == 7 {
                        img = WeatherImage.imgs[1].cgImage
                    }

                    
					$0.frame = CGRect(x: xValue, y: 26, width: lineGap, height: 28)
					$0.contents = img
					$0.contentsGravity = kCAGravityResizeAspect
				}
				mainLayer.addSublayer(iconImgLayer)

            }
        }
    }
    
 
    private func clean() {
        mainLayer.sublayers?.forEach({
            if $0 is CATextLayer {
                $0.removeFromSuperlayer()
            }
        })
        dataLayer.sublayers?.forEach({$0.removeFromSuperlayer()})
        gridLayer.sublayers?.forEach({$0.removeFromSuperlayer()})
    }
}
