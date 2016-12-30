//
//  ViewController.swift
//  Project2LongPressCounter
//
//  Created by KaoDragon on 2016/5/25.
//  Copyright © 2016年 KaoDragon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var step : Int = 0
    
    @IBOutlet weak var CounterLabel: UILabel!
    
    @IBAction func tapButton(_ sender: AnyObject) {
        step = step + 1
        updateLabel()
    }
        
    @IBAction func longPressButton(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .changed {
            step = step + 1
            updateLabel()
        }
    }
    @IBAction func resetButton(_ sender: AnyObject) {
        step = 0
        updateLabel()
    }
    
    func updateLabel() {
        CounterLabel.text = String(step)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        step = 0
        updateLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

