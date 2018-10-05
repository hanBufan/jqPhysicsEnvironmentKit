//
//  UIVector2D.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/7/27.
//

#if os(iOS) || os(tvOS)

import Foundation

public struct UIVector2D {
    
    public var angleOn_xOy: UIAngle2D
    
    public var directionAngleValueOn_xOy_degree: CGFloat {
        didSet {
            while self.directionAngleValueOn_xOy_degree > 360 {
                self.directionAngleValueOn_xOy_degree -= 360
            }
            while self.directionAngleValueOn_xOy_degree < 0 {
                self.directionAngleValueOn_xOy_degree += 360
            }
        }
    }

    public var directionAngleValueOn_xOy_radian: CGFloat {
        didSet {
            while self.directionAngleValueOn_xOy_radian > 2.0 * CGFloat(Math.pi) {
                self.directionAngleValueOn_xOy_radian -= 2.0 * CGFloat(Math.pi)
            }
            while self.directionAngleValueOn_xOy_radian < 0 {
                self.directionAngleValueOn_xOy_radian += 2.0 * CGFloat(Math.pi)
            }
        }
    }

    public var x: CGFloat
    public var y: CGFloat

    public var vectorValue: CGFloat
    
    public var point: CGPoint

    public init(withValue value: CGFloat, withAngle angle: UIAngle2D) {
        self.angleOn_xOy = angle
        self.directionAngleValueOn_xOy_degree = angle.degreeValue
        self.directionAngleValueOn_xOy_radian = angle.radValue
        self.vectorValue = value
        self.x = self.vectorValue * Math.cos_rad(directionAngleValueOn_xOy_radian)
        self.y = self.vectorValue * Math.sin_rad(directionAngleValueOn_xOy_radian)
        self.point = CGPoint(x: self.x, y: self.y)
        if self.vectorValue < 0 {
            assertionFailure("jqSwiftPhysicsEnvironment Error: vectorValue cannot less then 0")
        }
    }

    public init(withValue value: CGFloat, withRad rad: CGFloat) {
        self.vectorValue = value
        self.angleOn_xOy = UIAngle2D.init(withRadian: rad)
        self.directionAngleValueOn_xOy_radian = rad
        self.directionAngleValueOn_xOy_degree = self.angleOn_xOy.degreeValue
        self.x = self.vectorValue * Math.cos_rad(directionAngleValueOn_xOy_radian)
        self.y = self.vectorValue * Math.sin_rad(directionAngleValueOn_xOy_radian)
        self.point = CGPoint(x: self.x, y: self.y)
        if self.vectorValue < 0 {
            assertionFailure("jqSwiftPhysicsEnvironment Error: vectorValue cannot less then 0")
        }
    }

    public init(withValue value: CGFloat, withDegree degree: CGFloat) {
        self.vectorValue = value
        self.angleOn_xOy = UIAngle2D.init(withDegree: degree)
        self.directionAngleValueOn_xOy_degree = degree
        self.directionAngleValueOn_xOy_radian = self.angleOn_xOy.radValue
        self.x = self.vectorValue * Math.cos_rad(directionAngleValueOn_xOy_radian)
        self.y = self.vectorValue * Math.sin_rad(directionAngleValueOn_xOy_radian)
        self.point = CGPoint(x: self.x, y: self.y)
        if self.vectorValue < 0 {
            assertionFailure("jqSwiftPhysicsEnvironment Error: vectorValue cannot less then 0")
        }
    }

    public init(withX x: CGFloat, withY y: CGFloat) {
        self.vectorValue = Math.sqrt(x * x + y * y)!
        self.x = x
        self.y = y
        if x > 0 && y > 0 {
            self.directionAngleValueOn_xOy_radian = Math.arctan_rad(y / x)
        } else if x < 0 && y > 0 {
            self.directionAngleValueOn_xOy_radian = Math.arctan_rad(-x / y) + CGFloat(Math.pi) / 2
        } else if x > 0 && y < 0 {
            self.directionAngleValueOn_xOy_radian = Math.arctan_rad(-x / y) + CGFloat(Math.pi) / 2 * 3
        } else if x < 0 && y < 0 {
            self.directionAngleValueOn_xOy_radian = Math.arctan_rad(y / x) + CGFloat(Math.pi)
        } else if x == 0 && y != 0 {
            self.directionAngleValueOn_xOy_radian = y > 0 ? CGFloat(Math.pi) / 2 : CGFloat(Math.pi) / 2 * 3
        } else if x != 0 && y == 0 {
            self.directionAngleValueOn_xOy_radian = x > 0 ? 0 : CGFloat(Math.pi)
        } else {
            self.directionAngleValueOn_xOy_radian = 0
        }
        self.directionAngleValueOn_xOy_degree = Math.radianToDegree(self.directionAngleValueOn_xOy_radian)
        self.angleOn_xOy = UIAngle2D(withRadian: self.directionAngleValueOn_xOy_radian)
        self.point = CGPoint(x: self.x, y: self.y)
        if self.vectorValue < 0 {
            assertionFailure("jqSwiftPhysicsEnvironment Error: vectorValue cannot less then 0")
        }
    }
    
    public init(withPoint point: CGPoint) {
        self.point = point
        self.x = point.x
        self.y = point.y
        let x = point.x
        let y = point.y
        self.vectorValue = Math.sqrt(x * x + y * y)!
        if x > 0 && y > 0 {
            self.directionAngleValueOn_xOy_radian = Math.arctan_rad(y / x)
        } else if x < 0 && y > 0 {
            self.directionAngleValueOn_xOy_radian = Math.arctan_rad(-x / y) + CGFloat(Math.pi) / 2
        } else if x > 0 && y < 0 {
            self.directionAngleValueOn_xOy_radian = Math.arctan_rad(-x / y) + CGFloat(Math.pi) / 2 * 3
        } else if x < 0 && y < 0 {
            self.directionAngleValueOn_xOy_radian = Math.arctan_rad(y / x) + CGFloat(Math.pi)
        } else if x == 0 && y != 0 {
            self.directionAngleValueOn_xOy_radian = y > 0 ? CGFloat(Math.pi) / 2 : CGFloat(Math.pi) / 2 * 3
        } else if x != 0 && y == 0 {
            self.directionAngleValueOn_xOy_radian = x > 0 ? 0 : CGFloat(Math.pi)
        } else {
            self.directionAngleValueOn_xOy_radian = 0
        }
        self.directionAngleValueOn_xOy_degree = Math.radianToDegree(self.directionAngleValueOn_xOy_radian)
        self.angleOn_xOy = UIAngle2D(withRadian: self.directionAngleValueOn_xOy_radian)
        if self.vectorValue < 0 {
            assertionFailure("jqSwiftPhysicsEnvironment Error: vectorValue cannot less then 0")
        }
    }

    public func lx() -> CGFloat {
        return self.vectorValue * Math.cos_rad(directionAngleValueOn_xOy_radian)
    }

    public func ly() -> CGFloat {
        return self.vectorValue * Math.sin_rad(directionAngleValueOn_xOy_radian)
    }

    public func antiDirectionVector() -> UIVector2D {
        return UIVector2D.init(withValue: self.vectorValue, withRad: self.directionAngleValueOn_xOy_radian + CGFloat(Math.pi))
    }

}

#endif
