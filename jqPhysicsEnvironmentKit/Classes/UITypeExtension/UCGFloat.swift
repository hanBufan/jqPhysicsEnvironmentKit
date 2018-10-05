//
//  UCGFloat.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/8/17.
//


#if os(iOS) || os(tvOS)

import Foundation

public struct UCGFloat {
    
    private private(set) var value: CGFloat
    
    public init(_ value: CGFloat) {
        self.value = Math.abs(value)
    }
    
    public init(_ value: Double) {
        self.value = Math.abs(CGFloat(value))
    }
    
    public init(_ value: Int) {
        self.value = Math.abs(CGFloat(value))
    }
    
    public init(_ value: UInt) {
        self.value = Math.abs(CGFloat(value))
    }
    
    public init(_ value: UInt32) {
        self.value = Math.abs(CGFloat(value))
    }
    
    public init(_ value: Int32) {
        self.value = Math.abs(CGFloat(value))
    }
    
    public mutating func setValue(_ value: CGFloat) {
        self.value = Math.abs(value)
    }
    
    public mutating func setValue(_ value: Double) {
        self.value = Math.abs(CGFloat(value))
    }
    
    public mutating func setValue(_ value: Int) {
        self.value = Math.abs(CGFloat(value))
    }
    
    public mutating func setValue(_ value: UInt) {
        self.value = Math.abs(CGFloat(value))
    }
    
    public mutating func setValue(_ value: UInt32) {
        self.value = Math.abs(CGFloat(value))
    }
    
    public mutating func setValue(_ value: Int32) {
        self.value = Math.abs(CGFloat(value))
    }
    
    public func getValue() -> CGFloat {
        return value
    }
    
}

public extension CGFloat {
    
    public init (_ UCGF: UCGFloat) {
        self.init(UCGF.getValue())
    }
    
}

public extension Int {
    
    public init (_ UCGF: UCGFloat) {
        self.init(UCGF.getValue())
    }
    
}

public extension Double {
    
    public init (_ UCGF: UCGFloat) {
        self.init(UCGF.getValue())
    }
    
}

public extension Float {
    
    public init (_ UCGF: UCGFloat) {
        self.init(UCGF.getValue())
    }
    
}

#endif
