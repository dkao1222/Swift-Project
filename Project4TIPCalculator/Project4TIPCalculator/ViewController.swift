//
//  ViewController.swift
//  Project4TIPCalculator
//
//  Created by KaoDragon on 2016/6/14.
//  Copyright © 2016年 KaoDragon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var countInfoLabel: UILabel!

    @IBOutlet weak var textInput: UITextField!

    @IBOutlet weak var tipCountLabel: UILabel!
    
    @IBOutlet weak var totalCountLabel: UILabel!
    
  
    @IBAction func textInputFunc(sender: UITextField) {
        
    }
    
          
    @IBAction func slideInfo(sender: UISlider) {
        
        let slideCount: Float = slideFunc.value
        let tipCount: Double = Double(textInput.text!)! * Double(lrintf(slideCount))/100
        let totalCount: Double = tipCount + Double(textInput.text!)!
        countInfoLabel.text = "Tip (" + String(lrintf(slideCount)) + ") %"
        tipCountLabel.text = String(tipCount)
        totalCountLabel.text = String(totalCount)
        
        print(slideCount)
        
        
    }
    
    
    @IBOutlet weak var slideFunc: UISlider!
    
    
    func addToolBar(textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViewController.donePress))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
        
    }
    
    func donePress() {
        view.endEditing(true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToolBar(textInput)
        textInput.text = "0"

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

