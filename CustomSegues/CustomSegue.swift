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
    case push
    case swipeDown
    case growScale
    case cornerRotate
    case fade
}

// MARK: Segue class
class CustomSegue: UIStoryboardSegue {
    
    var animationType = CustomSegueAnimation.push
    
    override func perform() {
        switch animationType {
        case .push:
            animatePush()
        case .swipeDown:
            animateSwipeDown()
        case .growScale:
            animateGrowScale()
        case .cornerRotate:
            animateCornerRotate()
        case .fade:
            animateFade()
        }
    }
    
    private func animatePush() {
        let toViewController = destination
        let fromViewController = source
        
        let containerView = fromViewController.view.superview
        let screenBounds = UIScreen.main.bounds
        
        let finalToFrame = screenBounds
        let finalFromFrame = finalToFrame.offsetBy(dx: -screenBounds.size.width, dy: 0)
        
        toViewController.view.frame = finalToFrame.offsetBy(dx: screenBounds.size.width, dy: 0)
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
        }, completion: { finished in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        })
    }
    
    private func animateSwipeDown() {
        let toViewController = destination
        let fromViewController = source
        
        let containerView = fromViewController.view.superview
        let screenBounds = UIScreen.main.bounds
        
        let finalToFrame = screenBounds
        let finalFromFrame = finalToFrame.offsetBy(dx: 0, dy: screenBounds.size.height)
        
        toViewController.view.frame = finalToFrame.offsetBy(dx: 0, dy: -screenBounds.size.height)
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
        }, completion: { finished in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        })
    }
    
    private func animateGrowScale() {
        let toViewController = destination
        let fromViewController = source
        
        let containerView = fromViewController.view.superview
        let originalCenter = fromViewController.view.center
        
        toViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toViewController.view.center = originalCenter
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            toViewController.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: { finished in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        })
    }
    
    private func animateCornerRotate() {
        let toViewController = destination
        let fromViewController = source
        
        toViewController.view.layer.anchorPoint = CGPoint.zero
        fromViewController.view.layer.anchorPoint = CGPoint.zero
        
        toViewController.view.layer.position = CGPoint.zero
        fromViewController.view.layer.position = CGPoint.zero
        
        let containerView: UIView? = fromViewController.view.superview
        toViewController.view.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 1.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: {
            fromViewController.view.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: { finished in
            let fromVC: UIViewController = self.source
            let toVC: UIViewController = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        })
    }
    
    private func animateFade() {
        let toViewController = destination
        let fromViewController = source
        
        let containerView = fromViewController.view.superview
        toViewController.view.alpha = 0
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            toViewController.view.alpha = 1
        }, completion: { finished in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        })
    }}

// MARK: Unwind Segue class
class CustomUnwindSegue: UIStoryboardSegue {
    
    var animationType: CustomSegueAnimation = .push
    
    override func perform() {
        switch animationType {
        case .push:
            animatePush()
        case .swipeDown:
            animateSwipeDown()
        case .growScale:
            animateGrowScale()
        case .cornerRotate:
            animateCornerRotate()
        case .fade:
            animateFade()
        }
    }
    
    private func animatePush() {
        let toViewController = destination
        let fromViewController = source
        
        let containerView = fromViewController.view.superview
        let screenBounds = UIScreen.main.bounds
        
        let finalToFrame = screenBounds
        let finalFromFrame = finalToFrame.offsetBy(dx: screenBounds.size.width, dy: 0)
        
        toViewController.view.frame = finalToFrame.offsetBy(dx: -screenBounds.size.width, dy: 0)
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
        }, completion: { finished in
            let fromVC: UIViewController = self.source
            fromVC.dismiss(animated: false, completion: nil)
        })
    }
    
    private func animateSwipeDown() {
        let toViewController = destination
        let fromViewController = source
        
        let containerView = fromViewController.view.superview
        let screenBounds = UIScreen.main.bounds
        
        let finalToFrame = screenBounds
        let finalFromFrame = finalToFrame.offsetBy(dx: 0, dy: -screenBounds.size.height)
        
        toViewController.view.frame = finalToFrame.offsetBy(dx: 0, dy: screenBounds.size.height)
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
        }, completion: { finished in
            let fromVC: UIViewController = self.source
            fromVC.dismiss(animated: false, completion: nil)
        })
    }
    
    private func animateGrowScale() {
        let toViewController = destination
        let fromViewController = source
        
        fromViewController.view.superview?.insertSubview(toViewController.view, at: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            fromViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        }, completion: { finished in
            let fromVC = self.source
            fromVC.dismiss(animated: false, completion: nil)
        })
    }
    
    private func animateCornerRotate() {
        let toViewController = destination
        let fromViewController = source
        
        toViewController.view.layer.anchorPoint = CGPoint.zero
        fromViewController.view.layer.anchorPoint = CGPoint.zero
        
        toViewController.view.layer.position = CGPoint.zero
        fromViewController.view.layer.position = CGPoint.zero
        
        let containerView = fromViewController.view.superview
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: {
            fromViewController.view.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: { finished in
            let fromVC = self.source
            fromVC.dismiss(animated: false, completion: nil)
        })
        
    }
    
    private func animateFade() {
        let toViewController = destination
        let fromViewController = source
        
        let containerView = fromViewController.view.superview
        toViewController.view.alpha = 1
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            toViewController.view.alpha = 0
        }, completion: { finished in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        })
    }
}

