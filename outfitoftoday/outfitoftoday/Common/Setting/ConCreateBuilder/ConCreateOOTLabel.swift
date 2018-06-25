//
//  ConCreateOOTLabel.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 22..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class ConCreateOOTLabel: OOTLabelable {
    
    var ootLabel: UILabel = UILabel()
    
    func instance() -> OOTLabelable {
        return self
    }
    
    func setText(with text: String) -> OOTLabelable {
        self.ootLabel.text = text
        return self
    }
    
    func setNuberOfLine(with numberOfLine: Int) -> OOTLabelable {
        self.ootLabel.numberOfLines = numberOfLine
        return self
    }
    
    func setFontSize(with fontSize: CGFloat) -> OOTLabelable {
        self.ootLabel.font = .systemFont(ofSize: fontSize)
        return self
    }
    
    func setTextColor(with textColor: UIColor) -> OOTLabelable {
        self.ootLabel.textColor = textColor
        return self
    }
    
    func setTextAlignment(with textAlignment: NSTextAlignment) -> OOTLabelable {
        self.ootLabel.textAlignment = textAlignment
        return self
    }
    
}
