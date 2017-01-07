//
//  TableViewController.swift
//  weatherJsonOpenData
//
//  Created by KaoDragon on 2017/1/5.
//  Copyright © 2017年 KaoDragon. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let url = URL(string: "http://opendata2.epa.gov.tw/AQX.json")
    
    var weatherArray = [AnyObject]()
    
   
    func jsonGet() {
        let data = try? Data(contentsOf: url!)
        
        //let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
        let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
        
        do {
            if let jsonObj = json as? [[String : Any]] {
                for dataArray in jsonObj {
                    weatherArray.append(dataArray as AnyObject!)
                }
            }
        } catch {
            fatalError("unKnow")
        }
        
        //self.tableView.reloadData()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return 0
        return weatherArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.SiteName.text = weatherArray[indexPath.row]["SiteName"] as? String
        cell.PM10.text = weatherArray[indexPath.row]["PM10"] as? String
        cell.PM25.text = weatherArray[indexPath.row]["PM2.5"] as? String
        cell.PublishTime.text = weatherArray[indexPath.row]["PublishTime"] as? String
        cell.Status.text = weatherArray[indexPath.row]["Status"] as? String
        
        let PM10Label = weatherArray[indexPath.row]["PM10"] as? String
        let PM25Label = weatherArray[indexPath.row]["PM2.5"] as? String
        
        if Int(PM10Label!)! <= 16 {
            cell.PM10.backgroundColor = UIColor.init(red: 102/255, green: 255/255, blue: 158/255, alpha: 1)
            cell.PM10.textColor = UIColor.black
        } else if Int(PM10Label!)! >= 17 && Int(PM10Label!)! <= 33 {
            cell.PM10.backgroundColor = UIColor.init(red: 0/255, green: 255/255, blue: 26/266, alpha: 1)
            cell.PM10.textColor = UIColor.black
        } else if Int(PM10Label!)! >= 34 && Int(PM10Label!)! <= 50 {
            cell.PM10.backgroundColor = UIColor.init(red: 0/255, green: 220/255, blue: 17/255, alpha: 1)
            cell.PM10.textColor = UIColor.black
        } else if Int(PM10Label!)! >= 51 && Int(PM10Label!)! <= 58 {
            cell.PM10.backgroundColor = UIColor.init(red: 248/255, green: 255/255, blue: 17/255, alpha: 1)
            cell.PM10.textColor = UIColor.black
        } else if Int(PM10Label!)! >= 59 && Int(PM10Label!)! <= 66 {
            cell.PM10.backgroundColor = UIColor.init(red: 255/255, green: 211/255, blue: 0/255, alpha: 1)
            cell.PM10.textColor = UIColor.black
        } else if Int(PM10Label!)! >= 67 && Int(PM10Label!)! <= 75 {
            cell.PM10.backgroundColor = UIColor.init(red: 255/255, green: 150/255, blue: 0/255, alpha: 1)
            cell.PM10.textColor = UIColor.black
        } else if Int(PM10Label!)! >= 76 && Int(PM10Label!)! <= 83 {
            cell.PM10.backgroundColor = UIColor.init(red: 255/255, green: 75/255, blue: 85/255, alpha: 1)
            cell.PM10.textColor = UIColor.black
        } else if Int(PM10Label!)! >= 84 && Int(PM10Label!)! <= 91 {
            cell.PM10.backgroundColor = UIColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
            cell.PM10.textColor = UIColor.black
        } else if Int(PM10Label!)! >= 92 && Int(PM10Label!)! <= 100 {
            cell.PM10.backgroundColor = UIColor.init(red: 169/255, green: 0/255, blue: 0/255, alpha: 1)
            cell.PM10.textColor = UIColor.white
        } else if Int(PM10Label!)! >= 101  {
            cell.PM10.backgroundColor = UIColor.init(red: 232/255, green: 0/255, blue: 254/255, alpha: 1)
            cell.PM10.textColor = UIColor.white
        } else {
            cell.PM10.backgroundColor = UIColor.gray
        }
        
        return cell
    }
    
//    Rgb : 102.255.158
//    Rgb : 0.255.26
//    Rgb : 0.220.17
//    Rgb : 248.255.0
//    Rgb : 255.211.0
//    Rgb : 255.150.0
//    Rgb : 255.75.85
//    Rgb : 255.0.0
//    Rgb : 169.0.0
//    Rgb : 232.0.254
    


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false
        
        

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        jsonGet()
        self.tableView.reloadData()
        
    }
    
    

    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
