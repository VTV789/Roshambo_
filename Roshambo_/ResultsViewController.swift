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
        let randomChoice = Int(arc4random_uniform, (3))
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

}