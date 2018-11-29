//
//  ChatViewController+KeyboardHandling.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 25/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import UIKit


extension ChatViewController {
    //show
    @objc override func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height + 5, right: 0)
        
        self.changabelConstraint.constant = contentInset.bottom
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
    }
    
    //hide
    @objc override func keyboardWillHide(notification: Notification) {
        self.changabelConstraint.constant = 5
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutSubviews()
        }
    }
}
