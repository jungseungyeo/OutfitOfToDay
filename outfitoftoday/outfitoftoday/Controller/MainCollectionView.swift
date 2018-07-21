//
//  MainCollectionView.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//
import UIKit
import SnapKit
import Then

class MainCollectionView: UICollectionViewController {
    
    private var refresher:UIRefreshControl!
    
    private let downButton: UIButton = UIButton().then{
        $0.setImage(UIImage(named: "downButton"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = true
        $0.titleLabel?.font = .systemFont(ofSize: 20)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(handleDown), for: .touchUpInside)
    }
    
    private let upButton: UIButton = UIButton().then{
        $0.setImage(UIImage(named: "upButton"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = true
        $0.titleLabel?.font = .systemFont(ofSize: 50)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(handleUp), for: .touchUpInside)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.backgroundColor = .white
        collectionView?.register(MainCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        
        collectionView?.bounces = false
//        self.refresher = UIRefreshControl() //0.0, 0.0, 320.0, 60.0
//        self.collectionView!.alwaysBounceVertical = false
//        self.refresher.tintColor = .gray
//        self.refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
//        self.collectionView!.addSubview(refresher)
//        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        edgeInSetSetting()
        
//        addTapGesture()
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        self.collectionView?.isUserInteractionEnabled = true
        self.collectionView?.addGestureRecognizer(tap)
    }
    
    @objc private func tapped(sender: UITapGestureRecognizer) {
        let indexPath = IndexPath(item: 1, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    
    @objc func loadData() {
        stopRefresher()
    }
    
    func stopRefresher() {
        self.refresher.endRefreshing()
        collectionView?.reloadData()
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
        
        for subView in cell.subviews {
            subView.removeFromSuperview()
        }
        
        if indexPath.item == 0 {
            let ootfirstView = OOTFirstViewController().view!
            cell.addView(ootfirstView)
            
        }else if indexPath.item == 1 {
//            let weatherViewCell = WeatherViewCell()
//            weatherViewCell.addUpBuuton(upButton)
            
            let ootSecondViewCell = OOTSecondViewController().view!
            cell.addView(ootSecondViewCell)
        }
        
        return cell
    }
}

extension MainCollectionView {
   
    func edgeInSetSetting() {
        if #available(iOS 11.0, *) {
            collectionView?.contentInsetAdjustmentBehavior = .never
            return
        }
    }
    
    func setupView() {
        self.refresher.snp.makeConstraints {
            $0.top.equalTo(-20)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }
}

extension MainCollectionView {
    @objc private func handleDown() {
        let index = IndexPath(item: 1, section: 0)
        collectionView?.scrollToItem(at: index, at: .centeredVertically, animated: true)
    }
    
    @objc private func handleUp() {
        let index = IndexPath(item: 0, section: 0)
        collectionView?.scrollToItem(at: index, at: .centeredVertically, animated: true)
    }
}

