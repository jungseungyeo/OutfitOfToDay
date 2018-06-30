//
//  SettingTableViewCell.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 28..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {

    var labelText = UILabel().then {
        $0.text = ""
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 40)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labelText.snp.makeConstraints{
            $0.center.equalTo(self)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
