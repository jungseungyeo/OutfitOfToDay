//
//  MainCollectionView.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//
import UIKit
import SnapKit

class MainCollectionView: UICollectionViewController {
    
    var refresher:UIRefreshControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.backgroundColor = .white
        collectionView?.register(MainCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = true
        
        self.refresher = UIRefreshControl() //0.0, 0.0, 320.0, 60.0
        
        self.collectionView!.alwaysBounceVertical = true
        self.refresher.tintColor = .gray
        self.refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.collectionView!.addSubview(refresher)
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        edgeInSetSetting()
    }
    
    
    
    @objc func loadData() {
        //code to execute during refresher
        print("123123")
        stopRefresher()         //Call this to stop refresher
    }
    
    func stopRefresher() {
        self.refresher.endRefreshing()
        print("345345")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
}

extension MainCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MainCell
        
        if indexPath.item == 0 {
            cell.addView(OOTClothView())
        }else if indexPath.item == 1 {
            cell.addView(WeatherViewCell())
        }
        
        return cell
    }
}

extension MainCollectionView {
    
    func requestData() {
<<<<<<< HEAD
//        NetWork.request(String(OOT.NETWORK.dusts))
//        NetWork.request(OOT.NETWORK.temperatures.description)
        NetWork.shared.request(for: .ootRequest) { (result) in
            guard let responseObject = result as? OOTDustData else {
                // Alert 창
                print(result as Any)
                return
            }
            print(responseObject)
        }
=======
<<<<<<< HEAD:outfitoftoday/outfitoftoday/Controller/MainCollectionView.swift
        NetWork.requestGetAPI(OOT.NETWORK.dusts.description)
        NetWork.requestGetAPI(OOT.NETWORK.temperatures.description)
>>>>>>> c10ed2f78c8636f795f6189c52129e9c3eb6f42a
    }
    
    func edgeInSetSetting() {
        if #available(iOS 11.0, *) {
            collectionView?.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    func setupView() {
        self.refresher.snp.makeConstraints {
            $0.top.equalTo(-20)
            $0.centerX.equalTo(view.snp.centerX)
=======
        NetWork.shared.request(for: .ootRequest) { (result) in
            guard let responseObject = result as? OOTDustData else {
                // Alert 창
                return
            }
            // 데이터 사용 responseObject.pm10Value ...
>>>>>>> c8bc11b1d2e1fbb4b6e0d23b27f6a3514219d677:outfitoftoday/outfitoftoday/VC/MainCollectionView.swift
        }
    }
    
}

