//
//  MasterViewController.swift
//  weatherJSON
//
//  Created by Dragon Kao on 2016/12/30.
//  Copyright © 2016年 Dragon Kao. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, URLSessionDelegate, URLSessionDownloadDelegate {

    var detailViewController: DetailViewController? = nil
    
    var objects = [Any]()
    var weratherArray = [AnyObject]() // Create Temp Array
    var countyArray = [AnyObject]()
    var siteNameArray = [AnyObject]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set data from Opendata get JSON format
        let url = URL(string: "http://opendata2.epa.gov.tw/AQX.json")
        
        // Config using URLSession and set Default
        let sessionWuthConfig = URLSessionConfiguration.default
        
        // Config URLSession and forword to self
        let session = URLSession(configuration: sessionWuthConfig, delegate: self, delegateQueue: nil)
        
        // set start up task type using download Task
        let dataTask = session.downloadTask(with: url!)
        
        // task Startup
        dataTask.resume()
        
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        //return weratherArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return objects.count
        
        return weratherArray.count
        //return County.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        //let object = objects[indexPath.row] as! NSDate
        //cell.textLabel!.text = object.description
        //cell.textLabel?.text = weratherArray[indexPath.row]["A_Name_Ch"] as? String
       
        cell.textLabel?.text = weratherArray[indexPath.row] as? String
        
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        
        do {

            //var dataArray = [AnyObject]()
            let data = try Data(contentsOf: location)
            //let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            

            if let dataArray = json as? [[String : AnyObject]] {
                for jsonArray in dataArray {
//                    let County  = jsonArray["County"] as AnyObject!
                    let SiteName = jsonArray["SiteName"] as AnyObject!
//                    let Status = jsonArray["Status"] as AnyObject!
//                    let PM10 = jsonArray["PM10"] as AnyObject!
//                    let PM25 = jsonArray["PM2.5"] as AnyObject!
//                    let PublishTime = jsonArray["PublishTime"] as AnyObject!
                    
                    
                    weratherArray.append(SiteName as AnyObject)

                    //print(County)
                }
                //weratherArray.append(dataArray["County"])
            }
            //weratherArray = dataArray?[0]["County"] as? [AnyObject]
            self.tableView.reloadData()
           
        } catch {
            print("Error")
            
        }
        
    
    }


}

