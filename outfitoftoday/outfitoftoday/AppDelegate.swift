//
//  AppDelegate.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 6. 17..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let orientation: UIPageViewControllerNavigationOrientation = .vertical
//        let orientation: UIPageViewControllerNavigationOrientation = .horizontal
//        window?.rootViewController = RootPageViewController(transitionStyle: .scroll, navigationOrientation: orientation, options: nil)
        window?.rootViewController = OOTPageViewController(transitionStyle: .scroll, navigationOrientation: orientation, options: nil)
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

