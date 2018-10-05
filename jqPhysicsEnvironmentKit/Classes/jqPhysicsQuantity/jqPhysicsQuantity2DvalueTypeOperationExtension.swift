//
//  jqPhysicsQuantity2DvalueTypeOperationExtension.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/9/16.
//

#if os(iOS) || os(tvOS)

import Foundation

public extension physicsValueType {
    
    public static func vtUpdate(_ pVT: physicsValueType) -> physicsValueType {
        if pVT == .scalar_unsigned {return .scalar_signed}
        else {return pVT}
    }
    
    public var updateTypeValue: physicsValueType {
        if self == .scalar_unsigned {return .scalar_signed}
        else {return self}
    }
    
    public var isScalar: Bool {return (self == .scalar_signed || self == .scalar_unsigned) ? true : false}
    
    public var isVector: Bool {return self == .vector ? true : false}
    
    public static func + (_ pVT1: physicsValueType, _ pVT2: physicsValueType) -> physicsValueType? {
        if pVT1.isScalar && pVT2.isScalar {return .scalar_signed}
        else if pVT1.isVector && pVT2.isVector {return .vector}
        else {return nil}
    }
    
    public static func - (_ pVT1: physicsValueType, _ pVT2: physicsValueType) -> physicsValueType? {
        if pVT1.isScalar && pVT2.isScalar {return .scalar_signed}
        else if pVT1.isVector && pVT2.isVector {return .vector}
        else {return nil}
    }
    
    public static func * (_ pVT1: physicsValueType, _ pVT2: physicsValueType) -> physicsValueType? {
        if      pVT1.isScalar && pVT2.isScalar      {return .scalar_signed}
        else if pVT1.isVector && pVT2.isVector      {return .scalar_signed}
        else if (pVT1.isScalar && pVT2.isVector) || (pVT1.isVector && pVT2.isScalar) {return .vector}
        else    {return nil}
    }
    
    public static postfix func -* (_ pVT: physicsValueType) -> physicsValueType? {
        if pVT.isScalar         {return .scalar_signed}
        else if pVT.isVector    {return .vector}
        else                    {return nil}
    }
    
    public static prefix func -* (_ pVT: physicsValueType) -> physicsValueType? {
        if pVT.isScalar         {return .scalar_signed}
        else if pVT.isVector    {return .vector}
        else                    {return nil}
    }
    
    public static postfix func -/ (_ pVT: physicsValueType) -> physicsValueType? {
        if pVT.isScalar         {return .scalar_signed}
        else if pVT.isVector    {return .vector}
        else                    {return nil}
    }
    
    public static prefix func -/ (_ pVT: physicsValueType) -> physicsValueType? {
        if pVT.isScalar         {return .scalar_signed}
        else if pVT.isVector    {return nil}
        else                    {return nil}
    }
    
    public static func ^ (_ pVT1: physicsValueType, _ pVT2: physicsValueType) -> physicsValueType? {
        if pVT1.isVector && pVT2.isVector {return .scalar_signed}
        else {return nil}
    }
    
    public static postfix func -^ (_ pVT: physicsValueType) -> physicsValueType? {
        if pVT.isVector || pVT.isScalar {return .scalar_signed}
        else {return nil}
    }
    
    public static prefix func -^ (_ pVY: physicsValueType) -> physicsValueType? {return nil}
    
}

public extension jqPhysicsQuantity2D {
    
    public static func /-/ (_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> physicsValueType? {
        let pVT1 = pq1.valueType; let pVT2 = pq2.valueType
        if (pVT1?.isVector)! && (pVT2?.isVector)! {
            if (pq1.value as! UIVector2D) ^= (pq2.value as! UIVector2D) {return .scalar_signed}
            else if jqPhysicsEnvironmentConfiguration.UIVector2DWhetherAllowApproximatelyDirectionalVectorsBePlus && ((pq1.value as! UIVector2D) ~^= (pq2.value as! UIVector2D)) {return .scalar_signed}
            else {return nil}
        }
        else if ((pVT1?.isScalar)! && (pVT2?.isVector)!) {return nil}
        else if ((pVT1?.isVector)! && (pVT2?.isScalar)!) {return .vector}
        else if ((pVT1?.isScalar)! && (pVT2?.isScalar)!) {return .scalar_signed}
        else {return nil}
    }
    
}

#endif
