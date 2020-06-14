//
//  ViewController.swift
//  Roshambo
//
//  Created by Md Rana Mahmud on 10/6/20.
//  Copyright © 2020 Rana. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    // MARK: Progmatic Approach
    @IBAction private func playRock(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(identifier: "GameViewController") as! GameViewController
        vc.userChoice = getUserShape(sender)
        present(vc, animated: true, completion: nil)
    }
     // MARK: Segue with Code Approach
    @IBAction private func playPaper(_ sender: UIButton){
        performSegue(withIdentifier: "play", sender: sender)
    }
     // MARK: Segu
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play"{
            let vc = segue.destination as! GameViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Utilities
    
    private func getUserShape(_ sender: UIButton) -> Shape{
        let shape = sender.title(for: UIControl.State())!
        return Shape(rawValue: shape)!
    }


}

