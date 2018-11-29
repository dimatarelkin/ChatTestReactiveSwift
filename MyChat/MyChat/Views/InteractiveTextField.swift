//
//  TextField+Animation.swift
//  RealmChat
//
//  Created by Aliaksei Piatyha on 10/30/18.
//

import UIKit


class InteractiveTextField: UITextField {
    
    //MARK:- Properties

    private var padding = UIEdgeInsets(top: 0,
                                       left: 15,
                                       bottom: 0,
                                       right: 15)
    
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
  
    
    //MARK:- Methods
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding.left, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding.left, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding.left, dy: 0)
    }
    
    override func awakeFromNib() {
        self.layer.backgroundColor = UIColor.white.cgColor
    }

}
