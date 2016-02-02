//
//  ResultsViewController.swift
//  Roshambo_
//
//  Created by Vinh Vu on 1/30/16.
//  Copyright © 2016 Vinh. All rights reserved.
//

import UIKit

// The enum "Shape" represents a play or move 
enum Shape: String {
    case Rock = "Rock"
    case Paper = "Pager"
    case Scissors = "Scissors"
    
    // This func randomly generates an opponent's play
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissor"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
    
}

class ResultsViewController: UIViewController {
    // MARK: Outlets
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Shapes
    // When the ResultsViewController is initialized a userChoice is passed and an opponent's play is generated.
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    // MARK: - 
    // MARK: View Lifecycle 
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    // MARK: -
    // MARK: UI
    
    // The displayResult method generates the image and message for the results of match.
    private func displayResult() {
        // Ideally, most of the would be handled by a model.
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You lose with \(matchup) :(. "
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercaseString
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text

    }
   
    @IBAction func playAgain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}