//
//  NVIndicatorView.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 28..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import NVActivityIndicatorView

class NVIndicatiorView {
    static func instance(_ viewController: UIViewController) -> NVActivityIndicatorView {
        let indicatorView = NVActivityIndicatorView(frame: .zero, type: NVActivityIndicatorType.init(rawValue: 29), color: .darkGray, padding: nil)
        
        viewController.view.addSubview(indicatorView)
        
        indicatorView.snp.makeConstraints { make -> Void in
            make.size.equalTo(40)
            make.center.equalToSuperview()
        }
        
        return indicatorView
    }
}
