//
//  PersonCell.swift
//  ClassRolodex
//
//  Created by Randy McLain on 3/11/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    // properties 
    
    // the image view for the table view cell (tvc)
    @IBOutlet weak var myCellImageView: UIImageView!
    // the first name text label for the tvc
    @IBOutlet weak var myCellLastName: UILabel!
    // the last name text label for the tvc
    @IBOutlet weak var myCellFirstName: UILabel!
    
    // builds out the tvc from archive storage.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }// awakeFromNib

    // allows the VC to 
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
