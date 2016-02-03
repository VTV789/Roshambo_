//
//  ChoiceViewController.swift
//  Roshambo_
//
//  Created by Vinh Vu on 1/28/16.
//  Copyright © 2016 Vinh. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    // MARK: - 
    // MARK: Programmatic Approach

    @IBAction func playRock(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewConstroller") as! ResultsViewController
        vc.userChoice = getUserShape(sender)
        presentViewController(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: Utilites
    // The enum "Shape" represents a play or move
    private func getUserShape(sender: UIButton) -> Shape {
        // Titles are set to one of : Rock, Paper, or Scissors
        let shape = sender.titleForState(.Normal)!
        return Shape(rawValue: shape)!
    }
    
}



