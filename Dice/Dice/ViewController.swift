//
//  ViewController.swift
//  Dice
//
//  Created by Md Rana Mahmud on 9/6/20.
//  Copyright © 2020 Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func randomDiceValue() -> Int{
        let randomValue = 1 + arc4random() % 6
        return Int(randomValue)
    }
    
    @IBAction func rollTheDice(){
        let controller:DiceViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "DiceViewController")
        as! DiceViewController
        present(controller, animated: true, completion: nil)
    }

}

