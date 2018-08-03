//
//  OOTPageViewController.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 27..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class OOTPageViewController: UIPageViewController {
    
    private let viewcontrollerList: [UIViewController] = [OOTWeatherViewCotnroller(), OOTDetailWeatherVC()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let first = viewcontrollerList.first {
            self.setViewControllers([first], direction: .forward, animated: false, completion: nil)
        }
    }
	
	func goToTop() {
		if let first = viewcontrollerList.first {
			self.setViewControllers([first], direction: .reverse, animated: true, completion: nil)
		}
		
	}
}

extension OOTPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewcontrollerList.index(of: viewController) else { return nil }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        guard viewcontrollerList.count > previousIndex else { return nil }
        
        return viewcontrollerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewcontrollerList.index(of: viewController) else { return nil }
        
        let nextIndex = vcIndex + 1
        guard viewcontrollerList.count != nextIndex else { return nil }
        guard viewcontrollerList.count > nextIndex else { return nil }
        
        return viewcontrollerList[nextIndex]
    }
}
