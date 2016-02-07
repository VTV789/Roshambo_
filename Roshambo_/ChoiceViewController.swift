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

    @IBAction private func playRock(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        vc.userChoice = getUserShape(sender)
        presentViewController(vc, animated: true, completion: nil)
       
    }
    
    // MARK: Segue with Code Approach

    @IBAction func playPaper(sender: UIButton) {
        performSegueWithIdentifier("play", sender: sender)
    }
    
    // MARK: Segue 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "play" {
            let vc = segue.destinationViewController as! ResultsViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }

    // MARK: Utilites
    // The enum "Shape" represents a play or move
    private func getUserShape(sender: UIButton) -> Shape {
        // Titles are set to one of : Rock, Paper, or Scissors
        let shape = sender.titleForState(.Normal)!
        return Shape(rawValue: shape)!
    }
}




