//
//  TableViewCell.swift
//   
//
//  Created by Benjamin Bayel on 12/12/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func nib() -> UINib{
        return UINib(nibName: className, bundle: nil)
    }
    
    class func reuseIdentifier() -> String {
        return className
    }
    
}
