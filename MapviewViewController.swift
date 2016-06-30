//
//  MapviewViewController.swift
//  autoLayout
//
//  Created by excelencia on 24/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import UIKit

import MapKit

class MapviewViewController: UIViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    @IBOutlet weak var customMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            
            menuBtn.target = self.revealViewController();
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:));
            
           // self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer());
            self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer());
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
