//
//  ViewController.swift
//  CustomSegues
//
//  Created by William Archimede on 15/09/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue is CustomSegue {
            (segue as! CustomSegue).animationType = .Push
        }
    }
    
    @IBAction func go() {
        performSegueWithIdentifier("CustomSegue", sender: nil)
    }
    
    @IBAction func unwindFromViewController(sender: UIStoryboardSegue) {
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        let segue = CustomUnwindSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        segue.animationType = .Push
        return segue
    }
    
}