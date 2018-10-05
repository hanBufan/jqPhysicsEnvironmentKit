//
//  UICustomAlertController.swift
//  AdvancedSwiftExtension
//
//  Created by Jefferson Qin on 2018/7/21.
//  Copyright © 2018 Jefferson Qin. All rights reserved.
//

#if os(iOS)

import Foundation
import UIKit

public struct UICustomAlertController {

    public var alertController: UIAlertController
    
    public var actions: [UIAlertAction]? = nil
    
    public func presentAction(withViewController viewcontroller: UIViewController, withAnimated animated: Bool, withCompletion completion:(() -> Void)?) {
        viewcontroller.present(alertController, animated: animated, completion: completion)
    }
    
    public mutating func addCustomAction(withAction action: UICustomAlertAction) {
        alertController.addAction(action.action)
        actions == nil ? actions = [action.action] : actions?.append(action.action)
    }
    
    public mutating func addAction(withAction action: UIAlertAction) {
        alertController.addAction(action)
        actions == nil ? actions = [action] : actions?.append(action)
    }
    
    public init(withTitle title: String, ofMessage message: String, ofStyle style: UIAlertControllerStyle) {
        self.alertController = UIAlertController(title: title, message: message, preferredStyle: style)
    }
    
}

#endif
