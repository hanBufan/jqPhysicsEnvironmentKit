//
//  UIAngle2DOperationExtension.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/9/23.
//

#if os(iOS) || os(tvOS)

import Foundation

public extension UIAngle2D {
    
    public static func + (_ agl1: UIAngle2D, _ agl2: UIAngle2D) -> UIAngle2D {
        return self.init(withRadian: agl1.radValue + agl2.radValue)
    }
    
    public static func - (_ agl1: UIAngle2D, _ agl2: UIAngle2D) -> UIAngle2D {
        return self.init(withRadian: agl1.radValue - agl2.radValue)
    }
    
    public static func == (_ agl1: UIAngle2D, _ agl2: UIAngle2D) -> Bool {
        return (agl1.radValue) == (agl2.radValue)
    }
    
    public func reinitToFirstCycle() -> UIAngle2D {
        var deg = self.degreeValue
        while deg >= 360    {deg -= 360}
        while deg < 0       {deg += 360}
        return UIAngle2D.init(withDegree: deg)
    }
    
    public static func ~= (_ agl1: UIAngle2D, _ agl2: UIAngle2D) -> Bool {
        return Math.abs(agl1.reinitToFirstCycle().degreeValue - agl2.reinitToFirstCycle().degreeValue) <= jqPhysicsEnvironmentConfiguration.UIAngle2DDegreeApproximateAbsoluteValue
    }
    
}

#endif
