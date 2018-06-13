//
//  View+.swift
//  WeatherStyle
//
//  Created by Jung seoung Yeo on 2018. 6. 13..
//  Copyright © 2018년 Clover. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
