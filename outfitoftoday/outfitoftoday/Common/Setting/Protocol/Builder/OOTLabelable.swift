//
//  OOTLabelable.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 22..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

protocol OOTLabelable {
    var ootLabel: UILabel { get }
    func instance() -> OOTLabelable
    func setText(with text: OOT.mainCustomString) -> OOTLabelable
    func setNuberOfLine(with numberOfLine: Int) -> OOTLabelable
    func setFontSize(with fontSize: CGFloat) -> OOTLabelable
    func setFontType(with fontType: OOT.mainCustomString) -> OOTLabelable
    func setTextColor(with textColor: UIColor) -> OOTLabelable
    func setTextAlignment(with textAlignment: NSTextAlignment) -> OOTLabelable
    func setTextSpacing(spacing: CGFloat) -> OOTLabelable
}
