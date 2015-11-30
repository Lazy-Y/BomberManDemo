//
//  DemoPage.swift
//  BomberManDemo
//
//  Created by 钟镇阳 on 11/29/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit

class DemoPage: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    let titleInfo = ["Start","Login","Room","Gameplay","Bombs","    Items","Help","Results"]
    
    let gameInfo = ["\tPress any key to proceed.",
        "\tInsert the address and port of the login server, and your username and password to sign up/sign in. Otherwise, choose quick game to play with bots without an account.",
        "\tThe host can choose the number of players, and the time of a game. The host chooses start game or start game with ai.",
        "\tUse arrow keys to move your bomberman, and spacebar to drop a bomb.",
        "\tBombs detonate seconds after, and your bomberman will wait a while to cool down before he drops another bomb.",
        "\tA bomberman at most possess 2 items. These items will increase/decrease his speed, bomb power, cooling time, and detonating time of his bombs.",
        "\tPress \"Help\" at the top left corner to check effects of items.",
        "\tA window will pop up and display the results when the game ends."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.allowsSelection = false
        table.backgroundView = UIImageView(image: UIImage(named: "game"))
        table.delegate = self
        table.dataSource = self
        let nib = UINib(nibName: "DemoCell", bundle: nil)
        table.registerNib(nib, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return gameInfo.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = self.table.dequeueReusableCellWithIdentifier("cell") as! DemoCell
        
        cell.demoImage.image = UIImage(named: String(indexPath.row))
        cell.demoText.text = gameInfo[indexPath.row]
        cell.title.text = titleInfo[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
