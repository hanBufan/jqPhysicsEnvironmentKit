//
//  UIVectorOperatorExtension.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/7/29.
//

#if os(iOS) || os(tvOS)

import Foundation
import UIKit

public extension UIVector2D {
    
    public static func + (_ v1: UIVector2D, _ v2: UIVector2D) -> UIVector2D {
        return UIVectorMath.vectorPlus(v1, v2)
    }
    
    public static func - (_ v1: UIVector2D, _ v2: UIVector2D) -> UIVector2D {
        return UIVectorMath.vectorMinus(v1, v2)
    }
    
    public static func * (_ v1: UIVector2D, _ v2: UIVector2D) -> CGFloat {
        return UIVectorMath.vectorDotProduct(v1, v2)
    }
    
    public static func ^ (_ v1: UIVector2D, _ v2: UIVector2D) -> CGFloat {
        return UIVectorMath.vectorCrossProductValue(v1, v2)
    }
    
    public static func * (_ v: UIVector2D, _ num: CGFloat) -> UIVector2D {
        return UIVectorMath.vectorTimesNumber(v, num)
    }
    
    public static func * (_ num: CGFloat, _ v: UIVector2D) -> UIVector2D {
        return UIVectorMath.vectorTimesNumber(v, num)
    }
    
    public static func / (_ v: UIVector2D, _ num: CGFloat) -> UIVector2D {
        return UIVectorMath.vectorDivideNumber(v, num)
    }
    
    public static prefix func - (_ v: UIVector2D) -> UIVector2D {
        return v.antiDirectionVector()
    }
    
    public static func += (_ v1: inout UIVector2D, _ v2: UIVector2D) {
        v1 = v1 + v2
    }
    
    public static func -= (_ v1: inout UIVector2D, _ v2: UIVector2D) {
        v1 = v1 - v2
    }
    
    public static func *= (_ v: inout UIVector2D, _ num: CGFloat) {
        v = v * num
    }
    
    public static func /= (_ v: inout UIVector2D, _ num: CGFloat) {
        v = v / num
    }
    
    // - MARK: This function returns the Bool that judge whether the two vectors are equal in direction
    public static func ^= (_ v1: UIVector2D, _ v2: UIVector2D) -> Bool {
        return v1.angleOn_xOy == v2.angleOn_xOy
    }
    
    // - MARK: This function returns the Bool that judge whether the two vectors are same in value
    public static func |=| (_ v1: UIVector2D, _ v2: UIVector2D) -> Bool {
        return v1.vectorValue == v2.vectorValue
    }
    
    // - MARK: This function returns whether two vectors are totally the same, both directions and values
    public static func == (_ v1: UIVector2D, _ v2: UIVector2D) -> Bool {
        return (v1 ^= v2) && (v1 |=| v2)
    }
    
    // - MARK: This function returns whether the two vectors are approximately equal in direction
    public static func ~^= (_ v1: UIVector2D, _ v2: UIVector2D) -> Bool {
        return v1.angleOn_xOy ~= v2.angleOn_xOy
    }
    
    // - MARK: This function returns whether the two vectors are approximately equal in value
    public static func |~| (_ v1: UIVector2D, _ v2: UIVector2D) -> Bool {
        return Math.abs(v1.vectorValue - v2.vectorValue) <= jqPhysicsEnvironmentConfiguration.UIVector2DVectorValueApproximateAbsoluteValue
    }
    
    // - MARK: This function returns whether the two vectors are approximately the same, approximately values are according to the values in the Configuration.swift, you can change it as long as you want.
    public static func ~= (_ v1: UIVector2D, _ v2: UIVector2D) -> Bool {
        return (v1 ~^= v2) && (v1 |~| v2)
    }
    
}

#endif
