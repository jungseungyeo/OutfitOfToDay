//
//  FirstViewController.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 26..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SnapKit

class OOTWeatherViewCotnroller: BaseVC {
    
    /// model
    private var backgroundModel: BackgroundsModel?
    private var temperaturesModel: TemperaturesModel?
    
    // view
    private let backColorView = BackColorView()
    private let locationTimeView = LocationTimeView()
    private let sceneView = SceneView().then {
        $0.clipsToBounds = true
    }
    private let clothView = ClothView()
    
    // 한 줄 코멘트
    private let todatComment = UILabel()
    
    // singleTon
    private let locationManager = LocationManager.shared
    private let timeManager = TimeManager.shared
    
    // drop view 생성 시간
    private var dropTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setup() {
        super.setup()
        locationManager.requestForLocation()
        initObserver()
        initAPI()
    }
    
    override func initAPI() {
        super.initAPI()
        temperrauresAPI()
        backgroundAPI()
    }
    
    private func initObserver() {
        locationManager.attachObserver(self)
        timeManager.attachObserver(self)
    }
    
    private func initUI() {
        self.view.addSubViews(
            backColorView
            ,locationTimeView
            ,sceneView
            ,clothView
        )
        
        backColorView.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            
            make.width.equalToSuperview()
            make.height.equalTo(self.view.snp.width).dividedBy(1.15065971156)
        }
        
        locationTimeView.snp.makeConstraints { make -> Void in
            make.height.equalTo(116)
            
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(53)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
        }
        
        sceneView.snp.makeConstraints { make -> Void in
            make.height.equalTo(sceneRatio() * 70)
            
            make.top.equalTo(locationTimeView.snp.bottom)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
        }
        
        if backgroundModel?.precipitation != "none" {
            initDropAnimation()
        }
        
        if ((backgroundModel?.windSpeed) != nil) {
            initCloudAnimation()
        }
        
        clothView.snp.makeConstraints { make -> Void in
            make.top.equalTo(sceneView.snp.top).offset(28.4)
            make.right.equalTo(sceneView.snp.right).offset(-7.5)
            
            make.width.equalTo((self.view.frame.width - 40) * 0.429850746268)
            make.height.equalTo(((self.view.frame.width - 40) * 0.429850746268) * 2.8888888)
        }
    
    }
    
    private func sceneRatio() -> CGFloat {
        return CGFloat((UIScreen.main.bounds.width - 40) / 67)
    }
    
}

// MARK: API
extension OOTWeatherViewCotnroller {
    private func backgroundAPI() {
        let indicator: NVActivityIndicatorView = NVIndicatiorView.instance(self)
        indicator.startAnimating()
        
        OOTWeatherService.shared.get(urlPath: .backgrounds, handler: {(json) in
            indicator.stopAnimating()
            self.backgroundModel = BackgroundsModel(
                skyCoverage: json[kSTRING_BACKGROUND_API_SKYCOVERAGE].intValue
                ,precipitation: json[kSTRING_BACKGROUND_API_PRECIPITATION].stringValue
                ,weather: json[kSTRING_BACKGROUND_API_WEATHER].stringValue
                ,windSpeed: json[kSTRING_BACKGROUND_API_WINDSPEED].intValue
            )
            self.sceneView.backgroundsModel = self.backgroundModel
        }, errorHandler: { (statusCode, errorMessage) in
            indicator.stopAnimating()
            let errorAlert: UIAlertController = .alert("code: \(statusCode)",errorMessage: errorMessage)
            errorAlert.add(kSTRING_TITLE_CONFIRM, handler: { (handling) in
                self.errorHandling(statusCode)
            }).show(self)
        })
    }
    
    private func temperrauresAPI() {
        let indicator: NVActivityIndicatorView = NVIndicatiorView.instance(self)
        indicator.startAnimating()
        
        OOTWeatherService.shared.get(urlPath: .temperatures, handler: {(json) in
            indicator.stopAnimating()
            
            self.temperaturesModel = TemperaturesModel(
                current: json[kSTRING_TEMPERATURES_API_CURRENT].stringValue
                ,maximum: json[kSTRING_TEMPERATURES_API_MAXIMUM].stringValue
                ,minimum: json[kSTRING_TEMPERATURES_API_MINIMUM].stringValue
                ,today: json[kSTRING_TEMPERATURES_API_TODAY].arrayValue.map({ $0.intValue})
                ,tomorrow: json[kSTRING_TEMPERATURES_API_TOMORROW].arrayValue.map({ $0.intValue}))
            self.locationTimeView.temperatures = self.temperaturesModel
            self.initUI()
        }, errorHandler: { (statusCode, errorMessage) in
            indicator.stopAnimating()
            let errorAlert: UIAlertController = .alert("code: \(statusCode)",errorMessage: errorMessage)
            errorAlert.add(kSTRING_TITLE_CONFIRM, handler: { (handling) in
                self.errorHandling(statusCode)
            }).show(self)
        })
    }
}

// MAKR : error handling
extension OOTWeatherViewCotnroller {
    private func errorHandling(_ statusCode: Int) {
        switch statusCode {
            case 100 ... 199:
                print("")
            case 300 ... 399:
                print("")
            case 400 ... 499:
                print("")
            case 500 ... 599:
                print("")
            default:
                print("")
        }
        exit(0)
    }
}

// MARK: Observer
extension OOTWeatherViewCotnroller: LocationObserver, TimeObserver {
    func updateLocation(_ notyValue: String) {
        locationTimeView.locationText = notyValue
    }
    func updateTime(_ notyValue: String) {
        locationTimeView.nowTimeText = notyValue
    }
}


// MAKR: Drop animation
extension OOTWeatherViewCotnroller {
    
    /// drop animation
    private func initDropAnimation() {
        
        guard let backgroundModel = self.backgroundModel else {
            return
        }
        
        let amount = DropAnimationManager.getCreateAmountTime(skyCoverage: backgroundModel.skyCoverage)
        
        dropTimer.invalidate()
        dropTimer = Timer.scheduledTimer(timeInterval: amount, target: self, selector: #selector(setupDropView), userInfo: [], repeats: true)

    }
    
    @objc private func setupDropView() {
        let dropView = DropAnimationView()
        dropView.backgroundsModel = self.backgroundModel
        
        self.sceneView.addSubViews(dropView)
        let startX = DropAnimationManager.getStartX()
        dropView.frame = CGRect(x: startX, y: -20, width: 10, height: 10)
        startAnimation(to: dropView)
    }
    
    private func startAnimation(to animationView: UIView) {
        
        guard let dropType = self.backgroundModel?.precipitation else {
            return
        }
        
        guard let dropSeep = DropAnimationManager.dropSeep(rawValue: dropType)?.seep else {
            return
        }
        
        UIView.animate(withDuration: dropSeep, animations: {
            animationView.center.x -= 200
            animationView.center.y += self.sceneView.frame.height + 40
        }, completion: { (finished: Bool) in
            if finished {
                animationView.removeFromSuperview()
            }
        })
    }
}

// MAKR: cloud Animation
extension OOTWeatherViewCotnroller {
 
    private func initCloudAnimation() {
        guard let backgroundModel = self.backgroundModel else {
            return
        }
        
        let cloudCount = CloudAnimationManager.getCreateCloudCount(skyCoverage: backgroundModel.skyCoverage)
        
        for _ in 1 ... cloudCount {
            setupCloud()
        }
    }
    
    private func setupCloud() {
        let cloudView = CloudAnimationView()
        let cloudSize = CloudAnimationManager.getCloundSize()
        let cloudXPoint = CloudAnimationManager.makeCloudXPoint()
        let cloudYPoint = CloudAnimationManager.makeCloudYPoint()
        
        self.sceneView.addSubViews(cloudView)
        
        cloudView.alpha = CloudAnimationManager.getRandAlpha(cloudSize: cloudSize)
        
        cloudView.snp.makeConstraints { make -> Void in
            make.size.equalTo(cloudSize)
            
            make.top.equalTo(sceneView).offset(cloudYPoint)
            make.left.equalTo(sceneView).offset(cloudXPoint)
        }
        
        UIView.animate(withDuration: TimeInterval(CloudAnimationManager.getMoveSpeed()), animations: {
            
            cloudView.center.x -= UIScreen.main.bounds.width / 2
            
        }, completion: { (finished: Bool) in
            if finished {
                cloudView.removeFromSuperview()
                self.setupCloud()
            }
        })
    }
}
