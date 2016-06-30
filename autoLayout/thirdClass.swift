//
//  thirdClass.swift
//  autoLayout
//
//  Created by excelencia on 15/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import UIKit

class thirdClass: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview_Stories: UITableView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    var identifier: String = "Customcell";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = UIApplication.sharedApplication().delegate as! AppDelegate
        singletonClass.sharedInstance.shouldRotate = false // or false to disable rotation
        
        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            
            menuBtn.target = self.revealViewController();
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:));
            
           // self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer());
            
            //self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer());
            
            let selectedIndexvalue = UILabel(frame: CGRectMake(20,50,300,40));
            selectedIndexvalue.center = CGPointMake(160, 284);
            
            selectedIndexvalue.text = "U have selcted \(singletonClass .sharedInstance.indexValue)";
            
            selectedIndexvalue.autoresizingMask = [.FlexibleRightMargin,.FlexibleLeftMargin,.FlexibleWidth];
            
            selectedIndexvalue.backgroundColor = UIColor.whiteColor();
            
          //  self.view.addSubview(selectedIndexvalue);
            
            let yourNibName = UINib(nibName: "customCellTableViewCell", bundle: nil)
            tableview_Stories.registerNib(yourNibName, forCellReuseIdentifier: identifier)

            
//            tableview_Stories .registerClass(customCellTableViewCell.self, forCellReuseIdentifier: identifier);

        }
        
        self.view.backgroundColor = UIColor.blueColor();
    }
    
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return 100;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        var cell: customCellTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? customCellTableViewCell

        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "customCellTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = (tableView.dequeueReusableCellWithIdentifier(identifier) as? customCellTableViewCell)!
        }
     //   cell.textLabel!.text = "\(indexPath.row)";
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80;
    }
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Landscape;
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
