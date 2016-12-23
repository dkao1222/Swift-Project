//
//  ViewController.swift
//  BMIcacl
//
//  Created by KaoDragon on 2016/12/16.
//  Copyright © 2016年 KaoDragon. All rights reserved.
//

import UIKit
import Firebase
import GoogleMobileAds


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textHeight: UITextField!
    @IBOutlet weak var textWeight: UITextField!
    
    @IBOutlet weak var labelBMIValue: UILabel!
   
    @IBOutlet weak var bannerView: GADBannerView!
    
    
    @IBOutlet weak var labelBMIAnswer: UILabel!
    
    @IBOutlet weak var imagePlay: UIImageView!
    
    @IBAction func btnCheckBMI(_ sender: UIButton) {
        let Height = Double(textHeight.text!)
        let Weight = Double(textWeight.text!)
        
        
        
        if textWeight.text!.isEmpty || textHeight.text!.isEmpty {
            alertButton()
        }else{
            let mHeight = Height!/100
            
            let BMIvalue = Weight!/(mHeight*mHeight)
            
            labelBMIValue.text = String(BMIvalue)
            if BMIvalue < 18.5 {
                labelBMIAnswer.text = "太輕"
                labelBMIAnswer.textColor = UIColor.purple
                labelBMIValue.textColor = UIColor.purple
                imagePlay.image = UIImage(named: "body01.png")
                
            }else if BMIvalue >= 18.5 && BMIvalue < 24 {
                labelBMIAnswer.text = "健康"
                labelBMIAnswer.textColor = UIColor.green
                labelBMIValue.textColor = UIColor.green
                imagePlay.image = UIImage(named: "body01.png")
                
            }else if BMIvalue >= 24 && BMIvalue < 27 {
                labelBMIAnswer.text = "過重"
                labelBMIAnswer.textColor = UIColor.blue
                labelBMIValue.textColor = UIColor.blue
                imagePlay.image = UIImage(named: "body02.png")
                
            }else if BMIvalue >= 27 && BMIvalue < 30 {
                labelBMIAnswer.text = "輕肥"
                labelBMIAnswer.textColor = UIColor.blue
                labelBMIValue.textColor = UIColor.blue
                imagePlay.image = UIImage(named: "body03.png")
                
            }else if BMIvalue >= 30 && BMIvalue < 35 {
                labelBMIAnswer.text = "中肥"
                labelBMIAnswer.textColor = UIColor.red
                labelBMIValue.textColor = UIColor.red
                imagePlay.image = UIImage(named: "body04.png")
                
            }else{
                labelBMIAnswer.text = "重肥"
                labelBMIAnswer.textColor = UIColor.red
                labelBMIValue.textColor = UIColor.red
                imagePlay.image = UIImage(named: "body05.png")
                
            }
        }

    }
    
    func addToolBar(textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.donePress))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
        
    }
    
    func donePress(){
        view.endEditing(true)
    }
    
    func alertButton(){
        let alertEntry = UIAlertController(title: "Error", message: "Please entry your Weight(KG) or Height(CM)", preferredStyle: UIAlertControllerStyle.alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: {(action: UIAlertAction!) -> Void in print("Confirm")})
        
        alertEntry.addAction(confirmAction)
        
        
        self.present(alertEntry, animated: true, completion: nil)
        
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToolBar(textField: textWeight)
        addToolBar(textField: textHeight)
        
        
        labelBMIAnswer.text = ""
        labelBMIValue.text = "0"
        
        //bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        //bannerView.rootViewController = self
        //bannerView.load(GADRequest())

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

