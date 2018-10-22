//
//  ViewController.swift
//  Example
//
//  Created by zhujl on 2018/10/13.
//  Copyright © 2018年 finstao. All rights reserved.
//

import UIKit
import MessageInput

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let input = MessageInput(configuration: Configuration())
        input.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(input)
        
        view.addConstraints([
            NSLayoutConstraint(item: input, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: input, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: input, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

