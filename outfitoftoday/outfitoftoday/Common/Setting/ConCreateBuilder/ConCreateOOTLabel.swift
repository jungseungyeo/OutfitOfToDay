//
//  ConCreateOOTLabel.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 22..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import Foundation

class ConCreateOOTLabel: OOTLabelable {
    
    var ootLabel: UILabel = UILabel()
    
    func instance() -> OOTLabelable {
        return self
    }
    
    func setText(with text: OOT.mainCustomString) -> OOTLabelable {
        self.ootLabel.text = String(text)
        return self
    }
    
    func setTextString(with setText: String) -> OOTLabelable {
        self.ootLabel.text = setText
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
    
    func setFontType(with fontType: OOT.mainCustomString) -> OOTLabelable {
        self.ootLabel.font = UIFont(name: fontType.fontType, size: self.ootLabel.font.pointSize)
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
    
    func setTextSpacing(spacing: CGFloat) -> OOTLabelable{
        let attributedString = NSMutableAttributedString(string: self.ootLabel.text ?? "", attributes: [
            .kern: spacing
            ])
        self.ootLabel.attributedText = attributedString

        return self
    }
    
}
