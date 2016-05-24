//
//  ViewController.swift
//  Project1TapCounter
//
//  Created by KaoDragon on 2016/5/24.
//  Copyright © 2016年 KaoDragon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var step: Int!

    @IBOutlet weak var CounterLabel: UILabel!
    
    
    @IBAction func RestButton(sender: UIButton) {
        step = 0
        updateCounterLabel()
    }
    
    @IBAction func TapButton(sender: UIButton) {
        
        step = step + 1
        updateCounterLabel()
    }
    
    func updateCounterLabel() {
        
        CounterLabel.text = String(step)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        step = 0
        updateCounterLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

