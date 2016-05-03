//
//  ViewController.swift
//  RuntimeSubclassing
//
//  Created by Ross LeBeau on 5/2/16.
//  Copyright © 2016 Ross LeBeau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var exampleView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func forceExampleLayoutSubviews() {
        exampleView.setNeedsLayout()
        exampleView.layoutIfNeeded()
    }

}

