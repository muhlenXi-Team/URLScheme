//
//  ViewController.swift
//  ProjectB
//
//  Created by muhlenXi on 2019/5/13.
//  Copyright © 2019 muhlenXi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openAction(_ sender: UIButton) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
           delegate.backProjectA()
        }
    }
}

