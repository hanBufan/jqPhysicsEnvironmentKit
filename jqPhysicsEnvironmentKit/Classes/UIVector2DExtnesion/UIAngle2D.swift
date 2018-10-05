//
//  UIAngle2D.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/7/27.
//

#if os(iOS) || os(tvOS)

import Foundation

public struct UIAngle2D {
    
    public var radValue: CGFloat {
        didSet {
            while self.radValue > 2.0 * CGFloat(Math.pi) {
                self.radValue -= 2.0 * CGFloat(Math.pi)
            }
            while self.radValue < 0 {
                self.radValue += 2.0 * CGFloat(Math.pi)
            }
        }
    }
    
    public var degreeValue: CGFloat {
        didSet {
            while self.degreeValue > 360 {
                self.degreeValue -= 360
            }
            while self.degreeValue < 0 {
                self.degreeValue += 360
            }
        }
    }
    
    public func getAntiDirectionAngleOn_xOy() -> UIAngle2D {
        return UIAngle2D.init(withRadian: self.radValue + CGFloat(Math.pi))
    }
    
    public init(withDegree degree: CGFloat) {
        self.degreeValue = degree
        self.radValue = Math.degreeToRadian(degree)
    }
    
    public init(withRadian rad: CGFloat) {
        self.radValue = rad
        self.degreeValue = Math.radianToDegree(rad)
    }
    
}

#endif
