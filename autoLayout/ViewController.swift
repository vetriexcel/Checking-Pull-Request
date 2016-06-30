//
//  ViewController.swift
//  autoLayout
//
//  Created by excelencia on 15/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var menuItems: UITableView!
    var dataValue = [String]();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _ = UIApplication.sharedApplication().delegate as! AppDelegate
        singletonClass.sharedInstance.shouldRotate = true // or false to disable rotation


        dataValue.append("First Page");
        dataValue.append("Second Page");
        dataValue.append("Third Page");
        dataValue.append("Home Page");
        dataValue.append("Map page");
        dataValue.append("Web view");
        dataValue.append("Zoom Cell");

        menuItems.tableFooterView = UIView();
        
        

          }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return dataValue.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
        cell.textLabel!.text = dataValue[indexPath.row];
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        singletonClass .sharedInstance.indexValue = indexPath.row;

        switch indexPath.row {
        case 0:
            
            
            performSegueWithIdentifier("FirstPage", sender: nil);
            break;
            
        case 1:
            performSegueWithIdentifier("secondPage", sender: nil);
            break;
            
        case 2:
            performSegueWithIdentifier("ThirdPage", sender: nil);
            break;
        case 3:
            performSegueWithIdentifier("HomePage", sender: nil);
            break;
        case 4:
            performSegueWithIdentifier("mapView", sender: nil);
            break;
        case 5:
            performSegueWithIdentifier("webView", sender: nil);
            break;
        case 6:
            performSegueWithIdentifier("ZoomCells", sender: nil);
            break;
            
        default: break
            
        }
    
    }
}

