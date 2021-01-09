//
//  ViewController.swift
//  ProjectA
//
//  Created by muhlenXi on 2019/5/13.
//  Copyright © 2019 muhlenXi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func openBAction(_ sender: UIButton) {
        
        let entity = MXURLSchemeEntity(scheme: "bb", action: "login", parameters: ["uid": "20162883"])
        MXURLSchemeUtil.OpenApp(urlScheme: entity)
    }
}

