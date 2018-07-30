//
//  AlartController+.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 27..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    @discardableResult
    public static func alert(_ title: String = "", message: String) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alertController
    }
    
    @discardableResult
    public static func alert(_ title: String = "", dataMessage: Data?) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: dataMessage?.convertString(), preferredStyle: .alert)
        return alertController
    }
    
    @discardableResult
    public static func alert(_ title: String = "", errorMessage: Error?) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: errorMessage?.localizedDescription, preferredStyle: .alert)
        return alertController
    }
    
    //action
    
    private func action(_ title: String, style: UIAlertActionStyle, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController{
        self.addAction(UIAlertAction(title: title, style: .default, handler: { (_) in
            handler?(self)
        }))
        return self
    }
    
    @discardableResult
    public func add(_ title: String, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController{
        return self.action(title, style: .default, handler: handler)
    }
    
    @discardableResult
    public func cancel(_ title: String, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController{
        return self.action(title, style: .cancel, handler: handler)
    }
    
    
    // show
    @discardableResult
    public func show(_ viewController: UIViewController) -> UIAlertController{
        DispatchQueue.main.async {
            viewController.present(self, animated: true, completion: nil)
        }
        return self
    }
}
