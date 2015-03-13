//
//  PersonCell.swift
//  ClassRolodex
//
//  Created by Randy McLain on 3/11/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var myCellImageView: UIImageView!
    
    
    @IBOutlet weak var myCellLastName: UILabel!
    @IBOutlet weak var myCellFirstName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
