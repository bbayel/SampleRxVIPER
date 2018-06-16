//
//  AddressTableViewCell.swift
//  smiile
//
//  Created by Benjamin on 16/06/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import UIKit

class AddressTableViewCell: TableViewCell {

    @IBOutlet weak var labelAddress: Label!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(_ address: String) {
        labelAddress.text = address
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
