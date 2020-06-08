//
//  ViewController.swift
//  Click
//
//  Created by Md Rana Mahmud on 8/6/20.
//  Copyright © 2020 Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var redControl: UISwitch!
    @IBOutlet weak var greenControl: UISwitch!
    @IBOutlet weak var blueControl: UISwitch!
    @IBOutlet weak var colorView: UITextView!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func incrementCount() {
        self.count += 1
        self.label.text = "\(self.count)"
    }
    
    @IBAction func changeColorComponent(){
        if self.redControl == nil{
            return
        }
        let r: CGFloat = self.redControl.isOn ? 1 : 0
        let g: CGFloat = self.greenControl.isOn ? 1 : 0
        let b: CGFloat = self.blueControl.isOn ? 1 : 0
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha : 1)
        
    }
}

