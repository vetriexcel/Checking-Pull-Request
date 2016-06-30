//
//  customCellTableViewCell.swift
//  autoLayout
//
//  Created by excelencia on 23/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import UIKit

class customCellTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var lastTime: UILabel!
    @IBOutlet weak var lastDate: UILabel!
    @IBOutlet weak var storyDescription: UILabel!
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
