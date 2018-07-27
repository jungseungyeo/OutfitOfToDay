//
//  PageViewControler.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 26..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController {

    private let orientation: UIPageViewControllerNavigationOrientation = .vertical
    
    private var viewcontrollerList: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ootPageViewController = OOTPageViewController(transitionStyle: .scroll, navigationOrientation: orientation, options: nil)
        viewcontrollerList.append(ootPageViewController)
        
        self.dataSource = self
        if let first = viewcontrollerList.first {
            self.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension RootPageViewController: UIPageViewControllerDataSource {
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
