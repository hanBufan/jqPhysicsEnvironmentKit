//
//  UIDestructiveAlertAction.swift
//  AdvancedSwiftExtension
//
//  Created by Jefferson Qin on 2018/7/21.
//  Copyright © 2018 Jefferson Qin. All rights reserved.
//

#if os(iOS)

import Foundation
import UIKit

public struct UIDestructiveAlertAction {
    
    public var customAction: UICustomAlertAction
    
    public init(title: String?, handler: ((UIAlertAction) -> Void)? = nil) {
        self.customAction = UICustomAlertAction(title: title, style: .destructive, handler: handler)
    }
    
}

#endif
