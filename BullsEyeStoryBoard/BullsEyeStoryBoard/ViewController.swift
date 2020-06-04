//
//  ViewController.swift
//  BullsEyeStoryBoard
//
//  Created by Md Rana Mahmud on 30/5/20.
//  Copyright © 2020 Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue  = 0
    var score = 0
    var round = 1
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentValue = Int(slider.value.rounded())
            print("The value of the slider is now \(slider.value)")
        targetValue = Int.random(in: 1...100)
        startNewRound()
    }
    
    @IBAction func showAlert(){
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        score += points
        let message = "THe value of the slider is now \(currentValue)" +
        "\nTarget Value is \(targetValue)" +
        "\n The difference is \(difference)"
        let alert = UIAlertController(title: "Hello WOrld", message:message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        updateLabels()
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = Int(slider.value.rounded())
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateRound() {
        round += 1
        roundLabel.text = String(round)
    }


    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)

    }
}

