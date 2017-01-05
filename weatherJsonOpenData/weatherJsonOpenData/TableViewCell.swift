//
//  TableViewCell.swift
//  weatherJsonOpenData
//
//  Created by Dragon Kao on 2017/1/5.
//  Copyright © 2017年 KaoDragon. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var SiteName: UILabel!
    
    @IBOutlet weak var PM10: UILabel!
    
    @IBOutlet weak var PM25: UILabel!
    
    @IBOutlet weak var PublishTime: UILabel!
    
    @IBOutlet weak var Status: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
