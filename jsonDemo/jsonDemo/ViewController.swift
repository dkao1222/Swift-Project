//
//  ViewController.swift
//  jsonDemo
//
//  Created by Dragon Kao on 2016/12/27.
//  Copyright © 2016年 Dragon Kao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //let url = "http://opendata2.epa.gov.tw/AQX.json"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set file path oin Bundle test open data json url
        let url = Bundle.main.url(forResource: "weatherjson", withExtension: "json")
        
        // Set file path oin Bundle test simple json url
        let urlSimple = Bundle.main.url(forResource: "weather", withExtension: "json")
        
        
        // Get file form url
        let data = try? Data(contentsOf: urlSimple!)
        let dataWeather = try? Data(contentsOf: url!)
        
        // print data/dataWeather total bytes
        print(data)
        print(dataWeather)
        
        
        // Transfer to JSON object
        let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
        
        // Transfer to JSON object
        let weather = try? JSONSerialization.jsonObject(with: dataWeather!, options: .mutableContainers)
        
        // name get JSON data from Direct
        if let json = jsonObj as? [String : Any] {
            if let name = json["name"] as? String {
                print(name)
            }
        }
        
        // dec get JSON data from json array data from urlSimple
        if let json = jsonObj as? [String : Any] {
            if let weathers = json["weather"] as? [[String : Any]] {
                if let weather = weathers.first {
                    if let desc = weather["description"] as? String {
                        print(desc)
                    }
                }
            }
        }
        
        
        // dec get JSON data from json array data from urlSimple
        if let json = jsonObj as? [String : Any],
            let weathers = json["weather"] as? [[String : Any]],
            let weather = weathers.first,
            let desc = weather["description"] as? String {
                print(desc)
            }
        
        
        // get weather data value key is County
        if let weathers = weather as? [[String: AnyObject]] {
            for dataArray in weathers {
                let County = dataArray["County"] as? AnyObject!
                print(County)
            }
            
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}

