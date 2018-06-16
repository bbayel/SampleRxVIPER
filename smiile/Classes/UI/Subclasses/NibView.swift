//
//  NibView.swift
//   
//
//  Created by Benjamin Bayel on 30/10/2017.
//  Copyright © 2017 bbayel. All rights reserved.
//

import UIKit

class NibView: UIView {
    
    @IBOutlet var view: UIView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let viewFromNib = Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as? UIView
            else { fatalError("Could not load view from nib file.") }
        view = viewFromNib
        translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        addPinnedSubview(view)

    }
    
}
