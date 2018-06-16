//
//  View+.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
