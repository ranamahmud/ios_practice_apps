//
//  GameViewController.swift
//  Roshambo
//
//  Created by Md Rana Mahmud on 10/6/20.
//  Copyright © 2020 Rana. All rights reserved.
//

import UIKit

// MARK: Shape: String

enum Shape: String{
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    
  
    static func randomShape() -> Shape{
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}

class GameViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
      
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Properties
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    //MARK : LIfe Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    private func displayResult(){
        var imageName:String
        var text: String
        let matchup = "\(userChoice.rawValue) vs \(opponentChoice.rawValue)"
        
        switch (userChoice!, opponentChoice){
        case let (user, opponent) where user == opponent:
            text = "\(matchup): It's a tie"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You with with\(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        imageName = imageName.lowercased()
        imageView.image = UIImage(named: imageName)
        resultLabel.text = text
    }
   // MARK: Actions
    @IBAction private func playAgain(){
        dismiss(animated: true, completion: nil)
    }


}
