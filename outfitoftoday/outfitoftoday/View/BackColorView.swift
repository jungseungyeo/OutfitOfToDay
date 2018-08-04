//
//  BackColorView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 8. 1..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class BackColorView: BaseView {
    
    enum backgroundColor: String {
        case sunny
        case cloudy
        case snowy
        
        var color: UIColor {
            switch self {
            case .sunny:
                return UIColor(red: 255/255, green: 197/255, blue: 41/255, alpha: 0.2)
            case .cloudy:
                return UIColor(red: 215/255, green: 232/255, blue: 247/255, alpha: 1.0)
            case .snowy:
                return UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0)
            }
        }
    }
    
    lazy private var backColor: UIImageView = UIImageView().then {
        $0.backgroundColor = UIColor(red: 255/255, green: 197/255, blue: 41/255, alpha: 0.2)
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    override func setup() {
        super.setup()
        
        addSubViews(backColor)
        
        backColor.snp.makeConstraints { make -> Void in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
}
