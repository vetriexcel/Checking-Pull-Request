//
//  homePageViewController.swift
//  autoLayout
//
//  Created by excelencia on 15/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import UIKit

class homePageViewController: UIViewController {

    @IBOutlet weak var homeSlide: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        _ = UIApplication.sharedApplication().delegate as! AppDelegate
        singletonClass.sharedInstance.shouldRotate = true // or false to disable rotation

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            
            homeSlide.target = self.revealViewController();
            homeSlide.action = #selector(SWRevealViewController.revealToggle(_:));
            
            self.revealViewController().panGestureRecognizer().enabled = false;

            //self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer());
            
          //  self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer());
            
        }
        
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
