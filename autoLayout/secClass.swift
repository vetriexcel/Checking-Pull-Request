//
//  secClass.swift
//  autoLayout
//
//  Created by excelencia on 15/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import UIKit

class secClass: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate {

    @IBOutlet weak var customWeview: UIWebView!
    @IBOutlet weak var meuBtn: UIBarButtonItem!
    
    var longPressGesture:UILongPressGestureRecognizer!
    
    var destiPath:NSIndexPath!
    
    
    let headerSize : CGFloat = 44.0;
    let cellID :String = "CollectionCell";
    let collHeadID:String = "HeaderID";
    
    var myCollectionView : UICollectionView!
    
    var colors: [UIColor] = {
        var randomColors = [UIColor]()
        for i in 1...500 {
            let randomRed = CGFloat(arc4random() % 255) / 255.0
            let randomGreen = CGFloat(arc4random() % 255) / 255.0
            let randomBlue = CGFloat(arc4random() % 255) / 255.0
            randomColors.append(UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0))
        }
        return randomColors
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        _ = UIApplication.sharedApplication().delegate as! AppDelegate
        singletonClass.sharedInstance.shouldRotate = true // or false to disable rotation

        if self.revealViewController() != nil {
            
            meuBtn.target = self.revealViewController();
            meuBtn.action = #selector(SWRevealViewController.revealToggle(_:));
            
          //  self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer());
            //self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer());
            
        }

        self.view.backgroundColor = UIColor.redColor();
        
        let layOut : UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        
        layOut.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layOut.itemSize = CGSizeMake(60, 60);
        
        myCollectionView = UICollectionView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height), collectionViewLayout: layOut);
        //Need to register its ID
    
        myCollectionView.delegate = self;
        myCollectionView.dataSource = self;
        
        myCollectionView.backgroundColor = UIColor.whiteColor();
                myCollectionView.autoresizingMask = [.FlexibleWidth,.FlexibleHeight,.FlexibleTopMargin,.FlexibleBottomMargin,.FlexibleLeftMargin,.FlexibleRightMargin];
        
        let yourNibName = UINib(nibName: "dragCollectionViewCell", bundle: nil)
        myCollectionView.registerNib(yourNibName, forCellWithReuseIdentifier: cellID)
        

        
        let lpgr : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(secClass.PressedLongTime))
        lpgr.minimumPressDuration = 0.5
        lpgr.delegate = self
        lpgr.delaysTouchesBegan = true
        myCollectionView?.addGestureRecognizer(lpgr)
        
        self.view .addSubview(myCollectionView);
        
        
    }
    
    var screenWidth: CGFloat {
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.mainScreen().bounds.size.width
        } else {
            return UIScreen.mainScreen().bounds.size.height
        }
    }
    var screenHeight: CGFloat {
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.mainScreen().bounds.size.height
        } else {
            return UIScreen.mainScreen().bounds.size.width
        }
    }
    var screenOrientation: UIInterfaceOrientation {
        return UIApplication.sharedApplication().statusBarOrientation
    }
    
    func PressedLongTime(gesture: UILongPressGestureRecognizer) {
        
        print("Long press gesture recogonizer activated");
        
        
        switch(gesture.state) {
            
        case UIGestureRecognizerState.Began:
            guard let selectedIndexPath = myCollectionView.indexPathForItemAtPoint(gesture.locationInView(myCollectionView)) else {
                break
            }
            
            myCollectionView.beginInteractiveMovementForItemAtIndexPath(selectedIndexPath)
        case UIGestureRecognizerState.Changed:
            myCollectionView.updateInteractiveMovementTargetPosition(gesture.locationInView(gesture.view!))
        case UIGestureRecognizerState.Ended:
            
//            myCollectionView.deleteItemsAtIndexPaths([destiPath])
//            myCollectionView .reloadData()
            myCollectionView.endInteractiveMovement()
            myCollectionView .reloadData()
        default:
            myCollectionView.cancelInteractiveMovement()
        }
        
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let colleCell: dragCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! dragCollectionViewCell
        
    colleCell.backgroundColor = colors[indexPath.row]
        
    colleCell.indexLabel.text = "\(indexPath.row)"
        
        return colleCell
    }
    
    func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath,toIndexPath destinationIndexPath: NSIndexPath) {
        
        destiPath = destinationIndexPath
        
        // swap values if sorce and destination
        let temp = colors[sourceIndexPath.row]
        colors[sourceIndexPath.row] = colors[destinationIndexPath.row]
        colors[destinationIndexPath.row] = temp
        
        
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
