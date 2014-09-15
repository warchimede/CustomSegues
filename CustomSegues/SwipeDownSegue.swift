//
//  CustomSegue.swift
//  CustomSegues
//
//  Created by William Archimede on 15/09/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

import UIKit

class SwipeDownSegue: UIStoryboardSegue {
    override func perform() {
        let toViewController: UIViewController = self.destinationViewController as UIViewController
        let fromViewController: UIViewController = self.sourceViewController as UIViewController
        
        let containerView: UIView? = fromViewController.view.superview
        let screenBounds: CGRect = UIScreen.mainScreen().bounds
        
        let finalToFrame: CGRect = screenBounds
        let finalFromFrame: CGRect = CGRectOffset(finalToFrame, 0, screenBounds.size.height)
        
        toViewController.view.frame = CGRectOffset(finalToFrame, 0, -screenBounds.size.height)
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
            }, completion: { finished in
                let fromVC: UIViewController = self.sourceViewController as UIViewController
                let toVC: UIViewController = self.destinationViewController as UIViewController
                fromVC.presentViewController(toVC, animated: false, completion: nil)
        })
    }
}

class SwipeDownUnwindSegue: UIStoryboardSegue {
    override func perform() {
        let toViewController: UIViewController = self.destinationViewController as UIViewController
        let fromViewController: UIViewController = self.sourceViewController as UIViewController
        
        let containerView: UIView? = fromViewController.view.superview
        let screenBounds: CGRect = UIScreen.mainScreen().bounds
        
        let finalToFrame: CGRect = screenBounds
        let finalFromFrame: CGRect = CGRectOffset(finalToFrame, 0, -screenBounds.size.height)
        
        toViewController.view.frame = CGRectOffset(finalToFrame, 0, screenBounds.size.height)
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
            }, completion: { finished in
                let fromVC: UIViewController = self.sourceViewController as UIViewController
                let toVC: UIViewController = self.destinationViewController as UIViewController
                fromVC.dismissViewControllerAnimated(false, completion: nil)
        })
    }
}