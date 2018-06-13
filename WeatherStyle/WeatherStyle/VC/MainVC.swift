//
//  MainVC.swift
//  WeatherStyle
//
//  Created by Jung seoung Yeo on 2018. 6. 13..
//  Copyright © 2018년 Clover. All rights reserved.
//

class MainVC: BaseVC {
    
    override func setupView() {
        super.setupView()
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Network.get(urlPath)
    }
}
