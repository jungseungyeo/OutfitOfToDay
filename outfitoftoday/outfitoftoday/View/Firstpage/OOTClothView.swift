//
//  OOTClothView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 17..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

// 머리, 옷, 바지, 신발 보여주는 뷰
class OOTClothView: BaseView {
    
    // 임시 서버 통신해서 이미지 받아올 예정
    
    private let face: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "head.png")
        $0.contentMode = .scaleAspectFit
    }
    
    private let body: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "body")
        $0.contentMode = .scaleAspectFit
    }
    
    private let leg: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "leg")
        $0.contentMode = .scaleAspectFit
    }
    
    private let foot: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "foot")
        $0.contentMode = .scaleAspectFit
    }
    
    override func setupView() {
        super.setupView()
        
        addSubViews(
                leg,
                face,
                body,
                foot
            )
        
        face.snp.makeConstraints { make -> Void in
            make.height.equalTo(self.snp.height).offset(0.1826)
            make.left.equalTo(self.snp.left).offset(0)
            make.right.equalTo(self.snp.right).offset(0)
            make.top.equalTo(35.6)
        }
        
        body.snp.makeConstraints { make -> Void in
            make.height.equalTo(180)
            
            make.top.equalTo(face.snp.bottom).offset(-30)
            make.left.right.equalTo(self)
        }
        
        leg.snp.makeConstraints { make -> Void in
            make.height.equalTo(144.6)
            make.left.right.equalTo(self)
            
            make.top.equalTo(body.snp.bottom).offset(-52.6)
        }
        
        foot.snp.makeConstraints { make -> Void in
            make.top.equalTo(leg.snp.bottom).offset(-1)
            make.right.left.equalTo(self)
        }
        
    }
}
