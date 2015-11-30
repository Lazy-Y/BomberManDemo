//
//  RankPage.swift
//  BomberManDemo
//
//  Created by 钟镇阳 on 11/29/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit

class RankPage: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var table: UITableView!
    
    var dic:Array<Dictionary<String,String>> = []
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.allowsSelection = false
        table.backgroundView = UIImageView(image: UIImage(named: "rank"))
        table.backgroundView?.alpha = CGFloat(0.5)
        
        table.delegate = self
        table.dataSource = self
        
        let nib = UINib(nibName: "RankCell", bundle: nil)
        table.registerNib(nib, forCellReuseIdentifier: "cell")
        getData()
        
        refreshControl.addTarget(self, action: "getData", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "refresh")
        table.addSubview(refreshControl)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(){
        let task = NSURLSession.sharedSession().dataTaskWithRequest(newPostRequest()){
            (data,resp,err) in
            self.connect(data, resp: resp, err: err, myTask:self.refreshData, vc: self)
        }
        task.resume()
        refreshControl.endRefreshing()
    }
    
    func refreshData(info:Array<Dictionary<String,String>>?)->Void{
        print(info)
        print("Success load data")
        if info != nil{
            dic = info!
            table.reloadData()
        }
        
    }
    
    let mainURL = "http://localhost/phpmyadmin/mywork/BomberServer/rank.php"
    
    func errMsg(title:String,msg:String,vc:UIViewController){
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel){(action) in}
            let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(cancelAction)
            vc.presentViewController(alert, animated: true, completion: nil)
        })
    }
    
    func checkStatus(dic:Array<Dictionary<String,String>>,vc:UIViewController)->Bool{
//        if dic["status"] as! String == "false"{
//            errMsg("Sorry", msg: dic["errMsg"] as! String, vc: vc)
//            return false
//        }
        return true
    }
    
    func getData(data:NSData?)->Array<Dictionary<String,String>>?{
        if let receive = (try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as? Array<Dictionary<String,String>>{
            return receive
        }
        return nil
    }
    
    func connect(data:NSData?,resp:NSURLResponse?,err:NSError?, myTask:(Array<Dictionary<String,String>>?)->Void,vc:UIViewController){
        if (err==nil){
            let receive = getData(data)
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            if receive != nil{
                if !checkStatus(receive!, vc: vc){
                    return
                }
                else {
                    myTask(receive!)
                }
                
            }
            else {
//                errMsg("Error", msg: "Error loading data", vc: vc)
            }
        }
        else {
            errMsg("Error", msg: (err?.localizedDescription)!, vc: vc)
        }
    }
    
    func newPostRequest()->NSURLRequest{
        let url = NSURL(string: mainURL)
        let request = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 10.0)
        request.HTTPMethod = "POST"
        request.HTTPBody = "".dataUsingEncoding(NSUTF8StringEncoding)
        return request
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dic.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = self.table.dequeueReusableCellWithIdentifier("cell") as! RankCell
        let temp = dic[indexPath.row]
        cell.rank.text = "Rank: " + String(indexPath.row+1)
        cell.name.text = temp["username"]
        cell.points.text = "Points: " + temp["points"]!
        cell.kill.text = "Kills: " + temp["kills"]!
        cell.death.text = "Deaths: " + temp["deaths"]!
        cell.Date.text = temp["time"]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 125;
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
