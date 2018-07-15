//
//  CouldAnimationController.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 12..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class CloudAnimationController: BaseVC {
    
    private let cloud = UIImageView().then {
        $0.image = UIImage(named: "cloud")
        $0.contentMode = .scaleAspectFit
    }
    
    enum cloudType {
        case amount(String)
        case speed(Int)
        
        var amount: String? {
            guard case .amount(let cloudamount) = self else {
                return nil
            }
            return cloudamount
        }
        
        var speed: Int? {
            guard case .speed(let cloundSpeed) = self else {
                return nil
            }
            return cloundSpeed
        }
    }
    
    override func setupView() {
        super.setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension CloudAnimationController {
    
    private func getStartLocation() -> CGPoint {
        return CGPoint(x: randomStartX(), y: 0)
    }
    
    private func randomStartX() -> Int {
        return Int(arc4random_uniform(UInt32(UIScreen.main.bounds.maxX)))
    }
    
    private func rnadomStartY() -> Int {
        return Int(arc4random_uniform(UInt32(UIScreen.main.bounds.maxY) / 2))
    }

}
