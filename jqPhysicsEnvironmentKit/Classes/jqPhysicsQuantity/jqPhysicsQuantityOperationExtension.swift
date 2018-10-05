//
//  UIPhysicsQuantityOperationExtension.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/8/12.
//

#if os(iOS) || os(tvOS)

import Foundation

public extension jqPhysicsQuantity2D {
    
    public var rawValueOfThePhysicsQuantity: CGFloat? {
        if self.valueType == .vector {return (self.value as? UIVector2D)?.vectorValue}
        else if self.valueType == .scalar_signed {return self.value as? CGFloat}
        else if self.valueType == .scalar_unsigned {return (self.value as? UCGFloat)?.getValue()}
        else {return nil}
    }
    
    public var checkWhetherThePhysicsQuantityMakesSence: Bool {
        // - MARK: Check whether contains nil, or it cannot be calculated!
        if (self.basicQuantitiesIndexArray == nil) || (self.value == nil) || (self.valueType == nil) {
            return false
        }
        if self.rawValueOfThePhysicsQuantity == nil {return false}
        if self.basicQuantitiesIndexArray == [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] {
            assertionFailure("jqPhysicsEnvironment: bqia cannot be qure 0, because raw value cannot be a kind of physics quantity!")
            return false
        }
        return true
    }
    
    public mutating func to_scalar_signed() {
        let rawValue = self.rawValueOfThePhysicsQuantity
        self = jqPhysicsQuantity2D.init(withScalarValueSigned: rawValue, withBasicQuantitiesIndexArray: self.basicQuantitiesIndexArray)
    }
    
    public static func judgeIfTheSamePhysicsTypeOfPhysicsQuantity(_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> Bool {
        return pq1.basicQuantitiesIndexArray == pq2.basicQuantitiesIndexArray
    }
    
    public static func judgeIfTheSameDataStructureOfPhysicsQuantity(_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> Bool {
        return pq1.valueType == pq2.valueType
    }
    
    public static func judgeIfTheSameRawValueOfPhyscisQuantity(_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> Bool {
        return pq1.rawValueOfThePhysicsQuantity == pq2.rawValueOfThePhysicsQuantity
    }
    
    // - MARK: return if same raw value(mod value)
    public static func |=| (_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> Bool {
        return judgeIfTheSameRawValueOfPhyscisQuantity(pq1, pq2)
    }
    
    // - MARK: return if same physics type: BQIA
    public static func ~= (_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> Bool {
        return judgeIfTheSamePhysicsTypeOfPhysicsQuantity(pq1, pq2)
    }
    
    // - MARK: return if same data structure of the physics quantity: .valueType
    public static func &= (_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> Bool {
        return judgeIfTheSameDataStructureOfPhysicsQuantity(pq1, pq2)
    }
    
    // - MARK: return whether the two physics quantities are totally the same
    public static func == (_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> Bool {
        return (pq1 |=| pq2) && (pq1 ~= pq2) && (pq1 &= pq2)
    }
    
    public static func + (_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> jqPhysicsQuantity2D? {
        if !(pq1.checkWhetherThePhysicsQuantityMakesSence && pq2.checkWhetherThePhysicsQuantityMakesSence) {return nil}
        let vt = pq1.valueType! + pq2.valueType!
        let bqia = Math_BQIA.plus(pq1.basicQuantitiesIndexArray!, pq2.basicQuantitiesIndexArray!)
        if (vt == nil) || (bqia == nil) {return nil}
        var value: Any? = 0.0
        if (vt?.isScalar)! {value = pq1.rawValueOfThePhysicsQuantity! + pq2.rawValueOfThePhysicsQuantity!}
        else if (vt?.isVector)! {value = (pq1.value as! UIVector2D) + (pq2.value as! UIVector2D)}
        else {return nil}
        return jqPhysicsQuantity2D.init(withValue: value, withType: vt!, withBasicQuantitesArrayIndex: bqia!)
    }
    
    public static func + (_ pq: jqPhysicsQuantity2D, _ n: CGFloat) -> jqPhysicsQuantity2D? {
        return nil
    }
    
    public static func + (_ n: CGFloat, _ pq: jqPhysicsQuantity2D) -> jqPhysicsQuantity2D? {
        return nil
    }
    
    public static func - (_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> jqPhysicsQuantity2D? {
        if !(pq1.checkWhetherThePhysicsQuantityMakesSence && pq2.checkWhetherThePhysicsQuantityMakesSence) {return nil}
        let vt = pq1.valueType! - pq2.valueType!
        let bqia = Math_BQIA.minus(pq1.basicQuantitiesIndexArray!, pq2.basicQuantitiesIndexArray!)
        if (vt == nil) || (bqia == nil) {return nil}
        var value: Any? = 0.0
        if (vt?.isScalar)! {value = pq1.rawValueOfThePhysicsQuantity! - pq2.rawValueOfThePhysicsQuantity!}
        else if (vt?.isVector)! {value = (pq1.value as! UIVector2D) - (pq2.value as! UIVector2D)}
        else {return nil}
        return jqPhysicsQuantity2D.init(withValue: value, withType: vt!, withBasicQuantitesArrayIndex: bqia!)
    }
    
    public static func - (_ pq: jqPhysicsQuantity2D, _ n: CGFloat) -> jqPhysicsQuantity2D? {
        return nil
    }
    
    public static func - (_ n: CGFloat, _ pq: jqPhysicsQuantity2D) -> jqPhysicsQuantity2D? {
        return nil
    }
    
    public static func * (_ pq1: jqPhysicsQuantity2D, _ pq2:jqPhysicsQuantity2D) -> jqPhysicsQuantity2D? {
        if !(pq1.checkWhetherThePhysicsQuantityMakesSence && pq2.checkWhetherThePhysicsQuantityMakesSence) {return nil}
        let vt = pq1.valueType! * pq2.valueType!
        let bqia = Math_BQIA.multiply(pq1.basicQuantitiesIndexArray!, pq2.basicQuantitiesIndexArray!)
        if (vt == nil) || (bqia == nil) {return nil}
        let pVT1 = pq1.valueType!; let pVT2 = pq2.valueType!
        var value: Any? = 0.0
        if pVT1.isScalar && pVT2.isScalar {value = pq1.rawValueOfThePhysicsQuantity! * pq2.rawValueOfThePhysicsQuantity!}
        else if pVT1.isVector && pVT2.isScalar {value = (pq1.value as! UIVector2D) * pq2.rawValueOfThePhysicsQuantity!}
        else if pVT1.isScalar && pVT2.isVector {value = pq1.rawValueOfThePhysicsQuantity! * (pq2.value as! UIVector2D)}
        else if pVT1.isVector && pVT2.isVector {value = (pq1.value as! UIVector2D) * (pq2.value as! UIVector2D)}
        return jqPhysicsQuantity2D.init(withValue: value, withType: vt!, withBasicQuantitesArrayIndex: bqia!)
    }
    
    public static func * (_ pq: jqPhysicsQuantity2D, _ cgf: CGFloat) -> jqPhysicsQuantity2D? {
        if !(pq.checkWhetherThePhysicsQuantityMakesSence) {return nil}
        let vt = pq.valueType!-*
        let bqia = Math_BQIA.multiplyCGFloat(pq.basicQuantitiesIndexArray!)
        if (vt == nil) || (bqia == nil) {return nil}
        var value: Any? = 0.0
        if (pq.valueType?.isVector)! {value = (pq.value as! UIVector2D) * cgf}
        else if (pq.valueType?.isScalar)! {value = pq.rawValueOfThePhysicsQuantity! * cgf}
        else {return nil}
        return jqPhysicsQuantity2D.init(withValue: value, withType: vt!, withBasicQuantitesArrayIndex: bqia!)
    }
    
    public static func * (_ cgf: CGFloat, _ pq: jqPhysicsQuantity2D) -> jqPhysicsQuantity2D? {
        if !(pq.checkWhetherThePhysicsQuantityMakesSence) {return nil}
        let vt = -*pq.valueType!
        let bqia = Math_BQIA.multiplyCGFloat(pq.basicQuantitiesIndexArray!)
        if (vt == nil) || (bqia == nil) {return nil}
        var value: Any? = 0.0
        if (pq.valueType?.isVector)! {value = (pq.value as! UIVector2D) * cgf}
        else if (pq.valueType?.isScalar)! {value = pq.rawValueOfThePhysicsQuantity! * cgf}
        else {return nil}
        return jqPhysicsQuantity2D.init(withValue: value, withType: vt!, withBasicQuantitesArrayIndex: bqia!)
    }
    
    public static func / (_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> jqPhysicsQuantity2D? {
        if !(pq1.checkWhetherThePhysicsQuantityMakesSence && pq2.checkWhetherThePhysicsQuantityMakesSence) {return nil}
        let vt = pq1 /-/ pq2
        let bqia = Math_BQIA.divide(pq1, pq2)
        if (vt == nil) || (bqia == nil) {return nil}
        let pVT1 = pq1.valueType!; let pVT2 = pq2.valueType!;
        var value: Any? = 0.0
        if (pq1.basicQuantitiesIndexArray! == pq2.basicQuantitiesIndexArray!) {assertionFailure("jqPhysicsQuantityOperationExtension.swift: --- Doesn't support same kind of physicsQuantity to divide ! --- It will be just a raw value, in this condition, you can use operator \"/|/\"")}
        if pq2.rawValueOfThePhysicsQuantity! == 0 {
            assertionFailure("jqPhysicsEnvironment: cgf cannot divide 0!")
            return nil
        }
        if pVT1.isVector && pVT2.isScalar {value = pq1.rawValueOfThePhysicsQuantity! / pq2.rawValueOfThePhysicsQuantity!}
        else if pVT1.isVector && pVT2.isScalar {value = (pq1.value as! UIVector2D) / pq2.rawValueOfThePhysicsQuantity!}
        else if pVT1.isScalar && pVT2.isScalar {value = pq1.rawValueOfThePhysicsQuantity! / pq2.rawValueOfThePhysicsQuantity!}
        else if pVT1.isVector && pVT2.isVector {value = pq1.rawValueOfThePhysicsQuantity! / pq2.rawValueOfThePhysicsQuantity!}
        else {return nil}
        return jqPhysicsQuantity2D.init(withValue: value, withType: vt!, withBasicQuantitesArrayIndex: bqia!)
    }
    
    public static func / (_ cgf: CGFloat, _ pq: jqPhysicsQuantity2D) -> jqPhysicsQuantity2D? {
        if !pq.checkWhetherThePhysicsQuantityMakesSence {return nil}
        let vt = -/pq.valueType!
        let bqia = Math_BQIA.divideByCGFloat(pq.basicQuantitiesIndexArray!)
        if (vt == nil) || (bqia == nil) {return nil}
        if !(vt == .scalar_signed) {return nil}
        if pq.rawValueOfThePhysicsQuantity! == 0 {
            assertionFailure("jqPhysicsEnvironment: cgf cannot divide 0!")
            return nil
        }
        let value: CGFloat = cgf / pq.rawValueOfThePhysicsQuantity!
        return jqPhysicsQuantity2D.init(withScalarValueSigned: value, withBasicQuantitiesIndexArray: bqia)
    }
    
    public static func / (_ pq: jqPhysicsQuantity2D, _ cgf: CGFloat) -> jqPhysicsQuantity2D? {
        if !pq.checkWhetherThePhysicsQuantityMakesSence {return nil}
        let vt = pq.valueType!-/
        let bqia = Math_BQIA.divideCGFloat(pq.basicQuantitiesIndexArray!)
        if (vt == nil) || (bqia == nil) {return nil}
        if cgf == 0 {
            assertionFailure("jqPhysicsEnvironment: pq cannot divide a cgf equals 0!")
            return nil
        }
        var value: Any? = 0.0
        if (vt?.isScalar)! {value = pq.rawValueOfThePhysicsQuantity! / cgf}
        else if (vt?.isVector)! {value = (pq.value as? UIVector2D)! / cgf}
        else {return nil}
        return jqPhysicsQuantity2D.init(withValue: value, withType: vt, withBasicQuantitesArrayIndex: bqia)
    }
    
    public static func /|/ (_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> CGFloat? {
        if !(pq1.checkWhetherThePhysicsQuantityMakesSence && pq2.checkWhetherThePhysicsQuantityMakesSence) {return nil}
        if !(pq1 ~= pq2) {return nil}
        return pq1.rawValueOfThePhysicsQuantity! / pq2.rawValueOfThePhysicsQuantity!
    }
    
    public static func ^ (_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> jqPhysicsQuantity2D? {
        if !(pq1.checkWhetherThePhysicsQuantityMakesSence && pq2.checkWhetherThePhysicsQuantityMakesSence) {return nil}
        if !((pq1.valueType?.isVector)! && (pq2.valueType?.isVector)!) {return nil}
        let bqia = Math_BQIA.power(pq1, pq2)
        let value: CGFloat = (pq1.value as! UIVector2D) ^ (pq2.value as! UIVector2D)
        return jqPhysicsQuantity2D.init(withScalarValueSigned: value, withBasicQuantitiesIndexArray: bqia)
    }
    
    public static func ^ (_ pq: jqPhysicsQuantity2D, _ cgf: CGFloat) -> jqPhysicsQuantity2D? {
        if !pq.checkWhetherThePhysicsQuantityMakesSence {return nil}
        let vt = pq.valueType!-^
        let bqia = Math_BQIA.powerCGFloat(pq, cgf)
        if (vt == nil) || (bqia == nil) {return nil}
        let value: CGFloat = pow(pq.rawValueOfThePhysicsQuantity!, cgf)
        return jqPhysicsQuantity2D.init(withScalarValueSigned: value, withBasicQuantitiesIndexArray: bqia)
    }

    public static func ^ (_ cgf: CGFloat, pq: jqPhysicsQuantity2D) -> jqPhysicsQuantity2D? {
        return nil
    }
    
}

#endif
