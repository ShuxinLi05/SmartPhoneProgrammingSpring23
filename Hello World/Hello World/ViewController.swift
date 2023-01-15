//
//  ViewController.swift
//  Hello World
//
//  Created by shuxin on 1/14/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblExample: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("I am inside viewDidLoad() function")
    }


    @IBAction func pressMeAction(_ sender: UIButton) {
        print("Hello World")
        lblExample.text = "Hello World"
    }
}

