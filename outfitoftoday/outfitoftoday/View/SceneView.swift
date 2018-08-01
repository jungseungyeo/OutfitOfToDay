//
//  SceneView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 30..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import Then
import SnapKit

// 배경
class SceneView: BaseView {
    
    public var backgroundsModel: BackgroundsModel? {
        didSet {
            guard let backgrounds = backgroundsModel else {
                return
            }
            
            guard let sceneIMG = background.init(rawValue: backgrounds.weather)?.img else {
                return
            }
            backgroundArea.image = sceneIMG
        }
    }
    
    private enum background:String {
        case fine       // 맑음
        case cloudy     // 흐림
        case snowy      // 눈
        
        var img: UIImage? {
            switch self {
                case .fine:
                    return UIImage(named: "BackgroundImageFine")
                case .cloudy:
                    return UIImage(named: "BackgroundImageCloudy")
                case .snowy:
                    return UIImage(named: "BackgroundImageSnowy")
            }
        }
    }
    
    lazy private var backgroundArea = UIImageView().then {
        $0.image = UIImage(named: "BackgroundImageFine")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setup() {
        super.setup()
        initUI()
    }

    private func initUI() {
        addSubViews(
            backgroundArea
        )
        
        backgroundArea.layer.cornerRadius = 3
        backgroundArea.layer.masksToBounds = true
        
        backgroundArea.snp.makeConstraints { make -> Void in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
    }
    
    public func addCloudView(to cloudView: CloudAnimationView) {
        self.backgroundArea.addSubViews(cloudView)
    }
    
}
