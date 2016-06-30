//
//  firstClass.swift
//  autoLayout
//
//  Created by excelencia on 15/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import UIKit

class firstClass: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    var customtable: UITableView = UITableView()
    var resultTablevalues: NSArray = NSArray()
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        _ = UIApplication.sharedApplication().delegate as! AppDelegate
        singletonClass.sharedInstance.shouldRotate = true // or false to disable rotation
        

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            
            menuBtn.target = self.revealViewController();
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:));
            
            self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer());
          //  self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer());
            
        }
        
        self.view.backgroundColor = UIColor.grayColor();
        
        
        let notificationSelector: Selector = #selector(firstClass.methodOfReceivedNotification(_:))

        NSNotificationCenter.defaultCenter().addObserver(self, selector:notificationSelector, name: "webServiceLoaded", object: nil);
    
        customtable.frame = UIScreen .mainScreen().bounds;
        customtable.dataSource = self;
        customtable.delegate = self;
        
        customtable.autoresizingMask = [.FlexibleWidth,.FlexibleHeight,.FlexibleTopMargin,.FlexibleBottomMargin,.FlexibleLeftMargin,.FlexibleRightMargin];
        
        customtable.rowHeight = 150;
        
        customtable.registerClass(tableCustomCell.self, forCellReuseIdentifier: "Cell");
        
        
        
        //Web service call to display
        webServiceClass .webServiceSharedInstance.getMethod("http://www.raywenderlich.com/demos/weather_sample/weather.php?format=json");
        
        activityIndicator.frame = CGRectMake(UIScreen.mainScreen().bounds.width/2-100, UIScreen.mainScreen().bounds.height/2-100, 100, 100);
        activityIndicator.color = UIColor.redColor();
        
        activityIndicator.startAnimating();
        
        customtable.addSubview(activityIndicator);

        self.view .addSubview(customtable);

    }

    func methodOfReceivedNotification(notification: NSNotification){
        
        var result: NSDictionary = NSDictionary();
        
        result = notification.object as! NSDictionary;

        resultTablevalues =  (result.valueForKey("data")?.valueForKey("weather"))! as! NSArray;
        
        dispatch_async(dispatch_get_main_queue()){
            
            self.activityIndicator.stopAnimating();
            
            self.activityIndicator .removeFromSuperview();
            
            self.customtable.reloadData();
            
            };

    }
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return resultTablevalues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:tableCustomCell=tableCustomCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
        
//        var cell: tableCustomCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! tableCustomCell;
        
        cell = tableCustomCell(style: .Default, reuseIdentifier: "cell");
        
        cell.label1.text = resultTablevalues.objectAtIndex(indexPath.row).valueForKey("weatherDesc")?.objectAtIndex(0).valueForKey("value") as? String;
        
        let url = NSURL(string: (resultTablevalues.objectAtIndex(indexPath.row).valueForKey("weatherIconUrl")?.objectAtIndex(0).valueForKey("value") as? String)!);
        
        let data = NSData(contentsOfURL: url!)
        cell.imageToShow.image = UIImage(data: data!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
