//
//  UIViewAnimation.swift
//  jqSwiftExtensionSDK
//
//  Created by Jefferson Qin on 2018/7/25.
//
#if os(iOS)

import Foundation
import UIKit

public class UIViewAnimation {
    
    private init() {}
    
    public static func animation(withDuration duration: TimeInterval, delay: TimeInterval, options: UIViewAnimationOptions, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: animations, completion: completion)
    }
    
    public static func animationWithEase(withDuration duration: TimeInterval, delay: TimeInterval, options: UIViewAnimationOptions, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut, options], animations: animations, completion: completion)
    }
    
    public static func animationWithString(withDuration duration: TimeInterval, delay: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat, options: UIViewAnimationOptions, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity, options: options, animations: animations, completion: completion)
    }
    
    public static func transitionAddSubViewInSuperView(ofView view : UIView, inSuperView superView: UIView, withDuration duration: TimeInterval, options: UIViewAnimationOptions, completion: ((Bool) -> Void)?) {
        UIView.transition(with: view, duration: duration, options: options, animations: {
            superView.addSubview(view)
        }, completion: completion)
    }
    
    public static func transitionRemoveSubViewFromSuperView(ofView view : UIView, fromSuperView superView: UIView, withDuration duration: TimeInterval, options: UIViewAnimationOptions, completion: ((Bool) -> Void)?) {
        UIView.transition(with: superView, duration: duration, options: options, animations: {
            view.removeFromSuperview()
        }, completion: completion)
    }
    
    public static func transitionHideSubViewInSuperView(ofView view: UIView, inSuperView superView: UIView, withDuration duration: TimeInterval, options: UIViewAnimationOptions, completion: ((Bool) -> Void)?) {
        UIView.transition(with: superView, duration: duration, options: options, animations: {
            view.isHidden = true
        }, completion: completion)
    }
    
    public static func transitionUnhideSubViewInSuperView(ofView view: UIView, inSuperView superView: UIView, withDuration duration: TimeInterval, options: UIViewAnimationOptions, completion: ((Bool) -> Void)?) {
        UIView.transition(with: superView, duration: duration, options: options, animations: {
            view.isHidden = false
        }, completion: completion)
    }
    
    public static func transitionFromImageToImage(inImageView view: UIImageView, to image: UIImage, withDuration duration: TimeInterval, options: UIViewAnimationOptions, completion: ((Bool) -> Void)?) {
        UIView.transition(with: view, duration: duration, options: options, animations: {
            view.image = image
        }, completion: completion)
    }
    
    public static func transitionFromViewToView(fromView view1: UIView, toView view2: UIView, withDuration duration: TimeInterval, options: UIViewAnimationOptions, completion: ((Bool) -> Void)?) {
        UIView.transition(from: view1, to: view2, duration: duration, options: options, completion: completion)
    }
    
    public static func transitionForLabelTextByVerticalCubeTransition_animation(withLabel label: UILabel, ofBackgroundColor color: UIColor, toText text: String, vanishDirection direction: AnimationVerticalDirection, withDuration duration: TimeInterval, delay: TimeInterval, options: UIViewAnimationOptions) {
        label.backgroundColor = color
        let auxLabel = UILabel(frame: label.frame)
        auxLabel.backgroundColor = color
        auxLabel.text = text
        auxLabel.font = label.font
        auxLabel.textAlignment = label.textAlignment
        auxLabel.textColor = label.textColor
        
        let auxLabelOffset = CGFloat(direction.rawValue) * label.Height / 2.0
        
        auxLabel.transform = CGAffineTransform(translationX: 0.0, y: auxLabelOffset).scaledBy(x: 1.0, y: 0.1)
        label.superview?.addSubview(auxLabel)
        
        UIView.animate(withDuration: duration, delay: delay, options: [options], animations: {
            auxLabel.transform = .identity
            label.transform = CGAffineTransform(translationX: 0.0, y: -auxLabelOffset)
                .scaledBy(x: 1.0, y: 0.1)
        }, completion: { _ in
            label.text = auxLabel.text
            label.transform = .identity
            auxLabel.removeFromSuperview()
        })
    }
    
    public static func transitionForLabelTextByHorizontalCubeTransition_animation(withLabel label: UILabel, ofBackgroundColor color: UIColor, toText text: String, vanishDirection direction: AnimationHorizontalDirection, withDuration duration: TimeInterval, delay: TimeInterval, options: UIViewAnimationOptions) {
        label.backgroundColor = color
        let auxLabel = UILabel(frame: label.frame)
        auxLabel.backgroundColor = color
        auxLabel.text = text
        auxLabel.font = label.font
        auxLabel.textAlignment = label.textAlignment
        auxLabel.textColor = label.textColor
        
        let auxLabelOffset = CGFloat(direction.rawValue) * label.Width/2.0
        
        auxLabel.transform = CGAffineTransform(translationX: auxLabelOffset, y: 0.0)
            .scaledBy(x: 0.1, y: 1.0)
        label.superview?.addSubview(auxLabel)
        
        UIView.animate(withDuration: duration, delay: delay, options: [options], animations: {
            auxLabel.transform = .identity
            label.transform = CGAffineTransform(translationX: -auxLabelOffset, y: 0.0).scaledBy(x: 0.1, y: 1.0)
        }, completion: { _ in
            label.text = auxLabel.text
            label.transform = .identity
            auxLabel.removeFromSuperview()
        })
    }
    
    public static func transitionForLabelTextByFade_animation(ofLabel label: UILabel, withText text: String, byXOffset xOffset: CGFloat, byYOffset yOffset: CGFloat, withHorizontalFanishDirection xDirection: AnimationHorizontalDirection, withVerticalFanishDirection yDirection: AnimationVerticalDirection, withFanishDuration fDuration : TimeInterval, withEnterDuration eDuration: TimeInterval, withEnterDelay eDelay: TimeInterval, withBeginDelay delay: TimeInterval) {
        let auxLabel = UILabel(frame: label.frame)
        auxLabel.text = text
        auxLabel.font = label.font
        auxLabel.textAlignment = label.textAlignment
        auxLabel.textColor = label.textColor
        auxLabel.backgroundColor = .clear
        
        auxLabel.transform = CGAffineTransform(translationX: xOffset * xDirection.rawValue.toCGFloat, y: yOffset * yDirection.rawValue.toCGFloat)
        auxLabel.alpha = 0
        label.superview?.addSubview(auxLabel)
        
        UIView.animate(withDuration: fDuration, delay: delay, options: .curveEaseIn, animations: {
            label.transform = CGAffineTransform(translationX: xOffset * xDirection.rawValue.toCGFloat, y: yOffset * yDirection.rawValue.toCGFloat)
            label.alpha = 0.0
        }, completion: nil)
        
        UIView.animate(withDuration: eDuration, delay: eDelay, options: .curveEaseIn, animations: {
            auxLabel.transform = .identity
            auxLabel.alpha = 1.0
        }, completion: {_ in
            auxLabel.removeFromSuperview()
            label.text = text
            label.alpha = 1.0
            label.transform = .identity
        })
    }
    
    public static func animationFrameWithKeys(withDuration duration: TimeInterval, delay: TimeInterval, options: UIViewKeyframeAnimationOptions, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: options, animations: animations, completion: completion)
    }
    
    public static func addKeyFrameAnimation(withStartTimePercentage startTimePercentage: Double, withDurationPercentage durationPercentage: Double, animations: @escaping () -> Void) {
        UIView.addKeyframe(withRelativeStartTime: startTimePercentage, relativeDuration: durationPercentage, animations: animations)
    }
    
    public static func addKeyFrame_ViewDisappear_ReduceAlpha(withView view: UIView, withStartTimePercentage startTimePercentage: Double, withDurationPercentage durationPercentage: Double) {
        UIView.addKeyframe(withRelativeStartTime: startTimePercentage, relativeDuration: durationPercentage) {
            view.setAlpha(alpha: 0)
        }
    }
    
    public static func addKeyFrame_ViewReAppear_IncreaseAlpha(withView view: UIView, withStartTimePercentage startTimePercentage: Double, withDurationPercentage durationPercentage: Double) {
        UIView.addKeyframe(withRelativeStartTime: startTimePercentage, relativeDuration: durationPercentage) {
            view.setAlpha(alpha: 1)
        }
    }
    
}

#endif
