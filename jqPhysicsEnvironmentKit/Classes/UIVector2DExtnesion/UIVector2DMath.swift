//
//  UIVectorMath.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/7/27.
//

#if os(iOS) || os(tvOS)

import Foundation

public class UIVectorMath {
    
    private init() {}
    
    public static func vectorPlus(_ v1: UIVector2D, _ v2: UIVector2D) -> UIVector2D {
        
        let x = v1.lx() + v2.lx()
        let y = v1.ly() + v2.ly()
        let l = Math.sqrt(x * x + y * y)
        var rad: CGFloat
        if x > 0 && y > 0 {
            rad = Math.arctan_rad(y / x)
        } else if x < 0 && y > 0 {
            rad = Math.arctan_rad(-x / y) + CGFloat(Math.pi) / 2
        } else if x > 0 && y < 0 {
            rad = Math.arctan_rad(-x / y) + CGFloat(Math.pi) / 2 * 3
        } else if x < 0 && y < 0 {
            rad = Math.arctan_rad(y / x) + CGFloat(Math.pi)
        } else if x == 0 && y != 0 {
            rad = y > 0 ? CGFloat(Math.pi) / 2 : CGFloat(Math.pi) / 2 * 3
        } else if x != 0 && y == 0 {
            rad = x > 0 ? 0 : CGFloat(Math.pi)
        } else {
            rad = 0
        }
        return UIVector2D(withValue: l!, withRad: rad)
    }
    
    public static func vectorMinus(_ v1: UIVector2D, _ v2: UIVector2D) -> UIVector2D {
        return self.vectorPlus(v1, v2.antiDirectionVector())
    }
    
    public static func vectorDotProduct(_ v1: UIVector2D, _ v2: UIVector2D) -> CGFloat {
        let rad1 = v1.directionAngleValueOn_xOy_radian
        let rad2 = v2.directionAngleValueOn_xOy_radian
        let absRad = Math.abs(rad1 - rad2)
        let value = Math.abs(v1.vectorValue) * Math.abs(v2.vectorValue) * Math.cos_rad(absRad)
        return value
    }
    
    public static func vectorCrossProductValue(_ v1: UIVector2D, _ v2: UIVector2D) -> CGFloat {
        let rad1 = v1.directionAngleValueOn_xOy_radian
        let rad2 = v2.directionAngleValueOn_xOy_radian
        let absRad = Math.abs(rad1 - rad2)
        let value = Math.abs(v1.vectorValue) * Math.abs(v2.vectorValue) * Math.sin_rad(absRad)
        return value
    }
    
    public static func vectorTimesNumber(_ v: UIVector2D, _ num: CGFloat) -> UIVector2D {
        return num > 0 ? UIVector2D.init(withValue: v.vectorValue * num, withRad: v.directionAngleValueOn_xOy_radian) : (num == 0 ? UIVector2D.init(withValue: 0, withRad: 0) : UIVector2D.init(withValue: v.vectorValue * Math.abs(num), withRad: v.angleOn_xOy.getAntiDirectionAngleOn_xOy().radValue))
    }
    
    public static func vectorDivideNumber(_ v: UIVector2D, _ num: CGFloat) -> UIVector2D {
        return num > 0 ? UIVector2D.init(withValue: v.vectorValue / num, withRad: v.directionAngleValueOn_xOy_radian) : (num == 0 ? UIVector2D.init(withValue: 0, withRad: 0) : UIVector2D.init(withValue: v.vectorValue / Math.abs(num), withRad: v.angleOn_xOy.getAntiDirectionAngleOn_xOy().radValue))
    }
    
}

#endif
