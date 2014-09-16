//
//  GrowScaleSegue.swift
//  CustomSegues
//
//  Created by William Archimede on 15/09/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

import UIKit

class GrowScaleSegue: UIStoryboardSegue {
    override func perform() {
        let toViewController: UIViewController = self.destinationViewController as UIViewController
        let fromViewController: UIViewController = self.sourceViewController as UIViewController
        
        let containerView: UIView? = fromViewController.view.superview
        let originalCenter: CGPoint = fromViewController.view.center
        
        toViewController.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
        toViewController.view.center = originalCenter
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion: { finished in
                let fromVC: UIViewController = self.sourceViewController as UIViewController
                let toVC: UIViewController = self.destinationViewController as UIViewController
                fromVC.presentViewController(toVC, animated: false, completion: nil)
            })
    }
}

class GrowScaleUnwindSegue: UIStoryboardSegue {
    override func perform() {
        let toViewController: UIViewController = self.destinationViewController as UIViewController
        let fromViewController: UIViewController = self.sourceViewController as UIViewController
        
        fromViewController.view.superview?.insertSubview(toViewController.view, atIndex: 0)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                fromViewController.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
            }, completion: { finished in
                let fromVC: UIViewController = self.sourceViewController as UIViewController
                let toVC: UIViewController = self.destinationViewController as UIViewController
                toVC.view.removeFromSuperview()
                fromVC.dismissViewControllerAnimated(false, completion: nil)
        })
    }
}
