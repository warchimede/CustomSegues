//
//  CustomSegue.swift
//  CustomSegues
//
//  Created by William Archimede on 16/09/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

import UIKit
import QuartzCore

enum CustomSegueAnimation {
    case Push
    case SwipeDown
    case GrowScale
    case CornerRotate
}

// MARK: Segue class
class CustomSegue: UIStoryboardSegue {
    
    var animationType = CustomSegueAnimation.Push
    
    override func perform() {
        switch animationType {
        case .Push:
            animatePush()
        case .SwipeDown:
            animateSwipeDown()
        case .GrowScale:
            animateGrowScale()
        case .CornerRotate:
            animateCornerRotate()
        }
    }
    
    private func animatePush() {
        let toViewController = destinationViewController
        let fromViewController = sourceViewController
        
        let containerView = fromViewController.view.superview
        let screenBounds = UIScreen.mainScreen().bounds
        
        let finalToFrame = screenBounds
        let finalFromFrame = CGRectOffset(finalToFrame, -screenBounds.size.width, 0)
        
        toViewController.view.frame = CGRectOffset(finalToFrame, screenBounds.size.width, 0)
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
            }, completion: { finished in
                let fromVC = self.sourceViewController
                let toVC = self.destinationViewController
                fromVC.presentViewController(toVC, animated: false, completion: nil)
        })
    }
    
    private func animateSwipeDown() {
        let toViewController = destinationViewController
        let fromViewController = sourceViewController
        
        let containerView = fromViewController.view.superview
        let screenBounds = UIScreen.mainScreen().bounds
        
        let finalToFrame = screenBounds
        let finalFromFrame = CGRectOffset(finalToFrame, 0, screenBounds.size.height)
        
        toViewController.view.frame = CGRectOffset(finalToFrame, 0, -screenBounds.size.height)
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
            }, completion: { finished in
                let fromVC = self.sourceViewController
                let toVC = self.destinationViewController
                fromVC.presentViewController(toVC, animated: false, completion: nil)
        })
    }
    
    private func animateGrowScale() {
        let toViewController = destinationViewController
        let fromViewController = sourceViewController
        
        let containerView = fromViewController.view.superview
        let originalCenter = fromViewController.view.center
        
        toViewController.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
        toViewController.view.center = originalCenter
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion: { finished in
                let fromVC = self.sourceViewController
                let toVC = self.destinationViewController
                fromVC.presentViewController(toVC, animated: false, completion: nil)
        })
    }
    
    private func animateCornerRotate() {
        let toViewController = destinationViewController
        let fromViewController = sourceViewController
        
        toViewController.view.layer.anchorPoint = CGPointZero
        fromViewController.view.layer.anchorPoint = CGPointZero
        
        toViewController.view.layer.position = CGPointZero
        fromViewController.view.layer.position = CGPointZero
        
        let containerView: UIView? = fromViewController.view.superview
        toViewController.view.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.TransitionNone, animations: {
            fromViewController.view.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            toViewController.view.transform = CGAffineTransformIdentity
            }, completion: { finished in
                let fromVC: UIViewController = self.sourceViewController
                let toVC: UIViewController = self.destinationViewController
                fromVC.presentViewController(toVC, animated: false, completion: nil)
        })
    }
}

// MARK: Unwind Segue class
class CustomUnwindSegue: UIStoryboardSegue {
    
    var animationType: CustomSegueAnimation = .Push
    
    override func perform() {
        switch animationType {
        case .Push:
            animatePush()
        case .SwipeDown:
            animateSwipeDown()
        case .GrowScale:
            animateGrowScale()
        case .CornerRotate:
            animateCornerRotate()
        }
    }
    
    private func animatePush() {
        let toViewController = destinationViewController
        let fromViewController = sourceViewController
        
        let containerView = fromViewController.view.superview
        let screenBounds = UIScreen.mainScreen().bounds
        
        let finalToFrame = screenBounds
        let finalFromFrame = CGRectOffset(finalToFrame, screenBounds.size.width, 0)
        
        toViewController.view.frame = CGRectOffset(finalToFrame, -screenBounds.size.width, 0)
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
            }, completion: { finished in
                let fromVC: UIViewController = self.sourceViewController
                fromVC.dismissViewControllerAnimated(false, completion: nil)
        })
    }
    
    private func animateSwipeDown() {
        let toViewController = destinationViewController
        let fromViewController = sourceViewController
        
        let containerView = fromViewController.view.superview
        let screenBounds = UIScreen.mainScreen().bounds
        
        let finalToFrame = screenBounds
        let finalFromFrame = CGRectOffset(finalToFrame, 0, -screenBounds.size.height)
        
        toViewController.view.frame = CGRectOffset(finalToFrame, 0, screenBounds.size.height)
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
            }, completion: { finished in
                let fromVC: UIViewController = self.sourceViewController
                fromVC.dismissViewControllerAnimated(false, completion: nil)
        })
    }
    
    private func animateGrowScale() {
        let toViewController = destinationViewController
        let fromViewController = sourceViewController
        
        fromViewController.view.superview?.insertSubview(toViewController.view, atIndex: 0)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            fromViewController.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
            }, completion: { finished in
                let fromVC = self.sourceViewController
                fromVC.dismissViewControllerAnimated(false, completion: nil)
        })
    }
    
    private func animateCornerRotate() {
        let toViewController = destinationViewController
        let fromViewController = sourceViewController
        
        toViewController.view.layer.anchorPoint = CGPointZero
        fromViewController.view.layer.anchorPoint = CGPointZero
        
        toViewController.view.layer.position = CGPointZero
        fromViewController.view.layer.position = CGPointZero
        
        let containerView = fromViewController.view.superview
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.TransitionNone, animations: {
            fromViewController.view.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
            toViewController.view.transform = CGAffineTransformIdentity
            }, completion: { finished in
                let fromVC = self.sourceViewController
                fromVC.dismissViewControllerAnimated(false, completion: nil)
        })

    }
}