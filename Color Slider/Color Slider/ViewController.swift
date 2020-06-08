//
//  ViewController.swift
//  Color Slider
//
//  Created by Md Rana Mahmud on 9/6/20.
//  Copyright © 2020 Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greenControl: UISlider!
    
    @IBOutlet weak var blueControl: UISlider!
    @IBOutlet weak var redControl: UISlider!
    @IBOutlet weak var colorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColorComponent(){
        if self.redControl == nil{
            return
        }
        
        let r:CGFloat = CGFloat(self.redControl.value)
        let g : CGFloat = CGFloat(self.greenControl.value)
        let b : CGFloat = CGFloat(self.blueControl.value)
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }


}

