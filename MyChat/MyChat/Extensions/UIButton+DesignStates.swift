//
//  UIButton+DesignStates.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 30/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func startWaitingState() {
        self.setTitle("", for: .normal)
        self.isEnabled = false
        self.alpha = 0.5
    }
    
    func endWaitingState() {
        self.isEnabled = true
        self.alpha = 1
        self.setTitle("Go", for: .normal)
    }
}
