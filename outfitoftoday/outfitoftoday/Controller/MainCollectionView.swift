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
    
    var refresher:UIRefreshControl!
    
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
    
    private let sideMenuButton = UIButton().then {
        $0.setTitle("sideMenu", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
    }
    
    @objc func touchButton(sender: UIButton) {
        present(SideMenuNavigationView(rootViewController: SettingTableViewController()), animated: true, completion: nil)
        UIView.animate(withDuration: 0.5) {
            self.moveLeft(view: self.sideMenuButton)
        }
    }
    
    func moveLeft(view: UIView) {
//        view.center.x += 30
//        view.bounds.size.width -= 40
//        view.bounds.size.height -= 40
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.backgroundColor = .white
        collectionView?.register(MainCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        
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
        //code to execute during refresher
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MainCell
        
        if indexPath.item == 0 {
            collectionView.bounces = true
            let ootClothView = OOTClothView()
            ootClothView.addDownButton(downButton)
            ootClothView.addSideButton(sideMenuButton)
            cell.addView(ootClothView)
        }else if indexPath.item == 1 {
            collectionView.bounces = false
            let weatherViewCell = WeatherViewCell()
            weatherViewCell.addUpBuuton(upButton)
            cell.addView(weatherViewCell)
        }
        
        return cell
    }
}

extension MainCollectionView {
    
    func requestData() {
//        NetWork.request(String(OOT.NETWORK.dusts))
//        NetWork.request(OOT.NETWORK.temperatures.description)
//        NetWork.shared.request(for: .ootRequest) { (result) in
//            
//            guard let responseObject = result as? OOTDustData else {
//                // Alert 창
//                print(result as Any)
//                return
//            }
//            print(responseObject)
//        }
    }
    
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
    
    @objc private func handleDown() {
        let index = IndexPath(item: 1, section: 0)
        collectionView?.scrollToItem(at: index, at: .centeredVertically, animated: true)
    }
    
    @objc private func handleUp() {
        let index = IndexPath(item: 0, section: 0)
        collectionView?.scrollToItem(at: index, at: .centeredVertically, animated: true)
    }
    
}

