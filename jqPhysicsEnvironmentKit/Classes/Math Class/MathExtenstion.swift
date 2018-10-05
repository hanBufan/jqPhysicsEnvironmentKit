//
//  MathExtenstion.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/7/25.
//

#if os(iOS) || os(macOS) || os (watchOS) || os(tvOS)

import Foundation
import UIKit

public class Math {
    
    private init() {}
    
    public static let pi: Double = Double.pi
    
    public static func sqrt(_ num: Float) -> Float?                     {return num >= 0 ? num.squareRoot() : nil}
    
    public static func sqrt(_ num: Double) -> Double?                   {return num >= 0 ? num.squareRoot() : nil}
    
    public static func sqrt(_ num: Int) -> Double?                      {return num >= 0 ? num.toDouble.squareRoot() : nil}
    
    public static func sqrt(_ num: UInt) -> Double?                     {return num.toInt.toDouble.squareRoot()}
    
    #if os(iOS)
    
    public static func sqrt(_ num: CGFloat) -> CGFloat?                 {return num >= 0 ? num.squareRoot() : nil}
    
    #endif
    
    public static func gcd(_ firstNum: Int, _ secondNum: Int) -> Int {
        let k = firstNum * secondNum >= 0 ? 1 : -1
        let remainder = firstNum % secondNum
        if remainder != 0 {
            return self.gcd(secondNum, remainder) * k
        } else {
            return secondNum * k
        }
    }
    
    public static func lcm(_ firstNum: Int, _ secondNum: Int) -> Int {
        return firstNum * secondNum / Int.gcd(firstNum, secondNum)
    }
    
    public static func gcd(_ firstNum: UInt, _ secondNum: UInt) -> UInt {
        let remainder = firstNum % secondNum
        if remainder != 0 {
            return gcd(secondNum, remainder)
        } else {
            return secondNum
        }
    }
    
    public static func lcm(_ firstNum: UInt, _ secondNum: UInt) -> UInt {return firstNum * secondNum / UInt.gcd(firstNum, secondNum)}
    
    public static func degreeToRadian(_ degree: Int) -> Double          {return (degree.toDouble / 180.0) * self.pi}
    
    public static func degreeToRadian(_ degree: Float) -> Float         {return degree / 180.0 * Float(self.pi)}
    
    public static func degreeToRadian(_ degree: Double) -> Double       {return degree / 180.0 * self.pi}
    
    #if os(iOS)
    
    public static func degreeToRadian(_ degree: CGFloat) -> CGFloat     {return degree / 180.0 * CGFloat(self.pi)}
    
    #endif
    
    public static func radianToDegree(_ radian: Int) -> Double          {return radian.toDouble / self.pi * 180.0}
    
    public static func radianToDegree(_ radian: Float) -> Float         {return radian / Float(self.pi) * 180.0}
    
    public static func radianToDegree(_ radian: Double) -> Double       {return radian / self.pi * 180.0}
    
    #if os(iOS)
    
    public static func radianToDegree(_ radian: CGFloat) -> CGFloat     {return radian / CGFloat(self.pi) * 180.0}
    
    #endif
    
    public static func sin_deg(_ deg: Double) -> Double                 {return sin(self.degreeToRadian(deg))}
    
    public static func sin_deg(_ deg: Float) -> Float                   {return Float(sin(self.degreeToRadian(deg)))}
    
    public static func sin_deg(_ deg: Int) -> Double                    {return sin(self.degreeToRadian(deg))}
    
    #if os(iOS)
    
    public static func sin_deg(_ deg: CGFloat) -> CGFloat               {return CGFloat(sin(self.degreeToRadian(deg)))}
    
    #endif
    
    public static func cos_deg(_ deg: Double) -> Double                 {return cos(self.degreeToRadian(deg))}
    
    public static func cos_deg(_ deg: Float) -> Float                   {return Float(cos(self.degreeToRadian(deg)))}
    
    public static func cos_deg(_ deg: Int) -> Double                    {return cos(self.degreeToRadian(deg))}
    
    #if os(iOS)
    
    public static func cos_deg(_ deg: CGFloat) -> CGFloat               {return CGFloat(cos(self.degreeToRadian(deg)))}
    
    #endif
    
    public static func tan_deg(_ deg: Double) -> Double                 {return tan(self.degreeToRadian(deg))}
    
    public static func tan_deg(_ deg: Float) -> Float                   {return Float(tan(self.degreeToRadian(deg)))}
    
    public static func tan_deg(_ deg: Int) -> Double                    {return tan(self.degreeToRadian(deg))}
    
    #if os(iOS)
    
    public static func tan_deg(_ deg: CGFloat) -> CGFloat               {return CGFloat(tan(self.degreeToRadian(deg)))}
    
    #endif
    
    public static func cot_deg(_ deg: Double) -> Double                 {return 1.0 / tan_deg(deg)}
    
    public static func cot_deg(_ deg: Float) -> Float                   {return Float(1.0 / tan_deg(deg))}
    
    public static func cot_deg(_ deg: Int) -> Double                    {return 1.0 / tan_deg(deg)}
    
    #if os(iOS)
    
    public static func cot_deg(_ deg: CGFloat) -> CGFloat               {return CGFloat(1.0 / tan_deg(deg))}
    
    #endif
    
    public static func sec_deg(_ deg: Double) -> Double                 {return 1.0 / cos_deg(deg)}
    
    public static func sec_deg(_ deg: Float) -> Float                   {return Float(1.0 / cos_deg(deg))}
    
    public static func sec_deg(_ deg: Int) -> Double                    {return 1.0 / cos_deg(deg)}
    
    #if os(iOS)
    
    public static func sec_deg(_ deg: CGFloat) -> CGFloat               {return CGFloat(1.0 / cos_deg(deg))}
    
    #endif
    
    public static func csc_deg(_ deg: Double) -> Double                 {return 1.0 / sin_deg(deg)}
    
    public static func csc_deg(_ deg: Float) -> Float                   {return Float(1.0 / sin_deg(deg))}
    
    public static func csc_deg(_ deg: Int) -> Double                    {return 1.0 / sin_deg(deg)}
    
    #if os(iOS)
    
    public static func csc_deg(_ deg: CGFloat) -> CGFloat               {return CGFloat(1.0 / sin_deg(deg))}
    
    #endif
    
    public static func sin_rad(_ rad: Double) -> Double                 {return sin(rad)}
    
    public static func sin_rad(_ rad: Float) -> Float                   {return Float(sin(rad))}
    
    public static func sin_rad(_ rad: Int) -> Double                    {return sin(rad.toDouble)}
    
    #if os(iOS)
    
    public static func sin_rad(_ rad: CGFloat) -> CGFloat               {return CGFloat(sin(rad))}
    
    #endif
    
    public static func cos_rad(_ rad: Double) -> Double                 {return cos(rad)}
    
    public static func cos_rad(_ rad: Float) -> Float                   {return Float(cos(rad))}
    
    public static func cos_rad(_ rad: Int) -> Double                    {return cos(rad.toDouble)}
    
    #if os(iOS)
    
    public static func cos_rad(_ rad: CGFloat) -> CGFloat               {return CGFloat(cos(rad))}
    
    #endif
    
    public static func tan_rad(_ rad: Double) -> Double                 {return tan(rad)}
    
    public static func tan_rad(_ rad: Float) -> Float                   {return Float(tan(rad))}
    
    public static func tan_rad(_ rad: Int) -> Double                    {return tan(rad.toDouble)}
    
    #if os(iOS)
    
    public static func tan_rad(_ rad: CGFloat) -> CGFloat               {return CGFloat(tan(rad))}
    
    #endif
    
    public static func cot_rad(_ rad: Double) -> Double                 {return 1.0 / tan_rad(rad)}
    
    public static func cot_rad(_ rad: Float) -> Float                   {return Float(1.0 / tan_rad(rad))}
    
    public static func cot_rad(_ rad: Int) -> Double                    {return 1.0 / tan_rad(rad)}
    
    #if os(iOS)
    
    public static func cot_rad(_ rad: CGFloat) -> CGFloat               {return CGFloat(1.0 / tan_rad(rad))}
    
    #endif
    
    public static func sec_rad(_ rad: Double) -> Double                 {return 1.0 / cos_rad(rad)}
    
    public static func sec_rad(_ rad: Float) -> Float                   {return Float(1.0 / cos_rad(rad))}
    
    public static func sec_rad(_ rad: Int) -> Double                    {return 1.0 / cos_rad(rad)}
    
    #if os(iOS)
    
    public static func sec_rad(_ rad: CGFloat) -> CGFloat               {return CGFloat(1.0 / cos_rad(rad))}
    
    #endif
    
    public static func csc_rad(_ rad: Double) -> Double                 {return 1.0 / sin_rad(rad)}
    
    public static func csc_rad(_ rad: Float) -> Float                   {return Float(1.0 / sin_rad(rad))}
    
    public static func csc_rad(_ rad: Int) -> Double                    {return 1.0 / sin_rad(rad)}
    
    #if os(iOS)
    
    public static func csc_rad(_ rad: CGFloat) -> CGFloat               {return CGFloat(1.0 / sin_rad(rad))}
    
    #endif
    
    public static func sgn(_ num: Int) -> Int                           {return num > 0 ? 1 : (num == 0 ? 0 : -1)}
    
    public static func sgn(_ num: Float) -> Float                       {return num > 0.0 ? 1.0 : (num == 0.0 ? 0.0 : -1.0)}
    
    public static func sgn(_ num: Double) -> Double                     {return num > 0.0 ? 1.0 : (num == 0.0 ? 0.0 : -1.0)}
    
    #if os(iOS)
    
    public static func sgn(_ num: CGFloat) -> CGFloat                     {return num > 0.0 ? 1.0 : (num == 0.0 ? 0.0 : -1.0)}
    
    #endif
    
    public static func abs(_ num: Double) -> Double                     {return num > 0.0 ? num : -num}
    
    public static func abs(_ num: Float) -> Float                       {return num > 0.0 ? num : -num}
    
    public static func abs(_ num: Int) -> Int                           {return num > 0 ? num : -num}
    
    #if os(iOS)
    
    public static func abs(_ num: CGFloat) -> CGFloat                   {return num > 0.0 ? num : -num}
    
    #endif
    
    public static func arcsin_deg(_ degree: Double) -> Double           {return asin(self.degreeToRadian(degree))}
    
    public static func arcsin_deg(_ degree: Float) -> Float             {return asin(self.degreeToRadian(degree))}
    
    public static func arcsin_deg(_ degree: Int) -> Double              {return asin(self.degreeToRadian(degree))}
    
    #if os(iOS)
    
    public static func arcsin_deg(_ degree: CGFloat) -> CGFloat         {return asin(self.degreeToRadian(degree))}
    
    #endif
    
    public static func arccos_deg(_ degree: Double) -> Double           {return acos(self.degreeToRadian(degree))}
    
    public static func arccos_deg(_ degree: Float) -> Float             {return acos(self.degreeToRadian(degree))}
    
    public static func arccos_deg(_ degree: Int) -> Double              {return acos(self.degreeToRadian(degree))}
    
    #if os(iOS)
    
    public static func arccos_deg(_ degree: CGFloat) -> CGFloat         {return atan(self.degreeToRadian(degree))}
    
    #endif
    
    public static func arctan_deg(_ degree: Double) -> Double           {return atan(self.degreeToRadian(degree))}
    
    public static func arctan_deg(_ degree: Float) -> Float             {return atan(self.degreeToRadian(degree))}
    
    public static func arctan_deg(_ degree: Int) -> Double              {return atan(self.degreeToRadian(degree))}
    
    #if os(iOS)
    
    public static func arctan_deg(_ degree: CGFloat) -> CGFloat         {return atan(self.degreeToRadian(degree))}
    
    #endif
    
    public static func arcsin_rad(_ rad: Double) -> Double              {return asin(rad)}
    
    public static func arcsin_rad(_ rad: Float) -> Float                {return asin(rad)}
    
    public static func arcsin_rad(_ rad: Int) -> Double                 {return asin(rad.toDouble)}
    
    #if os(iOS)
    
    public static func arcsin_rad(_ rad: CGFloat) -> CGFloat            {return asin(rad)}
    
    #endif
    
    public static func arccos_rad(_ rad: Double) -> Double              {return acos(rad)}
    
    public static func arccos_rad(_ rad: Float) -> Float                {return acos(rad)}
    
    public static func arccos_rad(_ rad: Int) -> Double                 {return acos(rad.toDouble)}
    
    #if os(iOS)
    
    public static func arccos_rad(_ rad: CGFloat) -> CGFloat            {return acos(rad)}
    
    #endif
    
    public static func arctan_rad(_ rad: Double) -> Double              {return atan(rad)}
    
    public static func arctan_rad(_ rad: Float) -> Float                {return atan(rad)}
    
    public static func arctan_rad(_ rad: Int) -> Double                 {return atan(rad.toDouble)}
    
    #if os(iOS)
    
    public static func arctan_rad(_ rad: CGFloat) -> CGFloat            {return atan(rad)}
    
    #endif
    
    public static func square(_ num: Double) -> Double                  {return num * num}
    
    public static func square(_ num: Float) -> Float                    {return num * num}
    
    public static func square(_ num: Int) -> Int                        {return num * num}
    
    #if os(iOS)
    
    public static func square(_ num: CGFloat) -> CGFloat                {return num * num}
    
    #endif
    
    public static func distanceThroughPoint(_ point1: CGPoint, _ point2: CGPoint) -> CGFloat {
        return Math.sqrt(Math.square(point1.x - point2.x) + Math.square(point1.y - point2.y))!
    }
    
}

#endif
