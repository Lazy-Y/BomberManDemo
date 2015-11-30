//
//  ViewController.swift
//  BomberManDemo
//
//  Created by 钟镇阳 on 11/29/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit

class TeamPage: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.backgroundView = UIImageView(image: UIImage(named: "team"))
        table.allowsSelection = false
        table.delegate = self
        table.dataSource = self
        let nib = UINib(nibName: "DemoCell", bundle: nil)
        table.registerNib(nib, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    let teamInfo = ["\tVeni, vidi, vici\n\tI came; I saw; I conquered","\tget outta here it's gonna blow","\tCarpe Diem Seize the day","\tSleep eat code cycle","\tPerformance just ended. Heading back over","\tWhat a beautiful day to write some codes."]
    let titleInfo = ["Zhenyang Zhong","Cheuk Yin Matthew Lam","Ellen Jiahui Wei", "Yiqing Xu", "Brandon Horton","Zhongyang Gao"]
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return teamInfo.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = self.table.dequeueReusableCellWithIdentifier("cell") as! DemoCell
        
        cell.demoImage.image = UIImage(named: "t"+String(indexPath.row))
        cell.demoText.text = teamInfo[indexPath.row]
        cell.title.text = titleInfo[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300;
    }

}

