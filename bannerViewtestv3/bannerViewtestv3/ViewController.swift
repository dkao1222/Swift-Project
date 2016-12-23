//
//  ViewController.swift
//  bannerViewtestv3
//
//  Created by KaoDragon on 2016/12/20.
//  Copyright © 2016年 KaoDragon. All rights reserved.
//

import Firebase
import GoogleMobileAds
import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var bannerView: GADBannerView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

