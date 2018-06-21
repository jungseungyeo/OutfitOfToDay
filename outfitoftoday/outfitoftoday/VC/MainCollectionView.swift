//
//  MainCollectionView.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//
import UIKit

class MainCollectionView: UICollectionViewController {
    
    var refresher:UIRefreshControl!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionview?.statu
//        collectionView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = false
//        collectionView?.topAnchor.anchorWithOffset(to: self.view.topAnchor)
        
//        if #available(iOS 11, *) {
//            collectionView?.frame = CGRect(x: 0.0, y: 44.0, width: self.view.frame.width, height: self.view.frame.height)
//        }
        
//        collectionView?.frame = CGRect(x: 0.0, y: -44.0, width: self.view.frame.width, height: self.view.frame.height)
        
        collectionView?.backgroundColor = .white
        collectionView?.register(MainCollectionViewCell.self
            , forCellWithReuseIdentifier: "cellId")

        collectionView?.isPagingEnabled = true
        
//        collectionView?.showsVerticalScrollIndicator = false
        
    
//        self.refresher = UIRefreshControl()
//        self.collectionView!.alwaysBounceVertical = true
//        self.refresher.tintColor = UIColor.red
//        self.refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
//        self.collectionView!.addSubview(refresher)
        
        requestData()
    }
    
    
    
    @objc func loadData() {
        //code to execute during refresher
        print("123123")
        stopRefresher()         //Call this to stop refresher
    }
    
    func stopRefresher() {
        self.refresher.endRefreshing()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MainCollectionViewCell
        return cell
    }
}
//
//extension MainCollectionView: UICollectionViewDelegate {
//    func selectItem(at indexPath: IndexPath?,
//                    animated: Bool,
//                    scrollPosition: UICollectionView.ScrollPosition) {
//
//    }
//}


extension MainCollectionView {
    
    func requestData() {
        NetWork.requestGetAPI(OOT.NETWORK.dusts.description)
        NetWork.requestGetAPI(OOT.NETWORK.temperatures.description)
    }
}

