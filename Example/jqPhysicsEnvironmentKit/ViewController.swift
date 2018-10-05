//
//  ViewController.swift
//  jqPhysicsEnvironmentKit
//
//  Created by jeffesonQin on 10/04/2018.
//  Copyright (c) 2018 jeffesonQin. All rights reserved.
//

import UIKit
import jqPhysicsEnvironmentKit

postfix operator -*
postfix operator -/
postfix operator -^
prefix operator -*
prefix operator -/
prefix operator -^
infix operator /-/
infix operator /|/

infix operator ^=
infix operator ~^=
infix operator |=|
infix operator |~|
infix operator ~=
infix operator ==

infix operator +
infix operator -

class ViewController: UIViewController {
    
    func test() {
        print(1.isEven)
        let v1 = UIVector2D(withValue: 2, withDegree: 300)
        print("lx: \(v1.lx())")
        print("ly: \(v1.ly())")
        let v2  = UIVector2D(withValue: 2, withDegree: -180)
        print(UIVectorMath.vectorPlus(v1, v2))
        let v3 = UIVector2D(withValue: 1.414, withDegree: 135)
        let v4 = UIVector2D(withValue: 2.73, withDegree: 0)
        print(UIVectorMath.vectorPlus(v3, v4))
        let v5 = UIVector2D(withValue: 1.414, withDegree: 225)
        let v6 = UIVector2D(withValue: 2, withDegree: 30)
        print(UIVectorMath.vectorPlus(v5, v6))
        print(v5 + v6)
        
        print(UIVector2D.init(withValue: 2, withRad: 0) * -2)
        
        print("aJFHDSdkjSJBFUDIJNKZnhidusgf".downerCase)
        print("SDRTYhnsjkfjhdsyfuj".upperCase)
        print("abcdefghIjkLmnOpqrstUvwxyz".containsContinuouslyIgnoringUpperOrDownerCase("HIjKlMnoP"))
        print("0123456789".containsUnContinuously("1679"))
        print("0123456789".containsUnContinuously("1670"))
        
        let acceleration = jqPhysicsQuantity2D.init(withVector: UIVector2D.init(withPoint: CGPoint.init(x: 6, y: 8)), withBasicQuantitiesIndexArray: [1, 0, -2, 0, 0, 0, 0])
        let weight = jqPhysicsQuantity2D.init(withScalarValueUnsigned: UCGFloat.init(-10), withBasicQuantitesIndexArray: [0,1,0,0,0,0,0])
        print(acceleration)
        print(weight)
        print((weight.value as! UCGFloat).getValue())
        
        let pq_1 = jqPhysicsQuantity2D.init(withScalarValueUnsigned: UCGFloat.init(10), withBasicQuantitesIndexArray: [0,1,0,0,0,0,0])
        let pq_2 = jqPhysicsQuantity2D.init(withVector: UIVector2D.init(withValue: 10.0, withRad: CGFloat(Math.pi)), withBasicQuantitiesIndexArray: [1,0,0,0,0,0,0])
        print(pq_1 |=| pq_2)
        print(weight ~= pq_1)
        print(pq_1 &= acceleration)
        //        let uivector2D_failure = UIVector2D.init(withValue: -10.0, withRad: 0.0)
        let ucgf_cgf = CGFloat(UCGFloat.init(1.0))
        print(ucgf_cgf)
        
        //        let a = UCGFloat(1.0)
        let v0 = jqPhysicsQuantity2D.init(withVector: UIVector2D.init(withValue: 10, withDegree: 30), withBasicQuantitiesIndexArray: [1,0,-1,0,0,0,0])
        let a = jqPhysicsQuantity2D.init(withVector: UIVector2D.init(withValue: 2, withDegree: 30), withBasicQuantitiesIndexArray: [1,0,-2,0,0,0,0])
        let t1 = jqPhysicsQuantity2D.init(withScalarValueSigned: 1, withBasicQuantitiesIndexArray: [0,0,1,0,0,0,0])
        let t2 = jqPhysicsQuantity2D.init(withScalarValueSigned: 2, withBasicQuantitiesIndexArray: [0,0,1,0,0,0,0])
        print(a)
        print((t1 + t2)!)
        print(((t1 + t2)! * a)!)
        print(v0)
        print(((((t1 + t2)! * 2)! * a)! + (v0 * 2)!)?.rawValueOfThePhysicsQuantity ?? 0)
        //        print(t1 / t2)
        let pq0 = jqPhysicsQuantity2D.init(withScalarValueSigned: 0.0, withBasicQuantitiesIndexArray: [1,1,1,1,1,1,1])
        let pq1 = jqPhysicsQuantity2D.init(withScalarValueSigned: 3, withBasicQuantitiesIndexArray: [0,1,0,0,0,0,0])
        let pq2 = jqPhysicsQuantity2D.init(withScalarValueSigned: 6, withBasicQuantitiesIndexArray: [0,1,0,0,0,0,0])
        let pq3 = jqPhysicsQuantity2D.init(withScalarValueSigned: 9, withBasicQuantitiesIndexArray: [1,0,0,0,0,0,0])
        let pq4 = jqPhysicsQuantity2D.init(withScalarValueUnsigned: UCGFloat(4), withBasicQuantitesIndexArray: [0,1,0,0,0,0,0])
        let pq5 = jqPhysicsQuantity2D.init(withVector: UIVector2D.init(withX: 4, withY: 3), withBasicQuantitiesIndexArray: [0,1,0,0,0,0,0])
        let pq6 = jqPhysicsQuantity2D.init(withVector: UIVector2D.init(withX: 8, withY: 6), withBasicQuantitiesIndexArray: [0,3,3,3,3,3,3])
        let pq7 = jqPhysicsQuantity2D.init(withVector: UIVector2D.init(withX: 9, withY: 6), withBasicQuantitiesIndexArray: [8,8,8,8,8,8,8])
        let vector_1 = UIVector2D.init(withX: 4, withY: 3)
        let vector_2 = UIVector2D.init(withX: 9, withY: 6)
        print("pq1 + pq0 = \((pq1 + pq0) ?? pq0)\n")
        print("pq1 + pq2 = \((pq1 + pq2) ?? pq0)\n")
        print("pq1 + pq3 = \((pq1 + pq3) ?? pq0)\n")
        print("pq1 + pq4 = \((pq1 + pq4) ?? pq0)\n")
        print("pq1 + pq5 = \((pq1 + pq5) ?? pq0)\n")
        print("pq1 - pq0 = \((pq1 - pq0) ?? pq0)\n")
        print("pq1 - pq2 = \((pq1 - pq2) ?? pq0)\n")
        print("pq1 - pq3 = \((pq1 - pq3) ?? pq0)\n")
        print("pq1 - pq4 = \((pq1 - pq4) ?? pq0)\n")
        print("pq1 - pq5 = \((pq1 - pq5) ?? pq0)\n")
        print("pq1 + 1 = \(String(describing: pq1 + 1))\n")
        print("pq1 - 1 = \(String(describing: pq1 - 1))\n")
        print("pq1 * pq2 = \(String(describing: pq1 * pq2))\n")
        print("pq1 * pq3 = \(String(describing: pq1 * pq3))\n")
        print("pq1 * pq4 = \(String(describing: pq1 * pq4))\n")
        print("pq1 * pq5 = \(String(describing: pq1 * pq5))\n")
        print("pq1 * 2 = \(String(describing: pq1 * 2))\n")
        print("2 * pq1 = \(String(describing: 2 * pq1))\n")
        print("pq5 * 2 = \(String(describing: pq5 * 2))\n")
        print("2 * pq5 = \(String(describing: 2 * pq5))\n")
        print("pq1 / 2 = \(String(describing: pq1 / 2))\n")
        print("2 / pq1 = \(String(describing: 2 / pq1))\n")
        print("pq5 / pq6 = \(String(describing: pq5 / pq6))")
        print("pq5 / pq7 = \(String(describing: pq5 / pq7))")
        print((pq5.value as! UIVector2D).angleOn_xOy == (pq6.value as! UIVector2D).angleOn_xOy)
        print(pq5.checkWhetherThePhysicsQuantityMakesSence && pq6.checkWhetherThePhysicsQuantityMakesSence)
        print((pq5 /-/ pq6)!)
        print(Math_BQIA.divide(pq5, pq6)!)
        print("pq7 / pq1 = \(String(describing: pq7 / pq1))")
        print("pq1 / pq3 = \(String(describing: pq1 / pq3))")
        print("pq1 / pq7 = \(String(describing: pq1 / pq7))")
        print("pq1 /|/ pq2 = \(String(describing: pq1 /|/ pq2))")
        print("2 ^ 0.5 = \(pow(2, 0.5))")
        print("pq5 ^ pq7 = \(String(describing: pq5 ^ pq7))")
        print("v1 ^ v2 = \(vector_1 ^ vector_2)")
        print("pq5 ^ 2 = \(String(describing: pq5 ^ 2))")
        print("2 ^ pq5 = \(String(describing: 2 ^ pq5))")
        print("pq1 ^ 2 = \(String(describing: pq1 ^ 2))")
        print("pq1 ^ pq2 = \(String(describing: pq1 ^ pq2))")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        test()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

