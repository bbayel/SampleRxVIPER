//
//  TextView.swift
//   
//
//  Created by Benjamin Bayel on 23/02/2018.
//  Copyright © 2018 bbayel. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TextView: UITextView {
    
    let bag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let colorStyle = ColorStyle(rawValue: self.placeholderColorStyle) {
            self.textColor = Style.color(colorStyle)
        }
        
        rx.didBeginEditing
            .subscribe(onNext: { [unowned self] _ in
                if self.text == NSLocalizedString(self.localizedPlaceholder, comment:"") {
                    self.text = ""
                    if let colorStyle = ColorStyle(rawValue: self.colorStyle) {
                        self.textColor = Style.color(colorStyle)
                    }
                }
            })
            .disposed(by: bag)
        
        rx.didEndEditing
            .subscribe(onNext: { [unowned self] _ in
                if self.text.count == 0 {
                    self.text = NSLocalizedString(self.localizedPlaceholder, comment:"")
                    if let colorStyle = ColorStyle(rawValue: self.placeholderColorStyle) {
                        self.textColor = Style.color(colorStyle)
                    }
                }
            })
            .disposed(by: bag)
    }

    @IBInspectable var localizedPlaceholder: String = "" {
        didSet {
            text = NSLocalizedString(localizedPlaceholder, comment: "")
        }
    }
    
    @IBInspectable var fontStyle: String = "" {
        didSet {
            if let textStyle = TextStyle(rawValue: fontStyle) {
                font = Style.font(textStyle)
            }
        }
    }
    
    @IBInspectable var placeholderColorStyle: String = ""
    @IBInspectable var colorStyle: String = ""
}
