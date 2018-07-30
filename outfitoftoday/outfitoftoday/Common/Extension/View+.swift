//
//  View+.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 28..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

extension UIView {
    internal func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
