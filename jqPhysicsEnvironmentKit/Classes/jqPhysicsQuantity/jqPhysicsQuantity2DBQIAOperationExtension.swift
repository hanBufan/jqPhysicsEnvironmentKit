//
//  jqPhysicsQuantity2DBQIAOperationExtension.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/9/23.
//

#if os(iOS) || (tvOS)

import Foundation

public class Math_BQIA  {
    
    public static func checkWhetherOfficialFormatForBQIA(_ bqia: [CGFloat]) -> Bool {
        if bqia.count != 7 {
            assertionFailure("jqPhysicsEnvironment: Wrong format for bqia, array length is not 7!")
            return false
        }
        else if bqia == [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] {
            assertionFailure("jqPhysicsEnvironment: bqia cannot be pure 0, it is not a physical quantity!")
            return false
        }
        else {return true}
    }
 
    public static func plus(_ bqia1: [CGFloat], _ bqia2: [CGFloat]) -> [CGFloat]? {
        if !(Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia1) && Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia2)) {return nil}
        if bqia1 != bqia2   {return nil}
        else                {return bqia1}
    }
    
    public static func minus(_ bqia1: [CGFloat], _ bqia2: [CGFloat]) -> [CGFloat]? {
        if !(Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia1) && Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia2)) {return nil}
        if bqia1 != bqia2   {return nil}
        else                {return bqia1}
    }
    
    public static func multiply(_ bqia1: [CGFloat], _ bqia2: [CGFloat]) -> [CGFloat]? {
        if !(Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia1) && Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia2)) {return nil}
        var bqia: [CGFloat] = [0,0,0,0,0,0,0]
        for i in 0...6 {
            bqia[i] = bqia1[i] + bqia2[i]
        }
        return bqia
    }
    
    public static func multiplyCGFloat(_ bqia: [CGFloat]) -> [CGFloat]? {
        if !Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia) {return nil}
        return bqia
    }
    
    public static func divide(_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> [CGFloat]? {
        let bqia1 = pq1.basicQuantitiesIndexArray; let bqia2 = pq2.basicQuantitiesIndexArray
        if !(Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia1!) && Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia2!)) {return nil}
        if ((pq1 /-/ pq2) == nil) {return nil}
        var bqia: [CGFloat] = [0,0,0,0,0,0,0]
        for i in 0...6 {
            bqia[i] = bqia1![i] - bqia2![i]
        }
        return bqia
    }
    
    public static func divideCGFloat(_ bqia: [CGFloat]) -> [CGFloat]? {
        if !Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia) {return nil}
        return bqia
    }
    
    public static func divideByCGFloat(_ bqia: [CGFloat]) -> [CGFloat]? {
        if !Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia) {return nil}
        var bqia_0 = bqia;
        for i in 0...6 {
            bqia_0[i] = -bqia[i]
        }
        return bqia_0
    }
    
    public static func power(_ pq1: jqPhysicsQuantity2D, _ pq2: jqPhysicsQuantity2D) -> [CGFloat]? {
        let bqia1 = pq1.basicQuantitiesIndexArray; let bqia2 = pq2.basicQuantitiesIndexArray
        if !(Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia1!) && Math_BQIA.checkWhetherOfficialFormatForBQIA(bqia2!)) {return nil}
        if (pq1.valueType?.isVector)! && (pq2.valueType?.isVector)! {
            var bqia: [CGFloat] = [0,0,0,0,0,0,0]
            for i in 0...6 {
                bqia[i] = bqia1![i] + bqia2![i]
            }
            return bqia
        } else {return nil}
    }
    
    public static func powerCGFloat(_ pq: jqPhysicsQuantity2D, _ cgfloat: CGFloat) -> [CGFloat]? {
        if !Math_BQIA.checkWhetherOfficialFormatForBQIA(pq.basicQuantitiesIndexArray!) {return nil}
        if pq.valueType == nil {return nil}
        let bqia_0 = pq.basicQuantitiesIndexArray!
        var bqia: [CGFloat] = [0,0,0,0,0,0,0]
        for i in 0...6 {
            bqia[i] = bqia_0[i] * cgfloat
        }
        return bqia
    }
    
}

#endif
