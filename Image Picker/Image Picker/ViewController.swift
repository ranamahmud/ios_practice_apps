//
//  ViewController.swift
//  Image Picker
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

    @IBAction func experiment(sender: UIButton){
        let image = UIImage()
        let nextController = UIActivityViewController(activityItems: [image],
                                                     applicationActivities:nil)
        present(nextController, animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }

}

