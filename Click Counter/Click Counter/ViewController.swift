//
//  ViewController.swift
//  Click Counter
//
//  Created by Md Rana Mahmud on 4/6/20.
//  Copyright © 2020 Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func incrementCount() {
        self.count += 1
        self.label.text = "\(self.count)"
    }
  
    



}

