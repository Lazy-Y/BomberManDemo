//
//  DemoCell.swift
//  BomberManDemo
//
//  Created by 钟镇阳 on 11/29/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit

class DemoCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var demoImage: UIImageView!

    @IBOutlet weak var demoText: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
