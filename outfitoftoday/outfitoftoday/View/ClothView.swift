//
//  ClothView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 31..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit

// width 170
// heigh 417

// 88.27

class ClothView: BaseView {
    
    public var backgroundModel: BackgroundsModel? {
        didSet {
            guard let backgroundModel = backgroundModel else {
                return
            }
            
            guard let _ = DropAnimationManager.weatherType.init(rawValue: backgroundModel.precipitation)?.img else {
                closeUmbrell.isHidden = true
                return
            }
            closeUmbrell.isHidden = false
        }
    }
    
    lazy private var faceIMG = UIImageView().then {
        $0.image = UIImage(named: "head")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var bodyIMG = UIImageView().then {
        $0.image = UIImage(named: "body_0")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var legIMG = UIImageView().then {
        $0.image = UIImage(named: "leg_0")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var footIMG = UIImageView().then {
        $0.image = UIImage(named: "foot_0")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var maskIMG = UIImageView().then {
        $0.image = UIImage(named: "mask")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var sunglassIMG = UIImageView().then {
        $0.image = UIImage(named: "sunglass")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var closeUmbrell = UIImageView().then {
        $0.image = UIImage(named: "closeUmbrella")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var openUmbrell = UIImageView().then {
        $0.image = UIImage(named: "unfoldUmbrella")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setup() {
        super.setup()
        setupUI()
    }
    
    private func setupUI() {
        addSubViews(
            legIMG         // 다리
            ,footIMG        // 발
            ,bodyIMG        // 몸
            ,faceIMG         // 얼굴
            ,maskIMG        // 마스크
            ,sunglassIMG    // 선글라스
            ,closeUmbrell   // 우산 들고 있는 거
            ,openUmbrell    // 우산 쓰고 있는 거
        )
        
        openUmbrell.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(ratioTopUmbrell())
            make.left.equalToSuperview().offset(0)
            
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).dividedBy(1.018823529411765)
            
        }
        
        bodyIMG.snp.makeConstraints { make -> Void in
//            make.top.equalTo(faceIMG.snp.bottom).offset(ratioTop())
            make.top.equalToSuperview().offset(ratioTop())
            make.left.equalToSuperview()
            
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).dividedBy(1.04679802955665)
        }
        
        faceIMG.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).dividedBy(1.527403414195867)
        }
        
        footIMG.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).dividedBy(2.348066298342541)
        }
        
        legIMG.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview()
            make.bottom.equalTo(footIMG.snp.top).offset(0)
            
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).dividedBy(1.18964310706788)
        }
        
        maskIMG.snp.makeConstraints{ make -> Void in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).dividedBy(1.527403414195867)
        }
        
        sunglassIMG.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).dividedBy(1.527403414195867)
        }
        
        closeUmbrell.snp.makeConstraints { make -> Void in
            make.top.equalTo(legIMG).offset(21.6)
            make.right.equalTo(self)
            
            make.width.equalTo(self.snp.width).dividedBy(3.41232227488)
            make.height.equalTo(self.snp.width).dividedBy(0.8085345311622)
        }
    }
    
    private func ratioTop() -> Double {
        let ratio = UIScreen.main.bounds.height
        
        switch ratio {
            case 568.0:
                return 88.27
            case 736.0:
                return 98
            default:
                return 86
        }
    }
    
    private func ratioTopUmbrell() -> Double {
        let ratio = UIScreen.main.bounds.height
        switch ratio {
            case 568.0:
                return 0.0
            case 736.0:
                return 0.0
            default:
                return 4.0
        }
    }
    
    private func ratioLeftUmbrell() -> Double {
        let ratio = UIScreen.main.bounds.height
        switch ratio {
            case 568.0:
                return 0.0
            case 736.0:
                return 0.0
            default:
                return 4.0
        }
    }
}
