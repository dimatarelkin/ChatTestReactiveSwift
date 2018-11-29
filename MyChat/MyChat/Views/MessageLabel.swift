//
//  MessageLabel.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 25/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import UIKit
import Foundation


@IBDesignable class MessageLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat    = 3.0
    @IBInspectable var bottomInset: CGFloat = 3.0
    @IBInspectable var leftInset: CGFloat   = 10.0
    @IBInspectable var rightInset: CGFloat  = 10.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        
        let newRect = rect.inset(by: insets)
        super.drawText(in: newRect)
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}
