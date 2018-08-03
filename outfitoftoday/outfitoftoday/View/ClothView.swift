//
//  ClothView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 31..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit

// width 144
// heigh 416

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
        $0.image = UIImage(named: "face")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var bodyIMG = UIImageView().then {
        $0.image = UIImage(named: "body")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var legIMG = UIImageView().then {
        $0.image = UIImage(named: "leg")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var footIMG = UIImageView().then {
        $0.image = UIImage(named: "foot")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy private var closeUmbrell = UIImageView().then {
        $0.image = UIImage(named: "closeUmbrella")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setup() {
        super.setup()
        setupUI()
    }
    
    private func setupUI() {
        addSubViews(
            faceIMG         // 얼굴
            ,legIMG         // 다리
            ,footIMG        // 발
            ,bodyIMG        // 몸
            ,closeUmbrell   // 우산 들고 있는 거
        )

        faceIMG.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).dividedBy(1.293800539083)
        }
        
        bodyIMG.snp.makeConstraints { make -> Void in
            make.top.equalTo(faceIMG.snp.bottom).offset(ratioTop())
            make.left.equalToSuperview()
            
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).dividedBy(0.886699507389)
        }
        
        footIMG.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).dividedBy(1.988950276)
        }
        
        legIMG.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview()
            make.bottom.equalTo(footIMG.snp.top).offset(1.5)
            
            make.width.equalToSuperview()

            make.height.equalTo(self.snp.width).dividedBy(0.99236111111)
        }
        
        closeUmbrell.snp.makeConstraints { make -> Void in
            make.top.equalTo(legIMG).offset(21.6)
            make.right.equalTo(self)
            
            make.width.equalTo(self.snp.width).dividedBy(3.41232227488)
            make.height.equalTo(self.snp.width).dividedBy(0.8085345311622)
        }
    }
    
    private func ratioTop() -> Int {
        let ratio = UIScreen.main.bounds.height
        switch ratio {
            case 568.0:
                return -18
            case 736.0:
                return -26
            default:
                return -23
        }
    }
}
