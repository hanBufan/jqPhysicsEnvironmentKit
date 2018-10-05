//
//  UCGFloatOperatorExtension.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/9/24.
//

#if os(iOS) || os(tvOS)

import Foundation

public extension UCGFloat {
    
    public static func + (_ ucgf1: UCGFloat, _ ucgf2: UCGFloat) -> CGFloat {
        return ucgf1.getValue() + ucgf2.getValue()
    }
    
    public static func - (_ ucgf1: UCGFloat, _ ucgf2: UCGFloat) -> CGFloat {
        return ucgf1.getValue() - ucgf2.getValue()
    }
    
    public static func * (_ ucgf1: UCGFloat, _ ucgf2: UCGFloat) -> CGFloat {
        return ucgf1.getValue() * ucgf2.getValue()
    }
    
    public static func / (_ ucgf1: UCGFloat, _ ucgf2: UCGFloat) -> CGFloat {
        return ucgf1.getValue() / ucgf2.getValue()
    }
    
    public static func + (_ cgf1: CGFloat, _ ucgf2: UCGFloat) -> CGFloat {
        return cgf1 + ucgf2.getValue()
    }
    
    public static func - (_ cgf1: CGFloat, _ ucgf2: UCGFloat) -> CGFloat {
        return cgf1 - ucgf2.getValue()
    }
    
    public static func * (_ cgf1: CGFloat, _ ucgf2: UCGFloat) -> CGFloat {
        return cgf1 * ucgf2.getValue()
    }
    
    public static func / (_ cgf1: CGFloat, _ ucgf2: UCGFloat) -> CGFloat {
        return cgf1 / ucgf2.getValue()
    }
    
    public static func + (_ ucgf1: UCGFloat, _ cgf2: CGFloat) -> CGFloat {
        return ucgf1.getValue() + cgf2
    }
    
    public static func - (_ ucgf1: UCGFloat, _ cgf2: CGFloat) -> CGFloat {
        return ucgf1.getValue() - cgf2
    }
    
    public static func * (_ ucgf1: UCGFloat, _ cgf2: CGFloat) -> CGFloat {
        return ucgf1.getValue() * cgf2
    }
    
    public static func / (_ ucgf1: UCGFloat, _ cgf2: CGFloat) -> CGFloat {
        return ucgf1.getValue() / cgf2
    }
    
}

#endif
