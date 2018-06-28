//
//  WeatherGraph.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 26..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class WeatherGraph: BaseScrollView {
    
    private var timeArray: [UILabel] = []
    private let contentView = UIView()
    
    override func setupView() {
        super.setupView()

        addSubview(contentView)
        
        contentView.snp.makeConstraints { make -> Void in
            make.top.bottom.equalTo(self).offset(0)
            make.left.equalTo(self.snp.left).offset(0)
            make.right.equalTo(self.snp.right).offset(0)
        }
        
        makeTimeArray()
        makeTimes()
    }
    
    private func makeTimeArray() {
        for index in 0 ... 24 {
            var timeText = ""
            if index < 10 {
                timeText = "0\(index)시"
            }else {
                timeText = "\(index)시"
            }
            
            let time = UILabel().then {
                $0.text = timeText
                $0.textColor = .black
                $0.font = .systemFont(ofSize: 11)
                $0.textAlignment = .center
            }
            timeArray.append(time)
            
        }
    }
    
    private func makeTimes() {
        for (index, view) in timeArray.enumerated() {
            contentView.addSubview(view)
            if index == 0 {
                view.snp.makeConstraints{ make -> Void in
                    make.top.equalTo(73)
                    make.left.equalTo(contentView).offset(0)
                }
            }else if index == 24 {
                view.snp.makeConstraints{ make -> Void in
                    make.top.equalTo(73)
                    make.left.equalTo(timeArray[23].snp.right).offset(28)
                    make.right.equalTo(contentView).offset(-28)
                }
            }else {
                view.snp.makeConstraints{ make -> Void in
                    make.top.equalTo(73)
                    make.left.equalTo(timeArray[index - 1].snp.right).offset(28)
                }
            }

        }
    }
    
}
