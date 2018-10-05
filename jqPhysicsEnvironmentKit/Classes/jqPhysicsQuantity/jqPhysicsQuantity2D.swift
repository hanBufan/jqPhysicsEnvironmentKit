//
//  jqPhysicsQuantity2D.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/8/15.
//

#if os(iOS) || os(tvOS)

import Foundation

public struct jqPhysicsQuantity2D {
    
    public var basicQuantitiesIndexArray: [CGFloat]?
    
    public var valueType: physicsValueType?
    
    /* - MARK: value: Any? Description
     * The value var contains the following preferences:
     *  - UIVector2D : Used for Physics Quantities using vector Unit: Force, Velocity
     *  - CGFloat : Used for Scalar Physics Quantities
     */
    public var value: Any?
    
    public init(withVector vector: UIVector2D?, withBasicQuantitiesIndexArray BQIA: [CGFloat]?) {
        self.basicQuantitiesIndexArray = BQIA
        self.valueType = .vector
        self.value = vector as Any
    }
    
    public init(withScalarValueUnsigned value: UCGFloat?, withBasicQuantitesIndexArray BQIA: [CGFloat]?) {
        self.basicQuantitiesIndexArray = BQIA
        self.valueType = .scalar_unsigned
        self.value = value as Any
    }
    
    public init(withScalarValueSigned value: CGFloat?, withBasicQuantitiesIndexArray BQIA: [CGFloat]?) {
        self.basicQuantitiesIndexArray = BQIA
        self.valueType = .scalar_signed
        self.value = value as Any
    }
    
    public init(withValue value: Any?, withType valueType: physicsValueType?, withBasicQuantitesArrayIndex BQIA: [CGFloat]?) {
        self.basicQuantitiesIndexArray = BQIA
        self.valueType = valueType
        self.value = value
    }
    
}

#endif
