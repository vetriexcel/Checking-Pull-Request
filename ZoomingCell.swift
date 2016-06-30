//
//  ZoomingCell.swift
//  autoLayout
//
//  Created by excelencia on 28/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import UIKit

class ZoomingCell: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var zoomingCollectionview: UICollectionView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var zoomingSlider: UISlider!
    
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

    
    let cellID :String = "CollectionCell";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if self.revealViewController() != nil {
            
            menuBtn.target = self.revealViewController();
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:));
            
          //  self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer());
            
            self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer());
        }
        
        let layOut : UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        
        layOut.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layOut.itemSize = CGSizeMake(60, 60);
        
        let yourNibName = UINib(nibName: "dragCollectionViewCell", bundle: nil)
        zoomingCollectionview.registerNib(yourNibName, forCellWithReuseIdentifier: cellID)
        zoomingCollectionview.collectionViewLayout = layOut;
        
    
        zoomingSlider.minimumValue = 60.0;
        zoomingSlider.maximumValue = 120.0;
        zoomingSlider.continuous = true;
        zoomingSlider.value = 60.0;
        


    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10;
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let colleCell: dragCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! dragCollectionViewCell
        
        colleCell.backgroundColor = colors[indexPath.row]
        
        colleCell.indexLabel.text = "\(indexPath.row)"
        
        return colleCell

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let size = CGFloat(zoomingSlider.value)

        return CGSizeMake(size, size)
    }


    @IBAction func zoomTapped(sender: AnyObject) {
        
        zoomingCollectionview.collectionViewLayout.invalidateLayout();
        
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
