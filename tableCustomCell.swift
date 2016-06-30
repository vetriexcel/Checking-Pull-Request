//
//  tableCustomCell.swift
//  autoLayout
//
//  Created by excelencia on 16/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import Foundation

class tableCustomCell: UITableViewCell {
    
    let label1: UILabel = UILabel()
    let imageToShow: UIImageView = UIImageView()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label1);
        contentView.addSubview(imageToShow);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        label1.translatesAutoresizingMaskIntoConstraints = false;
        imageToShow.translatesAutoresizingMaskIntoConstraints = false;
        
        label1.frame = CGRectMake(0, 0, 300, 40);
        imageToShow.frame = CGRectMake(contentView.bounds.width-100, 0, 75, 75);
        
        contentView.addSubview(label1);
        contentView.addSubview(imageToShow);
        
        let viewsDict = ["image" : imageToShow,
                         "name" : label1];
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[name]-200-[image]-|", options: [], metrics: nil, views: viewsDict));
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[name]", options: [], metrics: nil, views: viewsDict));
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[image]", options: [], metrics: nil, views: viewsDict));


//
//
//
        
    }
}
