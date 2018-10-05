//
//  Configration.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/7/31.
//

#if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)

import Foundation
import UIKit

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


// - MARK: This class is used to setup the configuration of the POD, you can change some value in it according to the instructions.
public class jqPhysicsEnvironmentConfiguration {
    
    private init() {}
    
    public static var UIAngle2DDegreeApproximateAbsoluteValue: CGFloat = 1.0
    public static var UIVector2DVectorValueApproximateAbsoluteValue: CGFloat = 0.1
    public static var UIVector2DWhetherAllowApproximatelyDirectionalVectorsBePlus = true
    
    /*
     *  - MARK: BQIA: Basic Physics Quantities Index Array
     *  - BQIA: [CGFloat]
     *  - As we all know, there are 7 basic Physcis Quantities, this Physics Framework use the basis of these 7 quantities,
     *  - Each value in BQIA([CGFloat]) represents the power of each quantities,
     *  - Every Physiscs Quantities is ordered like the following:
     *  - l(m), m(kg), t(s), I(A), T(K), n(mol), I(cd)
     *  - For Example, if the BQIA = [1.0, 1.0, -2.0, 0.0, 0.0, 0.0, 0.0]
     *  - It represents 1 N(Force), for the reason that 1 N = 1 kg * 1 m / (1 s) ^ 2, the array means: (1 m) ^ 1 * (1 kg) ^ 1 * (1 s) ^ (-2) *  (1 A) ^ 0 * (1 K) ^ 0 * (1 mol) ^ 0 * (1 cd) ^ 0
     */
    
    
}

public enum angleStyle {
    case degree
    case radian
}

public enum physicsValueType {
    case vector
    case scalar_unsigned
    case scalar_signed
}

#endif
