//
//  UISheetAlertController.swift
//  AdvancedSwiftExtension
//
//  Created by Jefferson Qin on 2018/7/21.
//  Copyright © 2018 Jefferson Qin. All rights reserved.
//

#if os(iOS)

import Foundation
import UIKit

public struct UISheetAlertController {
    
    public var alertController: UICustomAlertController
    
    public var actions: [UIAlertAction]? = nil
    
    public func presentAction(withViewController viewcontroller: UIViewController, withAnimated animated: Bool, withCompletion completion:(() -> Void)?) {
        alertController.presentAction(withViewController: viewcontroller, withAnimated: animated, withCompletion: completion)
    }
    
    public mutating func addCustomAction(withAction action: UICustomAlertAction) {
        alertController.addCustomAction(withAction: action)
        actions == nil ? actions = [action.action] : actions?.append(action.action)
    }
    
    public mutating func addAction(withAction action: UIAlertAction) {
        alertController.addAction(withAction: action)
        actions == nil ? actions = [action] : actions?.append(action)
    }
    
    public init(withTitle title: String, ofMessage message: String) {
        self.alertController = UICustomAlertController(withTitle: title, ofMessage: message, ofStyle: .actionSheet)
    }
    
}

#endif
