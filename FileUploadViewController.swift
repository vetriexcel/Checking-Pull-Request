//
//  FileUploadViewController.swift
//  autoLayout
//
//  Created by excelencia on 30/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import UIKit

class FileUploadViewController: UIViewController,UIActionSheetDelegate {

    let query = NSMetadataQuery()
    
    @IBOutlet weak var btnToUpload: UIButton!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            
            menuBtn.target = self.revealViewController();
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:));
            self.revealViewController().panGestureRecognizer().enabled = false;
            
            //self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer());
            //  self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer());
            
        }

    }

    @IBAction func ClickToUpload(sender: AnyObject) {
        
        let updatedActionsheet: UIAlertController = UIAlertController(title: "Select any option to import", message: "", preferredStyle: .ActionSheet)
        
        
        let dropBoxAction = UIAlertAction(title: "DropBox", style: .Default, handler: {
            action in
            
            print("Dropbox");
        })

        let oneDrive = UIAlertAction(title: "oneDrive", style: .Default, handler: {
            action in
            
            print("oneDrive");

        })

        let iCloud = UIAlertAction(title: "iCloud", style: .Default, handler: {
            action in
            
            print("iCloud");
            
            self.query.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]
            
            let pred = NSPredicate(format: "%K ENDSWITH '.txt'", NSMetadataItemFSNameKey);
            
            self.query.predicate = pred;
            
            NSNotificationCenter .defaultCenter().addObserver(self, selector: #selector(FileUploadViewController.queryProcess(_:)), name: NSMetadataQueryDidFinishGatheringNotification, object: self.query);
            
            self.query.startQuery();
            

        })
        
        let close = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            action in
        })
        
        updatedActionsheet.addAction(dropBoxAction);
        updatedActionsheet.addAction(oneDrive);
        updatedActionsheet.addAction(iCloud);
        updatedActionsheet.addAction(close);

        updatedActionsheet.popoverPresentationController?.sourceView = sender as? UIView
        
        //Present the AlertController
        self.presentViewController(updatedActionsheet, animated: true, completion: nil)

        
        
    }
    
    func queryProcess(notification: NSNotification)  {
        
        
        print("Icloud files collected");
        
        self.query.stopQuery()
        
        let resultCounter = self.query.resultCount
        NSLog("%lu", resultCounter)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NSMetadataQueryDidFinishGatheringNotification, object: nil)
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
