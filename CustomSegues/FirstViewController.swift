//
//  ViewController.swift
//  CustomSegues
//
//  Created by William Archimede on 15/09/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue is CustomSegue {
            (segue as! CustomSegue).animationType = .push
        }
    }
    
    @IBAction func go() {
        performSegue(withIdentifier: "CustomSegue", sender: nil)
    }
    
    @IBAction func unwindFromViewController(_ sender: UIStoryboardSegue) {
    }
    
    override func segueForUnwinding(to toViewController: UIViewController, from fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        let segue = CustomUnwindSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        segue.animationType = .push
        return segue
    }
    
}
