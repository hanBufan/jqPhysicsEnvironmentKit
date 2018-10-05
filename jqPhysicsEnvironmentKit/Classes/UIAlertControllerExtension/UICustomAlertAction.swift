//
//  UICustomAlertAction.swift
//  AdvancedSwiftExtension
//
//  Created by Jefferson Qin on 2018/7/21.
//  Copyright © 2018 Jefferson Qin. All rights reserved.
//

#if os(iOS)

import Foundation
import UIKit

public struct UICustomAlertAction {
    
    public var action: UIAlertAction
    
    public init(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)? = nil) {
        self.action = UIAlertAction(title: title, style: style, handler: handler)
    }
    
}

#endif
