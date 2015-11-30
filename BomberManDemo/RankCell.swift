//
//  RankCell.swift
//  BomberManDemo
//
//  Created by 钟镇阳 on 11/29/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit

class RankCell: UITableViewCell {

    @IBOutlet weak var rank: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var points: UILabel!
    
    @IBOutlet weak var kill: UILabel!
    
    @IBOutlet weak var death: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
